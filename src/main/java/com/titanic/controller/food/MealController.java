package com.titanic.controller.food;


import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.titanic.entity.Meal;
import com.titanic.service.food.FoodTypeManagementService;
import com.titanic.service.food.MealManagementService;

@Controller
public class MealController {
	
	@Autowired
	private MealManagementService mmService;
	@Autowired
	private FoodTypeManagementService ftService;
	
	private String redirectUrlString="";
	
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
		model.addAttribute("mealType",  ftService.findAll());
		model.addAttribute("meal", mmService.findAll());
		return "meal";
	}
	
	// SINGLE MEAL
	@RequestMapping("/meals/meal-detail/{id}")
	public String singleFoodType(Model model, @PathVariable int id) {
		model.addAttribute("singleMeal", mmService.findOnebyId(id));
		return "meal-detail";
	}
	
	// ADD NEW MEAL
	@RequestMapping(value="/meals/meal", method=RequestMethod.POST)
	public String addFoodType( @Valid @ModelAttribute("newMeal") Meal meal, BindingResult errors, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "redirect:/meals/meal.do?success=false&msg=Added Failed";
		}
		else {
//			try {
				meal.setFoodType(ftService.findOnebyId(meal.getFoodTypeId()));
				mmService.save(meal);
				redirectUrlString = "redirect:/meals/meal.do?success=true&msg=Successfully Added";
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
		}
		return redirectUrlString;
	}
	
	// UPDATE EXITING MEAL
	@RequestMapping(value="/meals/meal-detail/{id}", method=RequestMethod.POST)
	public String updateMeal(@Valid @ModelAttribute("singleUpdatedMeal")  Meal meal, BindingResult errors, @PathVariable int id, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "redirect:/meals/meal-detail.do?success=false&msg=Updated Failed";
		}
		else {
			meal.setFoodType(ftService.findOnebyId(meal.getFoodTypeId()));
			mmService.update(meal, id);
			redirectUrlString = "redirect:/meals/meal-detail.do?success=true&msg=Successfully Updated";
		}
		return redirectUrlString;
	}
	
	// DELETE MEAL
	@RequestMapping(value="/meals/deleteMeal/{id}")
	public String deleteMeal(@PathVariable int id, Model model) {
		mmService.delete(id);
		return "redirect:/meals/meal.do?success=true&msg=Successfully Deleted";
	}
	
	// LAST INSERTED MEAL IN GIVEN TYPE
	@RequestMapping(value="/meals/lastMealId")
	@ResponseBody
	public String lastInsertedMealId(@RequestParam String code) {
		return mmService.getLastInsertedMealId(code);
	}
}
