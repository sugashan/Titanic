package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.DeliveryOrder;
import com.titanic.entity.Orders;

public interface DeliveryTypeOrderRepository extends JpaRepository<DeliveryOrder, Integer> {

	DeliveryOrder findByOrder(Orders order);


}
