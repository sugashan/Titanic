package com.titanic.service.orderbooking;

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
import com.titanic.entity.PickUpDeskOrder;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.other.UniqueIdManager;
import com.titanic.respository.DeliveryTypeOrderRepository;
import com.titanic.respository.DineInOrderRepository;
import com.titanic.respository.OrderFoodRepository;
import com.titanic.respository.OrdersRepository;
import com.titanic.respository.PaymentRepository;
import com.titanic.respository.PickUpTypeOrderRepository;

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
	
	// GET ALL ORDERS AS LIST
	public List<Orders> findAll() {
		return oRepository.findAll();
	}
	
	// GET SELECTED ORDER FOR DINE IN
	public Orders findOneById(int id) {
		Orders order = oRepository.findById(id);
		return order;
	}
	
	// GET A DELIVERY ORDER
	public DeliveryOrder findOneDeliveryById(int id) {
		return dtoRepository.findByOrder(findOneById(id));
	}

	// GET A PICKUP ORDER
	public PickUpDeskOrder findOnePickUpById(int id) {
		return ptoRepository.findByOrder(findOneById(id));
	}
	
	// GET A DINE-IN ORDER
	public DineInOrder findOneDineInById(int id) {
		return diRepository.findByOrder(findOneById(id));
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
								DeliveryOrder dyOrder = mapper.readValue(
																	deliveryPickUpStringInfo,
																	mapper.getTypeFactory().constructCollectionType( null, DeliveryOrder.class));
						
								dyOrder.setOrder(order);
								dtoRepository.save(dyOrder);
						} catch (Exception e) {
							e.printStackTrace();
						}
				}
				else if(TitanicMessageConstant.PICK_UP_ORDER.equals(orderType)) {
					System.out.println("-------------PICK_UP_ORDER-----------");
					
						try {
								PickUpDeskOrder pdOrder = mapper.readValue(
																	deliveryPickUpStringInfo,
																	mapper.getTypeFactory().constructCollectionType( null, PickUpDeskOrder.class));
						
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
	public Orders update(@Valid Orders order, int id) {
		// TODO Auto-generated method stub
		return null;
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
