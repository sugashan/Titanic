package com.titanic.service;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.titanic.entity.Authority;
import com.titanic.entity.Employee;
import com.titanic.entity.Role;
import com.titanic.entity.User;
import com.titanic.respository.AuthorityRepository;
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
	private AuthorityRepository aRepo;

	@PostConstruct
	public void Init() {
		
		Authority auth = new Authority();
		auth.setId(1);
		auth.setName("VIEW_EMPLOYEE");
		auth.setAuthority("VIEW_EMPLOYEE");
		aRepo.save(auth);
		
		Role role = new Role();
		role.setId(1);
		role.setName("ADMIN");
		role.setDescription("role-admin");
		rRepo.save(role);
		
		User newUser = new User();
		newUser.setId(1);
		newUser.setUserName("admin");
		newUser.setPassword("admin");
		urepo.save(newUser);
		
		Employee newEmployee = new Employee();
		newEmployee.setId(1);
		newEmployee.setUser(newUser);
		newEmployee.setRole(role);
		eRepo.save(newEmployee);
	
	}

}
