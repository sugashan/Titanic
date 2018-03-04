package com.titanic.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.titanic.entity.Employee;
import com.titanic.service.user.EmployeeManagementService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeManagementService emService;
	
//	@ModelAttribute("newEmployee")
//	public Employee construct() {
//		return new Employee();
//	}
	
	@RequestMapping("/employee")
	public String employee(Model model) {
		model.addAttribute("newEmployee", new Employee());
		model.addAttribute("employee", emService.findAll());
		return "employee";
	}
	
	@RequestMapping(value="/employee", method=RequestMethod.POST, consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
	public String addEmployee(@ModelAttribute("newEmployee") Employee employee, Model model) {
		emService.save(employee);
		model.addAttribute("employee", emService.findAll());
		return "employee";
	}
		
}
