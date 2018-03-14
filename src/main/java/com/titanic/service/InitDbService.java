package com.titanic.service;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Branch;
import com.titanic.entity.Employee;
import com.titanic.entity.Role;
import com.titanic.entity.User;
import com.titanic.respository.BranchRepository;
import com.titanic.respository.EmployeeRepository;
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

	@PostConstruct
	public void Init() {
		
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
		deliveryRole.setName("ROLE_DELIVERYBOY,");
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
		newUser.setName("ddd");
		newUser.setMobile("077-3284456");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		newUser.setUserName("admin");
		newUser.setPassword(encoder.encode("admin"));
		newUser.setAddress("Alvai, East");
		newUser.setRole(adminRole);
		urepo.save(newUser);
		
		Employee newEmployee = new Employee();
		newEmployee.setId(1);
		newEmployee.setUser(newUser);
		newEmployee.setBranch(defaultBranch);
		eRepo.save(newEmployee);
		
	}

}
