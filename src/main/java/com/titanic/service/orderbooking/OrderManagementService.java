package com.titanic.service.orderbooking;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.titanic.entity.Customer;
import com.titanic.entity.DeliveryOrder;
import com.titanic.entity.DineInOrder;
import com.titanic.entity.FoodOrder;
import com.titanic.entity.Orders;
import com.titanic.entity.Payment;
import com.titanic.entity.PickUpDeskOrder;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.other.UniqueIdManager;
import com.titanic.respository.DeliveryTypeOrderRepository;
import com.titanic.respository.DineInOrderRepository;
import com.titanic.respository.OrderFoodRepository;
import com.titanic.respository.OrdersRepository;
import com.titanic.respository.PaymentRepository;
import com.titanic.respository.PickUpTypeOrderRepository;
import com.titanic.service.user.EmployeeManagementService;
import com.titanic.service.user.UserCommonService;
import com.titanic.session.CurrentUser;

@Service
@Transactional
public class OrderManagementService {
	
	@Autowired
	private OrdersRepository oRepository;
	
	@Autowired
	private PickUpTypeOrderRepository ptoRepository;
	
	@Autowired
	private DeliveryTypeOrderRepository dtoRepository;
	
	@Autowired
	private OrderFoodRepository ofRepository;
	
	@Autowired
	private PaymentRepository pRepository;
	
	@Autowired
	private DineInOrderRepository diRepository;
	
	@Autowired
	private UserCommonService ucService;
	
	@Autowired
	private EmployeeManagementService emService;
	
	
	// GET ALL ORDERS AS LIST
	public List<Orders> findAll() {
		return oRepository.findAll();
	}
	
	// GET SELECTED ORDER
	@Transactional
	public Orders findOneById(int id) {
		Orders order = oRepository.findById(id);
		List<FoodOrder> foodOrder = new ArrayList<FoodOrder>();
		
		for(FoodOrder fd: order.getFoodOrder()){
			foodOrder.add(fd);
		}
		order.setFoodOrder(foodOrder);
		return order;
	}
	
	// GET A DELIVERY ORDER
	public DeliveryOrder findOneDeliveryById(int id) {
		Orders order = findOneById(id);
		return dtoRepository.findByOrder(order);
	}

	// GET A PICKUP ORDER
	public PickUpDeskOrder findOnePickUpById(int id) {
		Orders order = findOneById(id);
		return ptoRepository.findByOrder(order);
	}
	
	// GET A DINE-IN ORDER
	public DineInOrder findOneDineInById(int id) {
		Orders order = findOneById(id);
		return diRepository.findByOrder(order);
	}

	// SAVE NEW ORDER
	public void save(@Valid Orders order) {
		ObjectMapper mapper = new ObjectMapper();
		
		order.setOutletBranch("Nelliyady-Titanic");
		order.setOrderStatus(TitanicMessageConstant.ACCEPTED_ORDER);
		order.setOrderCode(UniqueIdManager.getUniqueCode("Ord", 8));
		
		String orderType = order.getOrderType().toString();
		String deliveryPickUpStringInfo = order.getTempStringForDeliveryOpt();
		
		List<FoodOrder> fdList = order.getFoodOrder();
		for(FoodOrder fd : fdList ) {
			fd.setOrder(order);
		}
		order.setFoodOrder(fdList);
		if(TitanicMessageConstant.DELIVERY_ORDER.equals(orderType)) {
			order.setDescription("Order from Dine-In for "+ order.getCustomer().getUser().getName());
			order.getPayment().setT_date(order.getOrderedOn().toString());
		}
		Payment payment = order.getPayment();
		payment.setOrder(order);
		
		
		pRepository.save(order.getPayment());
		Orders ord = oRepository.save(order);
		
		if( ord != null) {
			ofRepository.saveAll(order.getFoodOrder());
			
			if(TitanicMessageConstant.DINE_IN_ORDER.equals(orderType)) {
				System.out.println("-----------DINE_IN_ORDER------------");
				DineInOrder diOrder = new DineInOrder();
				diOrder.setOrder(order);
				diRepository.save(diOrder);
			}
			else if(deliveryPickUpStringInfo != "" && deliveryPickUpStringInfo != null) {
				System.out.println(deliveryPickUpStringInfo);
				if(TitanicMessageConstant.DELIVERY_ORDER.equals(orderType)) {
					System.out.println("-----------DELIVERY_ORDER------------");
					
					try {
							DeliveryOrder dyOrder = mapper.readValue(deliveryPickUpStringInfo, DeliveryOrder.class);
							dyOrder.setOrder(order);
							dtoRepository.save(dyOrder);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				else if(TitanicMessageConstant.PICK_UP_ORDER.equals(orderType)) {
					System.out.println("-------------PICK_UP_ORDER-----------");
					
					try {
							PickUpDeskOrder pdOrder = mapper.readValue(deliveryPickUpStringInfo, PickUpDeskOrder.class);
							pdOrder.setOrder(order);
							ptoRepository.save(pdOrder);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	
	// UPDATE A ORDER
	public void update(@Valid Orders order, int id, String orderType) {
		Orders existingOrder = findOneById(id);
		existingOrder.setOrderStatus(order.getOrderStatus());
		
		Payment payment = new Payment();
		payment.setOrder(order);
		payment.setTotal(existingOrder.getPayment().getTotal());
		payment.setGiven(order.getPayment().getGiven());
		payment.setAddedOn(existingOrder.getPayment().getAddedOn());
		if(order.getPayment().getT_date() != null) {
			payment.setT_date(order.getPayment().getT_date());
		}
		else {
			payment.setT_date(existingOrder.getPayment().getT_date());
		}
		payment.setDescription(order.getPayment().getDescription());
		
		payment.setEmployee(emService.findByUser(ucService.findOneByUserName(CurrentUser.me())));
		existingOrder.setPayment(payment);
		
		pRepository.save(payment);
		oRepository.save(existingOrder);
		
	}
	
	// GET LAST INSERTED ID
	public String getLastInsertedMealId() {
		return oRepository.getLastInsertedId();
	}

	// GET LIST OF ORDERS FOR CUSTOMER
	public Object findAllByCustomer(Customer currCustomer) {
		return oRepository.findByCustomer(currCustomer);
	}

}
