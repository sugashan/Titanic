package com.titanic.controller.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.titanic.entity.FoodType;
import com.titanic.service.food.FoodTypeManagementService;

@Controller
public class FoodTypeController {

	@Autowired
	private FoodTypeManagementService fmService;
	
	@ModelAttribute("newFoodType")
	public FoodType Construct() {
		return new FoodType();
	}
	
	@ModelAttribute("singleUpdatednewFoodType")
	public FoodType ConstructSingle() {
		return new FoodType();
	}
	
	@RequestMapping("/foodType")
	public String foodType(Model model) {
		model.addAttribute("foodType", fmService.findAll());
		return "foodType";
	}
	
	// SINGLE USER
	@RequestMapping("/singlefoodType/{id}")
	public String singleFoodType(Model model, @PathVariable int id) {
		model.addAttribute("singleFoodType", fmService.findOnebyId(id));
		return "foodType-detail";
	}
	
	// ADD NEW USER
	@RequestMapping(value="/foodType", method=RequestMethod.POST)
	public String addFoodType(@ModelAttribute("newFoodType") FoodType foodType, BindingResult errors, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
		}
		else {
//			try {
		//		System.out.println(JsonFormer.form(employee));
				fmService.save(foodType);
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
		}
		model.addAttribute("foodType", fmService.findAll());
		return "foodType";
	}
	
	// UPDATE EXITING USER
	@RequestMapping(value="/singleFoodType/{id}", method=RequestMethod.POST)
	public String updateFoodType(@ModelAttribute("singleUpdatednewFoodType") FoodType foodType, @PathVariable int id, Model model) {
		System.out.println(foodType.getName() + "----contact");
		//	model.addAttribute("singleEmployee",fmService.update(employee, id));
		return "foodType-detail";
	}
	
	// DELETE USER
	@RequestMapping(value="/deleteFoodType/{id}")
	public String deleteFoodType(@PathVariable int id, Model model) {
		fmService.delete(id);
		model.addAttribute("foodType", fmService.findAll());
		return "foodType";
	}
}
