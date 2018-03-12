package com.titanic.controller.index;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.titanic.controller.user.SessionController;
import com.titanic.entity.Employee;
import com.titanic.service.user.EmployeeManagementService;

@Controller
public class HomeController {

	@Autowired
	private EmployeeManagementService emService;
	
	@RequestMapping("/home")
	public String home(HttpSession session) {
		SessionController sc = new SessionController();
		Employee currLogger = new Employee();
    	currLogger = emService.findOneByName(sc.me());
    	session.setAttribute("LoggerId", currLogger.getUser().getName());
    	session.setAttribute("LoggerName", currLogger.getUser().getName());
		return "home"; 
	}
}
