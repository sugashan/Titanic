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
import com.titanic.service.user.CustomerManagementService;

@Controller
public class CustomerController {
	
	@Autowired
	private CustomerManagementService cmService;
	
	private String redirectUrlString="";
	
	@ModelAttribute("newCustomer")
	public Customer Construct() {
		return  new Customer();
	}
	
	@ModelAttribute("singleUpdatedCustomer")
	public Customer ConstructSingle() {
		return new Customer();
	}
	
	// GET ALL CUSTOMERS
	@RequestMapping("/users/customer")
	public String customer(Model model) {
		model.addAttribute("customer", cmService.findAll());
		return "customer";
	}
	
	// SINGLE USER
	@RequestMapping("/users/singleCustomer/{id}")
	public String singleCustomer(Model model, @PathVariable int id) {
		model.addAttribute("singleCustomer", cmService.findOnebyId(id));
		return "customer-detail";
	}
			
	// ADD NEW USER
		@RequestMapping(value="users/customer", method=RequestMethod.POST)
		public String addCustomer( @Valid @ModelAttribute("newCustomer") Customer customer, BindingResult errors, Model model) {
			if(errors.hasErrors()) {
				System.out.println(errors.getFieldErrors().toString());
				redirectUrlString = "redirect:/users/customer.do?success=false&msg=Registered Failed";
			}
			else {
//				try {
			//		System.out.println(JsonFormer.form(employee));
					cmService.save(customer);
					redirectUrlString = "redirect:/users/customer.do?success=true&msg=Successfully Registered";
//				} catch (JSONException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
				
			}
			return redirectUrlString;
		}
		
		// UPDATE EXITING USER
		@RequestMapping(value="users/customer-detail/{id}", method=RequestMethod.POST)
		public String updateCustomer(@Valid @ModelAttribute("singleUpdatedCustomer") Customer customer, BindingResult errors, @PathVariable int id, Model model) {
			if(errors.hasErrors()) {
				System.out.println(errors.getFieldErrors().toString());
				redirectUrlString = "redirect:/users/customer-detai.do?success=false&msg=Update Failed";
			}
			else {
			model.addAttribute("singleCustomer", cmService.update(customer, id));
			redirectUrlString = "redirect:/users/customer-detail.do?success=true&msg=Successfully Updated";
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
