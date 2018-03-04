package com.titanic.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.titanic.service.user.EmployeeManagementService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeManagementService emService;
	
	@RequestMapping("/employee")
	public String employee(Model model) {
		model.addAttribute("employee", emService.findAll());
		return "employee";
	}
	
	
	
}
