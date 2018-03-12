package com.titanic.service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Employee;
import com.titanic.entity.User;
import com.titanic.respository.EmployeeRepository;
import com.titanic.respository.UserRepository;

@Service
public class CustomerManagementService {
	
	@Autowired
	private EmployeeRepository eRepository;
	
	@Autowired
	private UserRepository uRepository;
	
	// WHILE SAVING CUDTOMER 
	
	
	
	// GET ALL EMPLOYEE AS LIST
	public List<Employee> findAll(){
		return eRepository.findAll();
	}

	// DELETE A CUSTOMER
	public void delete(int id) {
		eRepository.delete(findOnebyId(id));
	}
	
	// GET A USER WITH ID
	public User findOneByIdUser(int id) {
		return uRepository.findById(id);
	}
	
	// GET A CUSTOMER
	@Transactional
	public Employee findOnebyId(int id) {
		User user = findOneByIdUser(id);
		 return eRepository.findByUser(user);
	}
	
}
