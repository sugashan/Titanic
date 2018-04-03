package com.titanic.service.orderbooking;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.titanic.entity.Customer;
import com.titanic.entity.Orders;
import com.titanic.respository.OrdersRepository;

@Service
public class OrderManagementService {
	
	@Autowired
	private OrdersRepository oRepository;

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
		// Check delivery type and add those relavent detail into table, payments??
		oRepository.save(order);
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
	public List<Orders> findAllByCustomer(Customer currCustomer) {
		return oRepository.findByCustomer(currCustomer);
	}

}
