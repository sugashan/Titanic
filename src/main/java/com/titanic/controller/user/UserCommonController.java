package com.titanic.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.titanic.service.user.UserCommonService;

@Controller
public class UserCommonController {
	
	@Autowired
	private UserCommonService ucService;

	// CHECK AVAILABLE USER NAME
	@RequestMapping(value="users/availableUserName")
	@ResponseBody
	public String userName(@RequestParam String userName) {
		Boolean availableUserName = ucService.findOneByUserName(userName) == null;
		return availableUserName.toString();
	}
}
