package com.titanic.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.titanic.entity.Employee;
import com.titanic.entity.User;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

	Employee findByUser(User user);

//	@Query("SELECT e from Employee e where e.user.roleId = :role_id and e.availableForDeivery = :availableForDeivery")
//	List<Employee> findAvailabledeliveryBoy(@Param("role_id")int id, @Param("availableForDeivery") boolean availableForDeivery);


	List<Employee> findTop5ByUserRoleIdAndAvailableForDeivery(int roleId, boolean availableForDeivery);
}
