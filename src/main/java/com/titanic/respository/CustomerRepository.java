package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.titanic.entity.Customer;
import com.titanic.entity.User;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

	Customer findByUser(User user);

	@Query("SELECT COUNT(id) FROM Customer WHERE user.enabled IS 'true'")
	int countActiveCustomersByenabled();

}
