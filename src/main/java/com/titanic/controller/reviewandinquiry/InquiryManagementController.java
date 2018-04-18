package com.titanic.controller.reviewandinquiry;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.titanic.entity.Inquiry;
import com.titanic.service.reviewandinquiry.InquiryManagementService;
import com.titanic.service.user.CustomerManagementService;
import com.titanic.service.user.UserCommonService;
import com.titanic.session.CurrentUser;

@Controller
public class InquiryManagementController {
	
	@Autowired
	private InquiryManagementService imService;
	
	@Autowired
	private CustomerManagementService cmService;
	
	@Autowired
	private UserCommonService umService;
	
	private String redirectUrlString = "";
	
	// ADD NEW COMMENT
	@RequestMapping(value="inquiry/addInquiry.do", method=RequestMethod.POST)
	public String addEmployee( @Valid @ModelAttribute("newInquiry") Inquiry inq, BindingResult errors) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "home";
		}
		else {
//			try {
		//		System.out.println(JsonFormer.form(feedBack));
				inq.setCustomer(cmService.findOneByUser(umService.findOneByUserName(CurrentUser.me())));
				inq.setIsReplied(false);
				imService.save(inq);
				redirectUrlString = "redirect:/home.do?success=true&msg=Successfully Registered";
//			} catch (JSONException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		}
		return redirectUrlString;
	}
}
