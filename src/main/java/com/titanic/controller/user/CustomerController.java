package com.titanic.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.titanic.service.user.CustomerManagementService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerManagementService cmService;
	
	private String redirectUrlString="";
	
	// GET ALL CUSTOMERS
	@RequestMapping("/users/customer")
	public String employee(Model model) {
		model.addAttribute("customer", cmService.findAll());
		return "customer";
	}
	
	// SINGLE USER
	@RequestMapping("/users/singleCustomer/{id}")
	public String singleEmployee(Model model, @PathVariable int id) {
		model.addAttribute("singleCustomer", cmService.findOnebyId(id));
		return "customer-detail";
	}
			
}
