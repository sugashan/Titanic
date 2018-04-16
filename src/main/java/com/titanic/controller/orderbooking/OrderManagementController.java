package com.titanic.controller.orderbooking;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.titanic.entity.DeliveryOrder;
import com.titanic.entity.FoodOrder;
import com.titanic.entity.Orders;
import com.titanic.entity.PickUpDeskOrder;
import com.titanic.other.GenericResult;
import com.titanic.other.JsonFormer;
import com.titanic.other.TitanicMessageConstant;
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
	
	@ModelAttribute("newOrderFromAdmin")
	public Orders ConstructOrder() {
		Orders newDineIn =new Orders();
		List <FoodOrder> orderList = new ArrayList<FoodOrder>();
		for(int i = 1; i<8; i++) {
			FoodOrder foodOrder = new FoodOrder();
			foodOrder.setId(i);
			orderList.add(foodOrder); 
		}
		newDineIn.setFoodOrder(orderList);
		return newDineIn;
	}
	
	@ModelAttribute("deliveryOrder")
	public DeliveryOrder ConstructDeliveryOrder() {
		return new DeliveryOrder();
	}
	
	@ModelAttribute("pickUpOrder")
	public PickUpDeskOrder ConstructPickUpDeskOrder() {
		return new PickUpDeskOrder();
	}

	@ModelAttribute("singleUpdatedDineInORCallOrder")
	public Orders ConstructSingle() {
		return new Orders();
	}
	
	// GET ALL ORDERS
	@RequestMapping("orders/order")
	public String order(Model model) {
		model.addAttribute("meals", mmService.findAll());
		try {
			model.addAttribute("mealString", mmService.getAllMealMapString());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("orders", omService.findAll());
		return "order";
	}
	
	// GET ALL NEW ORDERS AS STRING
	@RequestMapping("orders/allOrders")
	@ResponseBody
	public String orderString(Model model) {
		
		try {
			redirectUrlString = JsonFormer.form(new GenericResult("Success", omService.findAll()));
		} catch (Exception e) {
			try {
				redirectUrlString = JsonFormer.form(new GenericResult("Failed",""));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return redirectUrlString;
	}
	
	// SINGLE VIEW ORDER
	@RequestMapping (value="orders/order-detail-payment/{id}/{orderType}")
	public String singleOrder(Model model, @PathVariable int id, @PathVariable String orderType ) {
		
		if(TitanicMessageConstant.DELIVERY_ORDER.equals(orderType)) {
			model.addAttribute("singleOrder", omService.findOneDeliveryById(id));
		}
		else if(TitanicMessageConstant.DINE_IN_ORDER.equals(orderType)) {
			model.addAttribute("singleOrder", omService.findOneDineInById(id));
		}
		else if(TitanicMessageConstant.PICK_UP_ORDER.equals(orderType)) {
			model.addAttribute("singleOrder", omService.findOnePickUpById(id));
		}
		return "order-detail-payment";
	}
	
	// ADD NEW ORDER FROM ADMIN - DINE IN
	@RequestMapping(value="orders/order", method=RequestMethod.POST)
	public String addNewOrder( @Valid @ModelAttribute("newOrderFromAdmin") Orders order, BindingResult orderErrors) {
		if(orderErrors.hasErrors()) {
			System.out.println(orderErrors.getFieldErrors().toString());
			redirectUrlString = "redirect:/orders/order.do?success=false&msg=Order Failed";
		}
		else {
			String orderMeal = "";
			List<FoodOrder> orderList = order.getFoodOrder();
			Iterator<FoodOrder> ordItr = orderList.iterator();

			while (ordItr.hasNext()) {
				FoodOrder foodOrder = ordItr.next();
			    if (foodOrder.getMealId() == 0 || foodOrder.getQuantity() == 0) {
			    	ordItr.remove();
			    }
			    else {
			    	orderMeal += foodOrder.getMealName() + " x " + foodOrder.getQuantity() + ", ";
			    }
			}
			order.setFoodOrder(orderList);
			order.setFoodOrderString(orderMeal);
			order.setCustomer(cmService.findOneByName(order.getCustomer().getUser().getName()));
		
			omService.save(order);
			redirectUrlString = "redirect:/orders/order.do?success=true&msg=Successfully Added!";
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
	public String updateOrder(@Valid @ModelAttribute("singleUpdatedDineInORCallOrder") Orders order, BindingResult errors, @PathVariable int id, Model model) {
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
