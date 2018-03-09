package com.titanic.service;

import java.util.ArrayList;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Authority;
import com.titanic.entity.Branch;
import com.titanic.entity.Employee;
import com.titanic.entity.Role;
import com.titanic.entity.User;
import com.titanic.respository.AuthorityRepository;
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
	private AuthorityRepository aRepo;
	
	@Autowired
	private BranchRepository bRepo;

	@PostConstruct
	public void Init() {
		Authority auth = new Authority();
		auth.setId(1);
		auth.setName("VIEW_EMPLOYEE");
		auth.setAuthority("VIEW_EMPLOYEE");
		aRepo.save(auth);
		
		ArrayList<Authority> authorities = new ArrayList<Authority>();
		authorities.add(auth);
		
		Role role = new Role();
		role.setId(1);
		role.setName("ADMIN");
		role.setDescription("role-admin");
		role.setAuthorities(authorities);
		rRepo.save(role);
		
		Branch defaultBranch = new Branch();
		defaultBranch.setId(1);
		defaultBranch.setAddress("Nelliyady, Jaffna.");
		defaultBranch.setContact("021-226-2323");
		defaultBranch.setName("Nelliyady-Titanic");
		bRepo.save(defaultBranch);
		
		User newUser = new User();
		newUser.setId(1);
		newUser.setName("ADMIN");
		newUser.setMobile("077-3284456");
		newUser.setUserName("admin");
		newUser.setPassword("admin");
		newUser.setAddress("Alvai, East");
		urepo.save(newUser);
		
		Employee newEmployee = new Employee();
		newEmployee.setId(1);
		newEmployee.setUser(newUser);
		newEmployee.setRole(role);
		newEmployee.setBranch(defaultBranch);
		eRepo.save(newEmployee);
		
	}

}
