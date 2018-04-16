package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Orders;
import com.titanic.entity.PickUpDeskOrder;

public interface PickUpTypeOrderRepository extends JpaRepository<PickUpDeskOrder, Integer> {

	PickUpDeskOrder findByOrder(Orders order);


}
