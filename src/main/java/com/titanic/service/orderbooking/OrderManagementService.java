package com.titanic.service.orderbooking;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.titanic.entity.Customer;
import com.titanic.entity.Orders;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.respository.DeliveryTypeOrderRepository;
import com.titanic.respository.OrderFoodRepository;
import com.titanic.respository.OrdersRepository;
import com.titanic.respository.PaymentRepository;
import com.titanic.respository.PickUpTypeOrderRepository;

@Service
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
	
	// GET ALL ORDERS AS LIST
	public List<Orders> findAll() {
		return oRepository.findAll();
	}
	
	// GET SELECTED ORDER
	public Orders findOneById(int id) {
		return oRepository.findById(id);
	}

	// SAVE NEW ORDER
	public void save(@Valid Orders order) {
		String orderType = order.getOrderType().toString();
		System.out.println(orderType);
		if( orderType == TitanicMessageConstant.PICK_UP_ORDER) {
			System.out.println("-----------------------");
			
		}
		else if(orderType == TitanicMessageConstant.DELIVERY_ORDER) {
			
		}
		ptoRepository.save(order.getPickUpOrder());
		dtoRepository.save(order.getDeliveryOrder());
		pRepository.save(order.getPayment());
		oRepository.save(order);
		ofRepository.saveAll(order.getFoodOrder());
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
