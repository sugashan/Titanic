package com.titanic.service.food;

import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Meal;
import com.titanic.respository.MealRepository;

/**
 * @author S.Sugashan
 * @CreatedOn 03rd March 2018
 * @Purpose Manager Service For Meal
 */
@Service
public class MealManagementService {
	
	@Autowired
	private MealRepository mRepository;
	
	
	// GET ALL MEAL AS LIST
	public List<Meal> findAll(){
		return mRepository.findAll();
	}

	// SAVE NEW MEAL
	public void save(Meal meal) {
		mRepository.save(meal);
	}

	// DELETE A MEAL
	@PreAuthorize(value = "hasAnyRole('ROLE_ADMIN', 'ROLE_COOK', 'ROLE_RECEPTIONIST')")
	public void delete(int id) {
		mRepository.delete(findOnebyId(id));
	}
	
	// GET A FOOD TYPE WITH ID
	public Meal findOnebyId(int id) {
		return mRepository.findOneById(id);
	}

	// UPDATE A MEAL
	@Transactional
	public Meal update(Meal meal, int id) {
		// TODO
		return findOnebyId(id);
	}
	
	// GET THE LAST INSERTED MEAL ID
	public String getLastInsertedMealId(String code) {
		String lastId = "0";
		lastId = mRepository.getLastInsertedId(code);
		if(lastId == null) {
			return lastId = "0";
		}
		return lastId;
	}
	
	// GET MEAL WITHIN ITEM TYPE
	public Meal findByItemType(String name) {
		return mRepository.findByItemCatergory(name);
	}

	// GET MEAL AND CHANGED INTO STRING 
	public String getAllMealMapString() throws JSONException {
		List<Meal> result = findAll();
		JSONArray jsonResultArry = new JSONArray();
		for(Meal meal: result) {
			JSONObject object = new JSONObject();
			object.put("id", meal.getId());
			object.put("name", meal.getName());
			jsonResultArry.put(object);
		}
		return jsonResultArry.toString();
	}
}
