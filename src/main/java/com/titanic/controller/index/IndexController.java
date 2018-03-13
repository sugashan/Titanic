package com.titanic.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
		
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/accessDenied")
	public String forbiddenPage() {
		return "forbidden";
	}
}
