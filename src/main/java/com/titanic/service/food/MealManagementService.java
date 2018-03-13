package com.titanic.service.food;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Meal;
import com.titanic.entity.User;
import com.titanic.respository.MealRepository;
import com.titanic.respository.UserRepository;
import com.titanic.session.CurrentUser;

@Service
public class MealManagementService {
	
	@Autowired
	private MealRepository mRepository;
	
	@Autowired
	private UserRepository uRepository;
	
	// GET ALL MEAL AS LIST
	public List<Meal> findAll(){
		return mRepository.findAll();
	}

	// SAVE NEW MEAL
	public void save(Meal meal) {
		CurrentUser currUser = new CurrentUser();
		User user = uRepository.findByUserName(currUser.me());
		meal.setAddedByUser(user);
		mRepository.save(meal);
	}

	// DELETE A MEAL
	public void delete(int id) {
		mRepository.delete(findOnebyId(id));
	}
	
	// GET A FOOD TYPE WITH ID
	public Meal findOnebyId(int id) {
		return mRepository.findOneById(id);
	}

	// UPDATE A EMPLOYEE
	@Transactional
	public Meal update(Meal meal, int id) {
		// TODO
		return findOnebyId(id);
	}
}
