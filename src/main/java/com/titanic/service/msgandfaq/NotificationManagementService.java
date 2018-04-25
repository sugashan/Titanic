package com.titanic.service.msgandfaq;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.titanic.entity.Customer;
import com.titanic.entity.Notification;
import com.titanic.respository.NotificatonRepository;

@Service
public class NotificationManagementService {
	
	@Autowired
	private NotificatonRepository nRepository;
	
	// SAVE NEW NOTIFICATION
	public void save(@Valid Notification notification) {
		nRepository.save(notification);
	}

	// GET NEW NOTIFICATIONS FOR CUSTOMER
	public List<Notification> getNewMsgs(Customer customer) {
		return nRepository.findAllByCustomerAndIsRead(customer, false);
	}
}
