package com.titanic.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.FoodOrder;
import com.titanic.entity.Orders;

public interface OrderFoodRepository extends JpaRepository<FoodOrder, Integer> {


	List<FoodOrder> findAllByOrder(Orders order);
}
 