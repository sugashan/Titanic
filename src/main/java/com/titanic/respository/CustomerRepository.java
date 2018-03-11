package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Customer;
import com.titanic.entity.User;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {

	Customer findByUser(User user);

}
