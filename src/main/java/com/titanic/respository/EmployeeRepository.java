package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Employee;
import com.titanic.entity.User;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee findByUser(User user);

}
