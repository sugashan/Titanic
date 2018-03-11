package com.titanic.service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
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
		System.out.println("saving..");
		uRepository.save(employee.getUser());
		eRepository.save(employee);
	}

	// DELETE A EMPLOYEE
	public void delete(int id) {
		eRepository.delete(findOnebyId(id));
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
		updatedEmployee.setRole(employee.getRole());
		updatedEmployee.setGender(employee.getGender());
		eRepository.save(updatedEmployee);
		return findOnebyId(id);
	}

	// GET ALL ROLES
	public List<Role> findAllRoles() {
		List<Role> roles= rRepository.findAll();
		//	List<Authority> authority = aRepository.findByRoles(roles);
		return roles;
	}

	
}
