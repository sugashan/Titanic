package com.titanic.controller.user;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.titanic.entity.Employee;
import com.titanic.service.user.EmployeeManagementService;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeManagementService emService;
	
	
	private String redirectUrlString="";
	
	@ModelAttribute("newEmployee")
	public Employee Construct() {
		return  new Employee();
	}
	
	@ModelAttribute("singleUpdatedEmployee")
	public Employee ConstructSingle() {
		return new Employee();
	}
	
	// GET ALL EMPLOYEE
	@RequestMapping("users/employee")
	public String employee(Model model) {
		model.addAttribute("roles", emService.findAllRoles());
		model.addAttribute("employee", emService.findAll());
		return "employee";
	}
	
	// SINGLE USER
	@RequestMapping("users/employee-detail/{id}")
	public String singleEmployee(Model model, @PathVariable int id) {
		model.addAttribute("role", emService.findAllRoles());
		model.addAttribute("singleEmployee", emService.findOnebyId(id));
		return "employee-detail";
	}
	
	// ADD NEW USER
	@RequestMapping(value="users/employee", method=RequestMethod.POST)
	public String addEmployee( @Valid @ModelAttribute("newEmployee") Employee employee, BindingResult errors, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "redirect:/users/employee.do?success=false&msg=Registered Failed";
		}
		else {
//			try {
		//		System.out.println(JsonFormer.form(employee));
			employee.getUser().setRole(emService.findRoleById(employee.getUser().getRoleId()));
				emService.save(employee);
				redirectUrlString = "redirect:/users/employee.do?success=true&msg=Successfully Registered";
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
		}
		return redirectUrlString;
	}
	
	// UPDATE EXITING USER
	@RequestMapping(value="users/employee-detail/{id}", method=RequestMethod.POST)
	public String updateEmployee(@Valid @ModelAttribute("singleUpdatedEmployee") Employee employee, BindingResult errors, @PathVariable int id, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "redirect:/users/employee-detai.do?success=false&msg=Update Failed";
		}
		else {
		employee.getUser().setRole(emService.findRoleById(employee.getUser().getRoleId()));
		emService.update(employee, id);
		redirectUrlString = "redirect:/users/employee-detail.do?success=true&msg=Successfully Updated";
		}
		return redirectUrlString;
	}
	
	// DELETE USER
	@RequestMapping(value="users/deleteEmployee/{id}")
	public String deleteEmployee(@PathVariable int id, Model model) {
		Employee employee = emService.findOnebyId(id);
		emService.delete(employee);
		return "redirect:/users/employee.do?success=true&msg=Successfully Deleted";
	}
		
}
