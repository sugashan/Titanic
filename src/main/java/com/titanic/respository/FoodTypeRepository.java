package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.FoodType;

public interface FoodTypeRepository extends JpaRepository<FoodType, Integer> {

	FoodType findOneById(int id);

}
