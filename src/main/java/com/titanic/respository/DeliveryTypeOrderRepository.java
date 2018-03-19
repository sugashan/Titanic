package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.DeliveryOrder;

public interface DeliveryTypeOrderRepository extends JpaRepository<DeliveryOrder, Integer> {


}
