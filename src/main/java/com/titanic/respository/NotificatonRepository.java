package com.titanic.respository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Customer;
import com.titanic.entity.Notification;

public interface NotificatonRepository extends JpaRepository<Notification, Integer> {


	List<Notification> findAllByCustomerAndIsRead(Customer customer, boolean b);

}
