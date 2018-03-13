package com.titanic.service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Employee;
import com.titanic.entity.Role;
import com.titanic.entity.User;
import com.titanic.respository.EmployeeRepository;
import com.titanic.respository.RoleRepository;
import com.titanic.respository.UserRepository;

@Service
public class EmployeeManagementService {
	
	@Autowired
	private EmployeeRepository eRepository;
	
	@Autowired
	private UserRepository uRepository;
	
	@Autowired
	private RoleRepository rRepository;
	
	
	// GET ALL EMPLOYEE AS LIST
	public List<Employee> findAll(){
		return eRepository.findAll();
	}

	// SAVE NEW EMPLOYEE
	public void save(Employee employee) {
		employee.getUser().setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		employee.getUser().setPassword(encoder.encode(employee.getUser().getPassword()));
		uRepository.save(employee.getUser());
		eRepository.save(employee);
	}

	// DELETE A EMPLOYEE
	@PreAuthorize(value = "hasRole('ROLE_ADMIN')")
	public void delete( Employee employee) {
		eRepository.delete(employee);
	}
	
	// GET A USER WITH ID
	public User findOneByIdUser(int id) {
		return uRepository.findById(id);
	}
	
	// GET A EMPLOYEE
	@Transactional
	public Employee findOnebyId(int id) {
		User user = findOneByIdUser(id);
		 return eRepository.findByUser(user);
	}

	// UPDATE A EMPLOYEE
	@Transactional
	public Employee update(Employee employee, int id) {
		Employee updatedEmployee = findOnebyId(id);
		
		updatedEmployee.setUser(employee.getUser());
		updatedEmployee.setBranch(employee.getBranch());
		updatedEmployee.setContact(employee.getContact());
		updatedEmployee.setDob(employee.getDob());
		updatedEmployee.setNic(employee.getNic());
		eRepository.save(updatedEmployee);
		return findOnebyId(id);
	}

	// GET ALL ROLES
	public List<Role> findAllRoles() {
		List<Role> roles= rRepository.findAll();
		//	List<Authority> authority = aRepository.findByRoles(roles);
		return roles;
	}
	
	// GET EMPLOYEE WITH NAME
	public Employee findOneByName(String name) {
		User user = uRepository.findByUserName(name);
		return eRepository.findByUser(user);
	}

	// GET ROLE WITH ID
	public Role findRoleById(int id) {
		return rRepository.findById(id);
	}

	
}
