package com.titanic.respository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Customer;
import com.titanic.entity.Notification;

public interface NotificatonRepository extends JpaRepository<Notification, Integer> {


	Notification findOneByCustomerAndIsRead(Customer customer, boolean b);

}
