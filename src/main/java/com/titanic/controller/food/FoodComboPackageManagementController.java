package com.titanic.controller.food;

import java.io.File;
import java.nio.file.Files;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.titanic.entity.FoodComboPackage;
import com.titanic.entity.PackageMeals;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.other.UniqueIdManager;
import com.titanic.service.food.FoodComboPackageManagementService;

@Controller
public class FoodComboPackageManagementController {
	
	@Autowired
	private FoodComboPackageManagementService fcpSerice;
	
	private String redirectUrlString="";
	
	// UPLOADED PATH
	public File uploadFolder = new File(TitanicMessageConstant.UPLOAD_PATH+"combo/");
		
	
	@ModelAttribute("singleUpdatedComboPackage")
	public FoodComboPackage ConstructSingle() {
		return new FoodComboPackage();
	}
	
	// GET ALL COMBO
	@RequestMapping("meals/comboPackage")
	public String foodType(Model model) {
		model.addAttribute("comboPackages", fcpSerice.findAll());
		return "comboPackage";
	}
	
	// ADD NEW PACKAGE
	@CrossOrigin
	@RequestMapping(value = "/meals/comboPackage", method = RequestMethod.POST)
	@ResponseBody
	public String addNewPackage( HttpServletRequest request) {
		
		FoodComboPackage fcp = new FoodComboPackage();
		fcp.setName(request.getParameter("name"));
		
		if(request.getParameter("price")!=null)
			fcp.setPrice(Float.parseFloat(request.getParameter("price")));
		
		fcp.setAddedOn(request.getParameter("addedOn"));
		fcp.setDescription(request.getParameter("description"));
		fcp.setValidUntil(request.getParameter("validUntil"));
		fcp.setStatus(true);
		
		String mealArrString = request.getParameter("mealArr");
		try {
			if(mealArrString!=null) {
				ObjectMapper mapper = new ObjectMapper();
				List<PackageMeals> pckgMealList = mapper.readValue(
													mealArrString,
													mapper.getTypeFactory().constructCollectionType(List.class, PackageMeals.class));
				for(PackageMeals pckgMeal : pckgMealList) {
					pckgMeal.setFcpkg(fcp);
				}
				fcp.setPackageMeal(pckgMealList);
			}
			// Save file on system
			Part filePart = request.getPart("image");
			
			String fileName = UniqueIdManager.getRandom(0) + filePart.getSubmittedFileName();
			File file = new File(uploadFolder, fileName);
            Files.copy(filePart.getInputStream(), file.toPath());
           
            fcp.setImage("/titanic/resources/uploads/combo/" + fileName);
            fcp.setCode(UniqueIdManager.getUniqueCode("Cmp", 4));
			fcpSerice.save(fcp);
			redirectUrlString = "success";; 
		} catch (Exception e) {
			e.printStackTrace();
			redirectUrlString = "Failed";
		}
		 return redirectUrlString;
	}
	
	// SINGLE USER
	@RequestMapping("/meals/comboPackage-detail/{id}")
	public String singleComboPackage(Model model, @PathVariable int id) {
		model.addAttribute("singleCombo", fcpSerice.findOnebyId(id));
		return "comboPackage-detail";
	}
	
	// DELETE COMBO
	@RequestMapping(value="/meals/deleteComboPackage/{id}")
	public String deleteCombo(@PathVariable int id, Model model) {
		fcpSerice.delete(id);
		return "redirect:/meals/comboPackage.do?success=true&msg=Successfully Deleted";
	}
}
