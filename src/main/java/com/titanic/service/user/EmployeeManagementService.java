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
import com.titanic.respository.UserRepository;

@Service
public class EmployeeManagementService {
	
	@Autowired
	private EmployeeRepository eRepository;
	
	@Autowired
	private UserRepository uRepository;
	
	@Autowired
	private UserCommonService ucService;
	
	
	// GET ALL EMPLOYEE AS LIST
	public List<Employee> findAll(){
		return eRepository.findAll();
	}

	// SAVE NEW EMPLOYEE
	public void save(Employee employee) {
		employee.getUser().setEnabled(true);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		employee.getUser().setPassword(encoder.encode(employee.getUser().getPassword()));
		employee.setBranch(ucService.getBranchWithId(1));
		Role role = ucService.findRoleById(employee.getUser().getRoleId());
		
		if(role.getName() == "ROLE_DELIVERYBOY") {
			employee.setAvailableForDeivery(true);
		}
		employee.setAvailableForDeivery(false);
		employee.getUser().setRole(role);
		
		User resultUser = uRepository.save(employee.getUser());
		if(resultUser!= null)
		eRepository.save(employee);
	}

	// DELETE A EMPLOYEE
	@PreAuthorize(value = "hasRole('ROLE_ADMIN')")
	public void delete( int id) {
		Employee employee = findOnebyId(id);
		eRepository.delete(employee);
	}
	
	// GET A EMPLOYEE
	@Transactional
	public Employee findOnebyId(int id) {
		 return findByUser(ucService.findOneByIdUser(id));
	}
	
	@Transactional
	public Employee findByUser(User user) {
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
		employee.getUser().setRole(ucService.findRoleById(employee.getUser().getRoleId()));
		eRepository.save(updatedEmployee);
		return findOnebyId(id);
	}
	
	// GET ALL WITH ROLE
	public List<Employee> findAllByRole(int roleId) {
		return eRepository.findAllByEmployeeUserRoleIdAndAvailableForDeivery(roleId, true);
	}
	
	

}
