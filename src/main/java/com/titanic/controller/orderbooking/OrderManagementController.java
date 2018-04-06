package com.titanic.controller.orderbooking;

import java.util.List;

import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
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
import com.titanic.entity.FoodOrder;
import com.titanic.entity.Orders;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.other.UniqueIdManager;
import com.titanic.service.food.MealManagementService;
import com.titanic.service.orderbooking.OrderManagementService;
import com.titanic.service.user.CustomerManagementService;
import com.titanic.session.CurrentUser;

@Controller
public class OrderManagementController {
	
	@Autowired
	private OrderManagementService omService;
	
	@Autowired
	private MealManagementService mmService;
	
	@Autowired
	private CustomerManagementService cmService;
	
	String redirectUrlString ="";
	
	@ModelAttribute("newDineInORCallOrder")
	public Orders Construct() {
		return new Orders();
	}

	@ModelAttribute("singleUpdatedOrder")
	public Orders ConstructSingle() {
		return new Orders();
	}

	// GET ALL ORDERS
	@RequestMapping("orders/order")
	public String order(Model model) {
		
		model.addAttribute("meals", mmService.findAll());
		model.addAttribute("orders", omService.findAll());
		return "order";
	}
	
	// SINGLE VIEW ORDER
	@RequestMapping (value="orders/order-detail/{id}")
	public String singleOrder(Model model, @RequestParam int id) {
		model.addAttribute("singleOrder", omService.findOneById(id));
		return "order-detail";
	}
	
	// ADD NEW ORDER FROM ADMIN - DINE IN
	@RequestMapping(value="orders/newOrder", method=RequestMethod.POST)
	public String addNewOrder( @Valid @ModelAttribute("newDineInORCallOrder") Orders order, BindingResult errors) {
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
	
	// SAVE ORDER FROM HOME PAGE
	@RequestMapping(value="/newOrder", method=RequestMethod.POST)
	public String addNewOrderFromHomePage( @Valid @ModelAttribute("newFoodOrder") Orders order, BindingResult errors) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "home";
		}
		else {
			String orderMeal = order.getFoodOrderString();
			try {
				
				if(orderMeal!=null) {
					ObjectMapper mapper = new ObjectMapper();
					List<FoodOrder> foodOrderList = mapper.readValue(
														orderMeal,
														mapper.getTypeFactory().constructCollectionType(List.class, FoodOrder.class));
					
					orderMeal = "";
					for(FoodOrder foodOrder : foodOrderList) {
						foodOrder.setOrder(order);
						orderMeal += foodOrder.getMealName() + " x " + foodOrder.getQuantity() + " , ";
					}
					order.setFoodOrder(foodOrderList);
					System.out.println("---------------------------------");
					System.out.println(orderMeal);
					order.setFoodOrderString(orderMeal);
					// Need to be set dynamic // 
					order.setOutletBranch("Nelliyady-Titanic");
					
					order.setOrderStatus(TitanicMessageConstant.ACCEPTED_ORDER);
					order.setOrderCode(UniqueIdManager.getUniqueCode("Ord", 8));
					order.setCustomer(cmService.findOneByName(CurrentUser.me()));
					omService.save(order);
					redirectUrlString = "redirect:/home.do?success=true&msg=Successfully Added!";
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				redirectUrlString = "redirect:/home.do?success=false&msg=Sorry! Failed!";
			}
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
