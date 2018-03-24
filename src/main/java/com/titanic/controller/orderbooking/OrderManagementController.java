package com.titanic.controller.orderbooking;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.titanic.entity.MealsSchedule;
import com.titanic.entity.Orders;
import com.titanic.service.food.MealManagementService;
import com.titanic.service.orderbooking.OrderManagementService;

@Controller
public class OrderManagementController {
	
	@Autowired
	private OrderManagementService omService;
	
	@Autowired
	private MealManagementService mmService;
	
	String redirectUrlString ="";
	
	@ModelAttribute("newOrder")
	public Orders Construct() {
		return  new Orders();
	}
	
	@ModelAttribute("singleUpdatedOrder")
	public Orders ConstructSingle() {
		return new Orders();
	}

	// GET ALL ORDERS
	@RequestMapping("orders/order")
	public String order(Model model) {
		
		for(MealsSchedule ms : MealsSchedule.values()) {
		model.addAttribute(ms.getName(), mmService.findByItemType(ms.getName()));
		}
		
		model.addAttribute("orders", omService.findAll());
		return "order";
	}
	
	// SINGLE VIEW ORDER
	@RequestMapping (value="orders/order-detail/{id}")
	public String singleOrder(Model model, @RequestParam int id) {
		model.addAttribute("singleOrder", omService.findOneById(id));
		return "order-detail";
	}
	
	// ADD NEW ORDER
	@RequestMapping(value="orders/newOrder", method=RequestMethod.POST)
	public String addNewOrder( @Valid @ModelAttribute("newOrder") Orders order, BindingResult errors) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "redirect:/orders/newOrder.do?success=false&msg=Registered Failed";
		}
		else {
			omService.save(order);
			redirectUrlString = "redirect:/orders/newOrder.do?success=true&msg=Successfully Added!";
		}
		return redirectUrlString;
	}
	
	// UPDATE EXITING ORDER
	@RequestMapping(value="orders/order-detail/{id}", method=RequestMethod.POST)
	public String updateOrder(@Valid @ModelAttribute("singleUpdatedOrder") Orders order, BindingResult errors, @PathVariable int id, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "redirect:/orders/order-detail.do?success=false&msg=Update Failed";
		}
		else {
			model.addAttribute("singleOrder", omService.update(order, id));
		redirectUrlString = "redirect:/orders/order-detail.do?success=true&msg=Successfully Updated";
		}
		return redirectUrlString;
	}
	
	// LAST INSERTED ORDER IN GIVEN TYPE
	@RequestMapping(value="/orders/lastOrderId")
	@ResponseBody
	public String lastInsertedOrderId() {
		return omService.getLastInsertedMealId();
	}
	
}
