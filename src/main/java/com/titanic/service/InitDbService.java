package com.titanic.service;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Branch;
import com.titanic.entity.Customer;
import com.titanic.entity.Employee;
import com.titanic.entity.FoodType;
import com.titanic.entity.Meal;
import com.titanic.entity.Role;
import com.titanic.entity.User;
import com.titanic.respository.BranchRepository;
import com.titanic.respository.CustomerRepository;
import com.titanic.respository.EmployeeRepository;
import com.titanic.respository.FoodTypeRepository;
import com.titanic.respository.MealRepository;
import com.titanic.respository.RoleRepository;
import com.titanic.respository.UserRepository;

@Service
@Transactional
public class InitDbService {
	
	@Autowired
	private UserRepository urepo;
	
	@Autowired 
	private EmployeeRepository eRepo;
	
	@Autowired
	private RoleRepository rRepo;
	
	@Autowired
	private BranchRepository bRepo;
	
	@Autowired
	private FoodTypeRepository fRepo;
	
	@Autowired
	private MealRepository mRepo;
	
	@Autowired
	private CustomerRepository cRepo;

	@PostConstruct
	public void Init() {
		
		FoodType kottu = new FoodType();
		kottu.setName("KOTTU");
		kottu.setId(1);
		kottu.setPreFix("KOTT");
		fRepo.save(kottu);
		
		FoodType kottu1 = new FoodType();
		kottu1.setName("NOODELS");
		kottu1.setId(2);
		kottu1.setPreFix("NOOD");
		fRepo.save(kottu1);
		
		Meal meal = new Meal();
		meal.setId(1);
		meal.setName("sssssss");
		meal.setFoodType(kottu1);
		meal.setIsSpecial(true);
		meal.setItemCatergory("dish");
		meal.setPreferedTime("breakfast");
		meal.setPrice((float) 2.23);
		mRepo.save(meal);
		
		Meal meal1 = new Meal();
		meal1.setId(2);
		meal1.setName("qqqqqqq");
		meal1.setFoodType(kottu);
		meal1.setIsSpecial(true);
		meal1.setItemCatergory("starter");
		meal1.setPreferedTime("lunch");
		meal1.setPrice((float) 24.43);
		mRepo.save(meal1);
		
		
		Role adminRole = new Role();
		adminRole.setId(1);
		adminRole.setName("ROLE_ADMIN");
		adminRole.setDescription("role-admin");
		rRepo.save(adminRole);
		
		Role cookRole = new Role();
		cookRole.setId(2);
		cookRole.setName("ROLE_COOK");
		cookRole.setDescription("role-cook");
		rRepo.save(cookRole);
		
		Role recepientRole = new Role();
		recepientRole.setId(3);
		recepientRole.setName("ROLE_RECEPTIONIST");
		recepientRole.setDescription("role-recepient");
		rRepo.save(recepientRole);
		
		Role customerRole = new Role();
		customerRole.setId(4);
		customerRole.setName("ROLE_CUSTOMER");
		customerRole.setDescription("role-customer");
		rRepo.save(customerRole);
		
		Role deliveryRole = new Role();
		deliveryRole.setId(5);
		deliveryRole.setName("ROLE_DELIVERYBOY");
		deliveryRole.setDescription("role-deliveryBoy");
		rRepo.save(deliveryRole);
		
		Branch defaultBranch = new Branch();
		defaultBranch.setId(1);
		defaultBranch.setAddress("Nelliyady, Jaffna.");
		defaultBranch.setContact("021-226-2323");
		defaultBranch.setName("Nelliyady-Titanic");
		bRepo.save(defaultBranch);
		
		User newUser = new User();
		newUser.setEnabled(true);
		newUser.setId(1);
		newUser.setName("Admin");
		newUser.setMobile("077-3284456");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		newUser.setUserName("admin");
		newUser.setPassword(encoder.encode("admin"));
		newUser.setAddress("Alvai, East");
		newUser.setRole(adminRole);
		urepo.save(newUser);
		
		Customer newDefaultCust = new Customer();
		newDefaultCust.setId(1);
		newDefaultCust.setUser(newUser);
		cRepo.save(newDefaultCust);
		
		Employee newEmployee = new Employee();
		newEmployee.setId(1);
		newEmployee.setUser(newUser);
		newEmployee.setBranch(defaultBranch);
		eRepo.save(newEmployee);
		
		
		newUser.setRole(deliveryRole);
		Employee deleivery = new Employee();
		deleivery.setAvailableForDeivery(true);
		deleivery.setId(2);
		deleivery.setUser(newUser);
		deleivery.setBranch(defaultBranch);
		eRepo.save(deleivery);
		
		
		User newUser2 = new User();
		newUser2.setEnabled(true);
		newUser2.setId(2);
		newUser2.setName("Sugash");
		newUser2.setMobile("077-3284455");
		newUser2.setUserName("sugash");
		newUser2.setPassword(encoder.encode("sugash"));
		newUser2.setAddress("Alvai, East");
		newUser2.setRole(customerRole);
		urepo.save(newUser2);
		
		Customer newCustomer = new Customer();
		newCustomer.setId(2);
		newCustomer.setUser(newUser2);
		cRepo.save(newCustomer);
	}

}
