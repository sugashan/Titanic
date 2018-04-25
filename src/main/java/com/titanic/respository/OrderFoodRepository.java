package com.titanic.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.titanic.entity.FoodOrder;
import com.titanic.entity.Orders;

public interface OrderFoodRepository extends JpaRepository<FoodOrder, Integer> {


	List<FoodOrder> findAllByOrder(Orders order);
	
	@Query("SELECT COUNT(id) FROM FoodOrder WHERE status = :status and mealId = :mealId")
	int countByMealIdInState( @Param("status") String status, @Param("mealId") int mealId);
}
 