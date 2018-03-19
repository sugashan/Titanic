package com.titanic.controller.food;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.titanic.entity.FoodComboPackage;
import com.titanic.entity.FoodType;
import com.titanic.service.food.FoodComboPackageManagementService;

@Controller
public class FoodComboPackageManagementController {
	
	@Autowired
	private FoodComboPackageManagementService fcpSerice;
	
	private String redirectUrlString="";
	
	@ModelAttribute("singleUpdatedComboPackage")
	public FoodComboPackage ConstructSingle() {
		return new FoodComboPackage();
	}
	
	// GET ALL COMBO
	@RequestMapping("meals/comboPackage")
	public String foodType(Model model) {
		model.addAttribute("comboPackages", fcpSerice.findAll());
		return "comboPackage";
	}
	
	
	
}
