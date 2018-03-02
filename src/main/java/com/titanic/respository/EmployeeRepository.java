package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
