package com.titanic.controller.msgandfaq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.titanic.entity.Customer;
import com.titanic.entity.Notification;
import com.titanic.other.GenericResult;
import com.titanic.other.JsonFormer;
import com.titanic.service.msgandfaq.NotificationManagementService;
import com.titanic.service.user.CustomerManagementService;

@Controller
public class NotificationManagementController {
	
	@Autowired
	private NotificationManagementService nmService;
	
	@Autowired
	private CustomerManagementService cmService;
	
	private String returnResultString = "";
	
	
	// GET NEW NOTIFICATION
	@RequestMapping(value="/notifications/newMsg")
	@ResponseBody
	public String newMsgsForCustomer(@RequestParam int userId ) {
		Customer customer = cmService.findOnebyId(userId);
		List<Notification> newnotifications =  nmService.getNewMsgs(customer);
		try {
			returnResultString = JsonFormer.form(new GenericResult("success", newnotifications));
		} catch (Exception e) {
			try {
				returnResultString = JsonFormer.form(new GenericResult("failed", ""));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return returnResultString;
	}

}
