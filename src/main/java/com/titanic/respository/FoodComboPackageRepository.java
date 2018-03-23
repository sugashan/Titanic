package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.FoodComboPackage;

public interface FoodComboPackageRepository extends JpaRepository<FoodComboPackage, Integer> {


	FoodComboPackage findOneById(int id);

}
