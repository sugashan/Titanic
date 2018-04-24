package com.titanic.respository;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;
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

	@Query("SELECT COUNT(orderCode) FROM Orders WHERE orderStatus IS NOT 'Finished'")
	int countByOrderStatus();

	@Query("SELECT COUNT(orderCode) FROM Orders WHERE orderType = :orderType")
	int countByOrderType(@Param("orderType") String orderType);

	@Query("SELECT COUNT(orderCode) FROM Orders WHERE orderedOn <= :today")
	int countByTodayAndOrderedOn(@Param("today") Date today);
	
}
