package com.titanic.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.titanic.entity.Customer;
import com.titanic.entity.FeedBack;
import com.titanic.entity.Inquiry;
import com.titanic.entity.MealsSchedule;
import com.titanic.entity.User;
import com.titanic.service.food.MealManagementService;
import com.titanic.service.orderbooking.OrderManagementService;
import com.titanic.service.reviewandinquiry.ReviewManagementService;
import com.titanic.service.user.CustomerManagementService;
import com.titanic.session.CurrentUser;

@Controller
public class HomeController {
	
//	@Autowired
//	private HomeManagementService hmService;
	
	@Autowired
	private ReviewManagementService rmService;
	
	@Autowired
	private MealManagementService mmService;
	
	@Autowired
	private OrderManagementService omService;
	
	@Autowired
	private CustomerManagementService cmService;
	
	
	@ModelAttribute("newFeedBack")
	public FeedBack ConstructFeedBack() {
		return  new FeedBack();
	}
	
	@ModelAttribute("newInquiry")
	public Inquiry ConstructInquiry() {
		return new Inquiry();
	}
	
	@ModelAttribute("currentLoggedCustomer")
	public User ConstructUser() {
		return  new User();
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("comments", rmService.getAllComments());
		model.addAttribute("meals", mmService.findAll());
		
		Customer currCustomer = cmService.findOneByName(CurrentUser.me());
		model.addAttribute("myProfile", currCustomer);
		
		model.addAttribute("myOrders", omService.findAllByCustomer(currCustomer));
		
		for (MealsSchedule ms : MealsSchedule.values()) {
			model.addAttribute( ms.getName() + "Meals", mmService.findByPreferedTime(ms.getName()));
		}
		return "home";
	}
}