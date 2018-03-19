package com.titanic.service.food;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.titanic.entity.FoodComboPackage;
import com.titanic.respository.FoodComboPackageRepository;

@Service
public class FoodComboPackageManagementService {
	
	@Autowired
	private FoodComboPackageRepository fcpRepository;

	// GET ALL FOOD COMBO
	public List<FoodComboPackage> findAll() {
		return fcpRepository.findAll();
	}

}
