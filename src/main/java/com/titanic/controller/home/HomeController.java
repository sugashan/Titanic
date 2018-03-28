package com.titanic.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.titanic.entity.FeedBack;
import com.titanic.entity.MealsSchedule;
import com.titanic.service.food.MealManagementService;
import com.titanic.service.review.ReviewManagementService;

@Controller
public class HomeController {
	
//	@Autowired
//	private HomeManagementService hmService;
	
	@Autowired
	private ReviewManagementService rmService;
	
	@Autowired
	private MealManagementService mmService;
	
	@ModelAttribute("newFeedBack")
	public FeedBack Construct() {
		return  new FeedBack();
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("comments", rmService.getAllComments());
		model.addAttribute("meals", mmService.findAll());
		
		for (MealsSchedule ms : MealsSchedule.values()) {
			model.addAttribute( ms.getName() + "Meals", mmService.findByPreferedTime(ms.getName()));
		}
		return "home";
	}
}