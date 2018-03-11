package com.titanic.controller.user;


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
	
	@ModelAttribute("newEmployee")
	public Employee Construct() {
		return  new Employee();
	}
	
	@ModelAttribute("singleUpdatedEmployee")
	public Employee ConstructSingle() {
		return new Employee();
	}
	
	@RequestMapping("/employee")
	public String employee(Model model) {
		model.addAttribute("role", emService.findAllRoles());
		model.addAttribute("employee", emService.findAll());
		return "employee";
	}
	
	// SINGLE USER
	@RequestMapping("/singleEmployee/{id}")
	public String singleEmployee(Model model, @PathVariable int id) {
		model.addAttribute("role", emService.findAllRoles());
		model.addAttribute("singleEmployee", emService.findOnebyId(id));
		return "employee-detail";
	}
	
	// ADD NEW USER
	@RequestMapping(value="/employee", method=RequestMethod.POST)
	public String addEmployee(@ModelAttribute("newEmployee") Employee employee, BindingResult errors, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
		}
		else {
//			try {
		//		System.out.println(JsonFormer.form(employee));
				emService.save(employee);
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
		}
		model.addAttribute("employee", emService.findAll());
		return "employee";
	}
	
	// UPDATE EXITING USER
	@RequestMapping(value="/singleEmployee/{id}", method=RequestMethod.POST, headers = "content-type=text/*")
	public String updateEmployee(@ModelAttribute("singleUpdatedEmployee") Employee employee, @PathVariable int id, Model model) {
		System.out.println(employee.getContact() + "----contact");
		//	model.addAttribute("singleEmployee",emService.update(employee, id));
		return "employee-detail";
	}
	
	// DELETE USER
	@RequestMapping(value="/deleteEmployee/{id}")
	public String deleteEmployee(@PathVariable int id, Model model) {
		emService.delete(id);
		model.addAttribute("employee", emService.findAll());
		return "employee";
	}
		
}
