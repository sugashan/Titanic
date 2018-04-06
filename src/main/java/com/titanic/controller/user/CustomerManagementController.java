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
import com.titanic.entity.Customer;
import com.titanic.entity.User;
import com.titanic.service.user.CustomerManagementService;

@Controller
public class CustomerManagementController {
	
	@Autowired
	private CustomerManagementService cmService;
	
	private String redirectUrlString="";
	
	
	@ModelAttribute("singleUpdatedCustomer")
	public Customer ConstructSingle() {
		return new Customer();
	}
	
	// GET ALL CUSTOMERS
	@RequestMapping("/users/customer")
	public String customer(Model model) {
		model.addAttribute("customers", cmService.findAll());
		return "customer";
	}
	
	// SINGLE USER
	@RequestMapping("/users/singleCustomer/{id}")
	public String singleCustomer(Model model, @PathVariable int id) {
		model.addAttribute("singleCustomer", cmService.findOnebyId(id));
		return "customer-detail";
	}
		
	// ADD NEW USER
	@RequestMapping(value="users/addCustomer", method=RequestMethod.POST)
	public String addCustomer( @Valid @ModelAttribute("newUser") User customerUser, BindingResult errors, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "login";
		}
		else {
//				try {
				Customer customer = new Customer();
				customerUser.setName(customerUser.getUserName());
				customer.setUser(customerUser);
				cmService.save(customer);
				redirectUrlString = "redirect:/login.do?success=true&msg=Successfully Registered";
//				} catch (JSONException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
		}
		return redirectUrlString;
	}
	
	// UPDATE EXITING USER
	@RequestMapping(value="users/customer-detail/{id}", method=RequestMethod.POST)
	public String updateCustomer(@Valid @ModelAttribute("currentCustomer") Customer customer, BindingResult errors, @PathVariable int id, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "home";
		}
		else {
			model.addAttribute("singleCustomer", cmService.update(customer, id));
			redirectUrlString = "redirect:/home.do?success=true&msg=Successfully Updated";
		}
		return redirectUrlString;
	}
	
	// DELETE USER
	@RequestMapping(value="users/deleteCustomer/{id}")
	public String deleteEmployee(@PathVariable int id, Model model) {
		cmService.deleteCustomer(id);
		return "redirect:/users/customer.do?success=true&msg=Successfully Deleted";
	}
		
}
