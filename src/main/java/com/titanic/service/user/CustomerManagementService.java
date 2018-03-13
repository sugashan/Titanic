package com.titanic.service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Customer;
import com.titanic.entity.Role;
import com.titanic.entity.User;
import com.titanic.respository.CustomerRepository;
import com.titanic.respository.RoleRepository;
import com.titanic.respository.UserRepository;

@Service
public class CustomerManagementService {
	
	@Autowired
	private CustomerRepository cRepository;
	
	@Autowired
	private UserRepository uRepository;
	
	@Autowired
	private RoleRepository rRepository;
	
	// WHILE SAVING CUDTOMER WITH YOUR ROLE
	public void save(Customer customer) {
		customer.getUser().setEnabled(true);
		
		Role userRole = rRepository.findById(4);
		customer.getUser().setRole(userRole);
		
		customer.getUser().setRole(userRole);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		customer.getUser().setPassword(encoder.encode(customer.getUser().getPassword()));
		uRepository.save(customer.getUser());
		cRepository.save(customer);
	}
	
	
	// GET ALL EMPLOYEE AS LIST
	public List<Customer> findAll(){
		return cRepository.findAll();
	}

	// DELETE A CUSTOMER
	@PreAuthorize(value = "hasRole('ROLE_ADMIN', 'ROLE_CUSTOMER')")
	public void delete(int id) {
		cRepository.delete(findOnebyId(id));
	}
	
	// GET A USER WITH ID
	public User findOneByIdUser(int id) {
		return uRepository.findById(id);
	}
	
	// GET A CUSTOMER
	@Transactional
	public Customer findOnebyId(int id) {
		User user = findOneByIdUser(id);
		 return cRepository.findByUser(user);
	}
	
}
