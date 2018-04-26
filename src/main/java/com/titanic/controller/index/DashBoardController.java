package com.titanic.controller.index;


import java.util.Date;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.service.orderbooking.OrderManagementService;
import com.titanic.service.user.CustomerManagementService;

@Controller
public class DashBoardController {
	
	@Autowired
	private OrderManagementService omService;
	
	@Autowired
	private CustomerManagementService cmService;
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		
		JSONObject dashBoardInfo = new JSONObject();
		try {
			dashBoardInfo.put("newOrders", omService.countNewOrders());
			dashBoardInfo.put("activeCustomers", cmService.countActiveCustomers());
			dashBoardInfo.put("dineInOrders", omService.countByOrderType(TitanicMessageConstant.DINE_IN_ORDER));
			dashBoardInfo.put("delievryOrders", omService.countByOrderType(TitanicMessageConstant.DELIVERY_ORDER));
			dashBoardInfo.put("pickUpOrders", omService.countByOrderType(TitanicMessageConstant.PICK_UP_ORDER));
			
			
			JSONArray orderViaMonth = new JSONArray();
			for(int i = 1; i<7; i++) {
				Date today = new Date();
				today.setMonth(today.getMonth() - i );
				
				int qProb = 4-i;
				if(qProb <= 0) {
					qProb = 7-i;
				}
				
				JSONObject orderChartInfo = new JSONObject();
				orderChartInfo.put("y", 1900 + today.getYear() + " Q"+qProb);
				orderChartInfo.put("item1", i*100 + omService.countOrdersBetweenTodayAndOrderedOn(today));
				orderViaMonth.put(orderChartInfo);
			}
			dashBoardInfo.put("ordersCountBySixMonth", orderViaMonth);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("dashboardInfo", dashBoardInfo);
		return "dashboard";
	}

}
