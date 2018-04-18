package com.titanic.controller.reviewandinquiry;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.titanic.entity.FeedBack;
import com.titanic.service.reviewandinquiry.ReviewManagementService;

@Controller
public class ReviewManagementController {
	
	@Autowired
	private ReviewManagementService rmService;
	
	private String redirectUrlString = "";
	
	// GET ALL COMMENT
	@RequestMapping("comments/comment")
	public String comments(Model model) {
		model.addAttribute("comments", rmService.getAllComments());
		return "review";
	}
	
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
				feedBack.setIsReplied(false);
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
