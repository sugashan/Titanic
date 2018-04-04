package com.titanic.service.user;

import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.titanic.entity.Customer;
import com.titanic.entity.User;
import com.titanic.respository.CustomerRepository;
import com.titanic.respository.UserRepository;

@Service
public class CustomerManagementService {
	
	@Autowired
	private CustomerRepository cRepository;
	
	@Autowired
	private UserRepository uRepository;
	
	@Autowired
	private UserCommonService ucService;
	
	// WHILE SAVING CUDTOMER WITH YOUR ROLE
	public void save(Customer customer) {
		customer.getUser().setEnabled(true);
		customer.getUser().setRole(ucService.findRoleById(4));
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		customer.getUser().setPassword(encoder.encode(customer.getUser().getPassword()));
		User resultUser = uRepository.save(customer.getUser());
		if(resultUser != null)
		cRepository.save(customer);
	}
	
	// GET ALL EMPLOYEE AS LIST
	public List<Customer> findAll(){
		return cRepository.findAll();
	}

	// DELETE A CUSTOMER
	@PreAuthorize(value = "hasRole('ROLE_ADMIN', 'ROLE_CUSTOMER')")
	public void deleteCustomer(int id) {
		cRepository.delete(findOnebyId(id));
	}
	
	// GET A CUSTOMER
	@Transactional
	public Customer findOnebyId(int id) {
		 return cRepository.findByUser( ucService.findOneByIdUser(id));
	}

	// UPDATE A CUSTOMER
	public Customer update(@Valid Customer customer, int id) {
		Customer updatedCustomer = findOnebyId(id);
		updatedCustomer.setUser(customer.getUser());
		cRepository.save(updatedCustomer);
		return findOnebyId(id);
	}

	// GET CUSTOMER WITH NAME
	public Customer findOneByName(String name) {
		return cRepository.findByUser(ucService.findOneByUserName(name));
	}
	
	// GET CUSTOMER WITH USER
	public Customer findOneByUser(User currLogger) {
		return cRepository.findByUser(currLogger);
	}
}
