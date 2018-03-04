package com.titanic.service.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.titanic.entity.Employee;
import com.titanic.respository.EmployeeRepository;

@Service
public class EmployeeManagementService {
	
	@Autowired
	private EmployeeRepository eRepository;

	public List<Employee> findAll(){
		return eRepository.findAll();
	}

}
