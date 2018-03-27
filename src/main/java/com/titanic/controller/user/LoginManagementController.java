package com.titanic.controller.user;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.titanic.entity.Employee;
import com.titanic.entity.User;
import com.titanic.service.user.EmployeeManagementService;
import com.titanic.service.user.UserCommonService;
import com.titanic.session.CurrentUser;

@Controller
public class LoginManagementController {
	
	@Autowired
	private EmployeeManagementService emService;
	
	@Autowired
	private UserCommonService ucService;
	
	private String returnResult = "";
	
	// SHOW LOGIN
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	// SHOW LOCKSCREEN
	@RequestMapping("/lockScreen")
	public String lockScreen(Model model) {
		System.out.println(CurrentUser.me() + "ussssssssssssssssss");
		model.addAttribute("username", CurrentUser.me());
		return "lockScreen";
	}
	
	// SUCCESSFULL LOGIN HANDLER
	@RequestMapping("/handleSuccesLogin")
	public String handleSuccesLogin(HttpSession session) {
		User currUser = new User();
		try {
			currUser = ucService.findOneByUserName(CurrentUser.me());
	    	session.setAttribute("LoggerId", currUser.getId());
	    	session.setAttribute("LoggerName", currUser.getUserName());
	    	
	    	ucService.saveLogin(currUser);
	    	String userRole = currUser.getRole().getName();
	    	if(userRole == "ROLE_CUSTOMER") {
	    		returnResult = "redirect:/home.do";
	    	}
	    	else {
	    		returnResult = "redirect:/dashboard.do";
	    	}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return returnResult; 
	}
	
	// FAILURE LOGIN HANDLER
	@RequestMapping("/handleFailureLogin")
	public String handleFailureLogin(HttpSession session) {
		return "redirect:/login.do?success=false"; 
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
