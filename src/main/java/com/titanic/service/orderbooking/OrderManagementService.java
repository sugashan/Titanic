package com.titanic.service.orderbooking;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import javax.validation.Valid;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import com.titanic.entity.Customer;
import com.titanic.entity.DeliveryOrder;
import com.titanic.entity.DineInOrder;
import com.titanic.entity.Employee;
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
import com.titanic.service.reviewandinquiry.NotificationManagementService;
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
	
	@Autowired 
	private NotificationManagementService nmService;
	
	
	// GET ALL ORDERS AS LIST
	public List<Orders> findAll() {
		return oRepository.findTop50ByOrderByOrderedOnDesc();
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
	public DeliveryOrder findOneDeliveryByOrderId(int id) {
		Orders order = findOneById(id);
		return dtoRepository.findByOrder(order);
	}

	// GET A PICKUP ORDER
	public PickUpDeskOrder findOnePickUpByOrderId(int id) {
		Orders order = findOneById(id);
		return ptoRepository.findByOrder(order);
	}
	
	// GET A DINE-IN ORDER
	public DineInOrder findOneDineInByOrderId(int id) {
		Orders order = findOneById(id);
		return diRepository.findByOrder(order);
	}

	// SAVE NEW ORDER
	public Orders save(@Valid Orders order) {
		ObjectMapper mapper = new ObjectMapper();
		
		order.setOutletBranch("Nelliyady-Titanic");
		order.setOrderCode(UniqueIdManager.getUniqueCode("Ord", 8));
		
		String orderType = order.getOrderType().toString();
		String deliveryPickUpStringInfo = order.getTempStringForDeliveryOpt();
		
		List<FoodOrder> fdList = order.getFoodOrder();
		for(FoodOrder fd : fdList ) {
			fd.setOrder(order);
		}
		order.setFoodOrder(fdList);
		if(TitanicMessageConstant.DINE_IN_ORDER.equals(orderType)) {
			order.getPayment().setT_date(new Date().toString());
			order.setOrderStatus(TitanicMessageConstant.FINISHED_ORDER);
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
			
			nmService.getAndSaveNotification(TitanicMessageConstant.RECEIVED_ORDER.toString(), order);
		}
		return ord;
	}
	
	// UPDATE ORDER STATUS ONLY
	public void changeStatsOnly( String orderStatus, int id, String orderType) {
		Orders existingOrder = findOneById(id);
		existingOrder.setOrderStatus(orderStatus);
		oRepository.save(existingOrder);
	}
	
	// UPDATE A ORDER
	@PreAuthorize(value = "hasAnyRole('ROLE_ADMIN', 'ROLE_RECEPTIONIST')")
	public void update(@Valid Orders order, int id, String orderType) {
		Orders existingOrder = findOneById(id);
		existingOrder.setOrderStatus(order.getOrderStatus());
		
		if(order.getPayment().getGiven() != 0) {
			Payment payment = new Payment();
			payment.setOrder(existingOrder);
			payment.setTotal(existingOrder.getPayment().getTotal());
			payment.setGiven(order.getPayment().getGiven());
			payment.setAddedOn(existingOrder.getPayment().getAddedOn());
			if(order.getPayment().getT_date() != null) {
				payment.setT_date(order.getPayment().getT_date());
			}
			else {
				payment.setT_date(new Date().toString());
			}
			payment.setDescription(order.getPayment().getDescription());
			
			payment.setEmployee(emService.findByUser(ucService.findOneByUserName(CurrentUser.me())));
			existingOrder.setPayment(payment);
			
			pRepository.save(payment);
		}
		oRepository.save(existingOrder);
		
		if(TitanicMessageConstant.DELIVERY_ORDER.equals(orderType)) {
			DeliveryOrder  ddOrder = findOneDeliveryByOrderId(existingOrder.getId());
			
			Employee employee = order.getHandledEmployee();
			if(employee != null) {
				ddOrder.setEmployee(employee);
				dtoRepository.save(ddOrder);
			}
		}

		nmService.getAndSaveNotification(order.getOrderStatus(), existingOrder);
	
	}
	

	// GET LAST INSERTED ID
	public String getLastInsertedMealId() {
		return oRepository.getLastInsertedId();
	}

	// GET LIST OF ORDERS FOR CUSTOMER
	public Object findAllByCustomer(Customer currCustomer) {
		return oRepository.findByCustomer(currCustomer);
	}

	// DELETING A ORDER
	public void delete(int id, String orderType) {
		if(TitanicMessageConstant.DINE_IN_ORDER.equals(orderType)) {
			diRepository.delete(findOneDineInByOrderId(id));
		}
		if(TitanicMessageConstant.DELIVERY_ORDER.equals(orderType)) {
			dtoRepository.delete(findOneDeliveryByOrderId(id));
		}
		if(TitanicMessageConstant.PICK_UP_ORDER.equals(orderType)) {
			ptoRepository.delete(findOnePickUpByOrderId(id));
		}
	}

	// COUNT NEW ORDERS
	public int countNewOrders() {
		return oRepository.countByOrderStatus();
	}

	// COUNT WITH TYPE ORDERS
	public int countByOrderType(String orderType) {
		return oRepository.countByOrderType(orderType);
	}

	// COUNT BETWEEN TYPE ORDERED ON AND TODAY
	public int countOrdersBetweenTodayAndOrderedOn(Date today) {
		return oRepository.countByTodayAndOrderedOn(today);
	}

}
