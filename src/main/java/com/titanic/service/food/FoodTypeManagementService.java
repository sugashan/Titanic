package com.titanic.service.food;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.FoodType;
import com.titanic.respository.FoodTypeRepository;

@Service
public class FoodTypeManagementService {
	
	@Autowired
	private FoodTypeRepository fRepository;
	
	// GET ALL FOOD TYPE AS LIST
	public List<FoodType> findAll(){
		return fRepository.findAll();
	}

	// SAVE NEW EMPLOYEE
	public void save(FoodType foodType) {
		System.out.println("saving..");
		fRepository.save(foodType);
	}

	// DELETE A EMPLOYEE
	public void delete(int id) {
		fRepository.delete(findOnebyId(id));
	}
	
	// GET A FOOD TYPE WITH ID
	public FoodType findOnebyId(int id) {
		return fRepository.findOneById(id);
	}

	// UPDATE A EMPLOYEE
	@Transactional
	public FoodType update(FoodType foodType, int id) {
		// TODO
		return findOnebyId(id);
	}
}
