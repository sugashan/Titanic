package com.titanic.other;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class CommonService {
	
	 // RETURN CURRENT TIME AND DATE STRING MAP
	 public Map<String, String> getNowDate() {
		 Calendar nowCal = Calendar.getInstance();
		 
		 SimpleDateFormat sfD = new SimpleDateFormat("yyyy-MM-dd");
		 SimpleDateFormat sfT = new SimpleDateFormat("hh:mm:ss");
		 
		 Map<String,String> resultMap = new HashMap<String, String>();
		 resultMap.put("today", sfD.format(nowCal.getTime()));
		 resultMap.put("currentTime", sfT.format(nowCal.getTime()));
		 return resultMap;
	 }
}
