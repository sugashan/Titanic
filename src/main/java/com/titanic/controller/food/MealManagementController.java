package com.titanic.controller.food;

import java.io.File;
import java.nio.file.Files;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import javax.validation.Valid;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.titanic.entity.Meal;
import com.titanic.entity.User;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.other.UniqueIdManager;
import com.titanic.respository.UserRepository;
import com.titanic.service.food.FoodTypeManagementService;
import com.titanic.service.food.MealManagementService;
import com.titanic.session.CurrentUser;

@Controller
public class MealManagementController {
	
	@Autowired
	private MealManagementService mmService;
	
	@Autowired
	private FoodTypeManagementService ftService;
	
	@Autowired
	private UserRepository uRepository;
	
	private String redirectUrlString="";
	
	// UPLOADED PATH
	public File uploadFolder = new File(TitanicMessageConstant.UPLOAD_PATH+"meal/");
	
	
	@ModelAttribute("newMeal")
	public Meal Construct() {
		return new Meal();
	}
	
	@ModelAttribute("singleUpdatedMeal")
	public Meal ConstructSingle() {
		return new Meal();
	}
	
	// GET ALL MEAL
	@RequestMapping("/meals/meal")
	public String meals(Model model) {
		model.addAttribute("mealType",  ftService.findAll());
		model.addAttribute("meal", mmService.findAll());
		return "meal";
	}
	
	// SINGLE MEAL
	@RequestMapping("/meals/meal-detail/{id}")
	public String singleFoodType(Model model, @PathVariable int id) {
		model.addAttribute("singleMeal", mmService.findOnebyId(id));
		return "meal-detail";
	}
	
	// ADD NEW MEAL
	@RequestMapping(value="/meals/meal", method=RequestMethod.POST)
	public String addFoodType( @Valid @ModelAttribute("newMeal") Meal meal, BindingResult errors, HttpServletRequest request, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "meal";
		}
	else {
			try {
				 // Save file on system
				 Part filePart = request.getPart("image");
				 
				 String fileName = UniqueIdManager.getRandom(0) + filePart.getSubmittedFileName();
				 File file = new File(uploadFolder, fileName);
                 Files.copy(filePart.getInputStream(), file.toPath());
                
            	 meal.setFoodType(ftService.findOnebyId(meal.getFoodTypeId()));         
			     meal.setImageUrl("/titanic/resources/uploads/meal/" + fileName);
			     
			     User user = uRepository.findByUserName(CurrentUser.me());
				 meal.setAddedByUser(user);
					
			     mmService.save(meal);
			     redirectUrlString = "redirect:/meals/meal.do?success=true&msg=Successfully Added";
			    
			} catch (Exception e) {
				e.printStackTrace();
				redirectUrlString = "redirect:/meals/meal.do?success=false&msg=Image Failed.";
			}
        }
		return redirectUrlString;
	}
	
	// UPDATE EXITING MEAL
	@RequestMapping(value="/meals/meal-detail/{id}", method=RequestMethod.POST)
	public String updateMeal(@Valid @ModelAttribute("singleUpdatedMeal")  Meal meal, BindingResult errors, @PathVariable int id, Model model) {
		if(errors.hasErrors()) {
			System.out.println(errors.getFieldErrors().toString());
			redirectUrlString = "redirect:/meals/meal-detail.do?success=false&msg=Updated Failed";
		}
		else {
			meal.setFoodType(ftService.findOnebyId(meal.getFoodTypeId()));
			mmService.update(meal, id);
			redirectUrlString = "redirect:/meals/meal-detail.do?success=true&msg=Successfully Updated";
		}
		return redirectUrlString;
	}
	
	// DELETE MEAL
	@RequestMapping(value="/meals/deleteMeal/{id}")
	public String deleteMeal(@PathVariable int id, Model model) {
		mmService.delete(id);
		return "redirect:/meals/meal.do?success=true&msg=Successfully Deleted";
	}
	
	// LAST INSERTED MEAL IN GIVEN TYPE
	@RequestMapping(value="/meals/lastMealId")
	@ResponseBody
	public String lastInsertedMealId(@RequestParam String code) {
		return mmService.getLastInsertedMealId(code);
	}
	
	// GET ALL LIST OF MEAL AS MAP
	@RequestMapping(value="/meals/allMealsString")
	@ResponseBody
	public String getMealList() throws JSONException {
		return mmService.getAllMealMapString();
	}
	
}
