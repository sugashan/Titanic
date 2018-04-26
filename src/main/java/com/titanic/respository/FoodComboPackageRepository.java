package com.titanic.respository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.titanic.entity.FoodComboPackage;

public interface FoodComboPackageRepository extends JpaRepository<FoodComboPackage, Integer> {


	FoodComboPackage findOneById(int id);

	@Query("SELECT fCP from FoodComboPackage fCP where fCP.validUntil >= :now ")
	List<FoodComboPackage> findFirstByValidUntil(@Param("now") String today, Pageable pageable);


}
