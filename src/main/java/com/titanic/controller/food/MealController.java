package com.titanic.controller.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.titanic.entity.Meal;
import com.titanic.service.food.FoodTypeManagementService;
import com.titanic.service.food.MealManagementService;

@Controller
public class MealController {
	
	
	@Autowired
	private MealManagementService mmService;
	private FoodTypeManagementService ftService;
	
	@ModelAttribute("newMeal")
	public Meal Construct() {
		return new Meal();
	}
	
	@ModelAttribute("singleUpdatedMeal")
	public Meal ConstructSingle() {
		return new Meal();
	}
	
	// GET ALL MEAL
	@RequestMapping("/meals/meal")
	public String meals(Model model) {
		model.addAttribute("mealType", ftService.findAll());
		model.addAttribute("meal", mmService.findAll());
		return "meal";
	}
	
	// SINGLE MEAL
	@RequestMapping("/meals/singleMeal/{id}")
	public String singleFoodType(Model model, @PathVariable int id) {
		model.addAttribute("singleMeal", mmService.findOnebyId(id));
		return "meal-detail";
	}
	
	// ADD NEW MEAL
	@RequestMapping(value="/meals/meal", method=RequestMethod.POST)
	public String addFoodType(@ModelAttribute("newMeal") Meal meal, BindingResult errors, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
		}
		else {
//			try {
		//		System.out.println(JsonFormer.form(employee));
				mmService.save(meal);
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
		}
		return "redirect:/meals/meal?success=true&msg=Successfully Added";
	}
	
	// UPDATE EXITING MEAL
	@RequestMapping(value="/meals/singleMeal/{id}", method=RequestMethod.POST)
	public String updateMeal(@ModelAttribute("singleUpdatedMeal")  Meal meal, @PathVariable int id, Model model) {
		System.out.println(meal.getName() + "----contact");
		mmService.update(meal, id);
		return "redirect:/meals/meal-detail?success=true&msg=Successfully Updated";
	}
	
	// DELETE MEAL
	@RequestMapping(value="/meals/deleteMeal/{id}")
	public String deleteMeal(@PathVariable int id, Model model) {
		mmService.delete(id);
		return "redirect:/meals/meal?success=true&msg=Successfully Deleted";
	}
}
