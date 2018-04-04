package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.FoodOrder;

public interface OrderFoodRepository extends JpaRepository<FoodOrder, Integer> {

}
