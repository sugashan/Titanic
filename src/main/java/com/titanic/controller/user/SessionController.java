package com.titanic.controller.user;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.titanic.entity.Employee;
import com.titanic.service.user.EmployeeManagementService;

@Controller
public class SessionController {
	
	@Autowired
	private EmployeeManagementService emService;
	
	 //View MYSELF USER
    @RequestMapping("/mySelf")
    public Employee myself(String name) {
    	Employee currUser = new Employee();
    	currUser = emService.findOneByName(name);
		 return currUser;
    }
    
    //GET MYSELF USER
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
    
    // GET CURRENT USER
    public String me() {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = "";
		if (principal instanceof UserDetails) {
			username = ((UserDetails)principal).getUsername().toString();
		} else {
			username = principal.toString();
		}
		return username;
    }
}
