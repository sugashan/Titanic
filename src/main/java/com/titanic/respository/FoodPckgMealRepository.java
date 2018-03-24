package com.titanic.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.FoodComboPackage;
import com.titanic.entity.PackageMeals;

public interface FoodPckgMealRepository extends JpaRepository<PackageMeals , Integer> {


	List<PackageMeals> findAllByFcpkg(FoodComboPackage fcp);

}
