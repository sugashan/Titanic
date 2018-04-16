package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.DineInOrder;
import com.titanic.entity.Orders;

public interface DineInOrderRepository extends JpaRepository<DineInOrder, Integer> {

	DineInOrder findByOrder(Orders order);


}
