package com.titanic.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.titanic.entity.Employee;
import com.titanic.entity.User;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee findByUser(User user);

	@Query("select e from Employee e where e.user.roleId = :roleId and e.availableForDeivery = :availableForDeivery")
	List<Employee> findAllByEmployeeUserRoleIdAndAvailableForDeivery(@Param("roleId") int roleId, @Param("availableForDeivery") boolean availableForDeivery);

}
