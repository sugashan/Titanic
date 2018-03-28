package com.titanic.controller.review;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.titanic.entity.FeedBack;
import com.titanic.service.review.ReviewManagementService;

@Controller
public class ReviewManagementController {
	
	@Autowired
	private ReviewManagementService rmService;
	
	private String redirectUrlString = "";
	
	// ADD NEW COMMENT
	@RequestMapping(value="comment/addComment", method=RequestMethod.POST)
	public String addEmployee( @Valid @ModelAttribute("newFeedBack") FeedBack feedBack, BindingResult errors) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "home";
		}
		else {
//			try {
		//		System.out.println(JsonFormer.form(feedBack));
				rmService.save(feedBack);
				redirectUrlString = "redirect:/home.do?success=true&msg=Successfully Registered";
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		}
		return redirectUrlString;
	}
}
