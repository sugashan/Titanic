package com.titanic.service.food;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import com.titanic.entity.FoodComboPackage;
import com.titanic.entity.PackageMeals;
import com.titanic.respository.FoodComboPackageRepository;
import com.titanic.respository.FoodPckgMealRepository;


@Service
public class FoodComboPackageManagementService {
	
	@Autowired
	private FoodComboPackageRepository fcpRepository;
	
	@Autowired
	private FoodPckgMealRepository fpmRepository; 
	
	// GET ALL FOOD COMBO
	public List<FoodComboPackage> findAll() {
		return fcpRepository.findAll();
	}

	// SAVE FOODCOMBOS
	public void save(FoodComboPackage fcp) {
		FoodComboPackage savednew = fcpRepository.save(fcp);
		if(savednew != null) {
			fpmRepository.saveAll(fcp.getPackageMeal());
		}
	}

	// SINGLE COMBO PACKAGE
	public FoodComboPackage findOnebyId(int id) {
		FoodComboPackage fcp = fcpRepository.findOneById(id);
		List<PackageMeals> pckg = fpmRepository.findAllByFcpkg(fcp);
		fcp.setPackageMeal(pckg);
		return fcp;
	}

	// DELETE COMBO PACKAGE
	@PreAuthorize(value = "hasAnyRole('ROLE_ADMIN', 'ROLE_RECEPTIONIST')")
	public void delete(int id) {
		fcpRepository.deleteById(id);
	}

	// FIND ALL OFFERES WITHIN THE DATE
	public FoodComboPackage findAllGivenDate(String today) {
		 List<FoodComboPackage> fc = fcpRepository.findFirstByValidUntil(today, PageRequest.of(0,1));
		 if(fc != null ) {
			 if( fc.size() !=0) {
				 try {
					 FoodComboPackage fcp = fc.get(0);
				     List<PackageMeals> pml = fpmRepository.findAllByFcpkg(fcp);
				     JSONArray jsonResultArry = new JSONArray();
						for(PackageMeals pck: pml) {
							JSONObject object = new JSONObject();
							object.put("mealId", pck.getMealId());
							object.put("mealName", pck.getMealName());
							object.put("quantity", pck.getQuantity());
							jsonResultArry.put(object);
						}
					 fcp.setPckgMealString(jsonResultArry.toString());
					 fcp.setPackageMeal(pml);
					 return fcp;
				 }
				 catch(Exception e) {
					 e.printStackTrace();
				 }
			 }
		 }
		 return null;
	}
	
}
