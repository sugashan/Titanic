package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Meal;

public interface MealRepository extends JpaRepository<Meal, Integer> {

	Meal findOneById(int id);



}
