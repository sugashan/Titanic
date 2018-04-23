package com.titanic.controller.index;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.titanic.service.orderbooking.OrderManagementService;
import com.titanic.service.user.CustomerManagementService;

@Controller
public class DashBoardController {
	
	@Autowired
	private OrderManagementService omService;
	
	@Autowired
	private CustomerManagementService cmService;
	
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		
		JSONObject dashBoardInfo = new JSONObject();
		try {
			int newOrderInfo = omService.countNewOrders();
			dashBoardInfo.put("newOrders", newOrderInfo);
			int custInfo = cmService.countActiveCustomers();
			dashBoardInfo.put("activeCustomers", custInfo);
			
			System.out.println(dashBoardInfo);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dashboardInfo", dashBoardInfo);
		return "dashboard";
	}

}
