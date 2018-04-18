package com.titanic.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.titanic.entity.Customer;
import com.titanic.entity.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {
	
	@Query("SELECT MAX(id) FROM Orders")
	String getLastInsertedId();

	Orders findById(int id);

	List<Orders> findByCustomer(Customer currCustomer);


	List<Orders> findTop50ByOrderByOrderedOnDesc();
	
}
