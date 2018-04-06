package com.titanic.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.titanic.entity.User;
import com.titanic.other.GenericResult;
import com.titanic.other.JsonFormer;
import com.titanic.service.user.UserCommonService;

@Controller
public class UserCommonController {
	
	@Autowired
	private UserCommonService ucService;
	
	private String returnResultString = "";

	// CHECK AVAILABLE USER NAME
	@RequestMapping(value="users/availableUserName")
	@ResponseBody
	public String userName(@RequestParam String userName) {
		Boolean availableUserName = ucService.findOneByUserName(userName) == null;
		return availableUserName.toString();
	}
	
	// FIND USER WITH MOBILE
	@RequestMapping(value="users/CustomerWithMobile")
	@ResponseBody
	public String userWithMobile(@RequestParam String mobile) {
		User availableUser = ucService.findOneByTelephone(mobile);
		try {
			returnResultString = JsonFormer.form(new GenericResult("success", availableUser));
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
