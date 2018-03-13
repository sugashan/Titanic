package com.titanic.controller.user;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.titanic.entity.Employee;
import com.titanic.service.user.EmployeeManagementService;
import com.titanic.session.CurrentUser;

@Controller
public class LoginController {
	
	@Autowired
	private EmployeeManagementService emService;
	
	// SHOW LOGIN
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	// SHOW LOCKSCREEN
	@RequestMapping("/lockScreen")
	public String lockScreen() {
		return "lockScreen";
	}
	
	// SUCCESSFULL LOGIN HANDLER
	@RequestMapping("/handleSuccesLogin")
	public String handleSuccesLogin(HttpSession session) {
		CurrentUser currUser = new CurrentUser();
		Employee currLogger = new Employee();
		try {
    	currLogger = emService.findOneByName(currUser.me());
    	session.setAttribute("LoggerId", currLogger.getUser().getName());
    	session.setAttribute("LoggerName", currLogger.getUser().getName());
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/home.do"; 
	}
	
	// FAILURE LOGIN HANDLER
	@RequestMapping("/handleFailureLogin")
	public String handleFailureLogin(HttpSession session) {
		return "redirect:/login.do?failed=true"; 
	}
		
	// VIEW MYSELF USER
    @RequestMapping("/mySelf")
    public Employee myself(String name) {
    	Employee currUser = new Employee();
    	currUser = emService.findOneByName(name);
		 return currUser;
    }
    
    // GET MYSELF USER
    @RequestMapping("/now")
    public Map<String, String> getNowDate() throws JSONException {
   	 Calendar nowCal = Calendar.getInstance();
   	 
   	 SimpleDateFormat sfD = new SimpleDateFormat("yyyy-MM-dd");
   	 SimpleDateFormat sfT = new SimpleDateFormat("hh:mm:ss");
   	 
   	 Map<String,String> resultMap = new HashMap<String, String>();
   	 resultMap.put("today", sfD.format(nowCal.getTime()));
   	 resultMap.put("currentTime", sfT.format(nowCal.getTime()));
   	 
       return resultMap; 
    }
}
