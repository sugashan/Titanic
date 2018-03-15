package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.titanic.entity.Meal;

public interface MealRepository extends JpaRepository<Meal, Integer> {

	@Query("SELECT MAX(id) FROM Meal WHERE code LIKE CONCAT('%',:code,'%')")
	String getLastInsertedId(@Param("code") String code);
	
	Meal findOneById(int id);



}
