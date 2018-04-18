package com.titanic.service.reviewandinquiry;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.titanic.entity.Customer;
import com.titanic.entity.Notification;
import com.titanic.entity.Orders;
import com.titanic.other.TitanicMessageConstant;
import com.titanic.respository.NotificatonRepository;

@Service
public class NotificationManagementService {
	
	@Autowired
	private NotificatonRepository nRepository;
	
	// SAVE NEW NOTIFICATION
	public void save(@Valid Notification notification) {
		nRepository.save(notification);
	}

	// PREPARE AND SAVE ORDER NOTIFICATION
	public void getAndSaveNotification(String orderStatus, Orders existingOrder) {
		String endString = "";
		
		if(TitanicMessageConstant.FINISHED_ORDER_MSG.equals(orderStatus)) {
			endString = TitanicMessageConstant.FINISHED_ORDER_MSG;
		}
		else if(TitanicMessageConstant.DELIVERED_ORDER.equals(orderStatus)) {
			endString = TitanicMessageConstant.DELIVERED_ORDER_MSG;
		}
		else if(TitanicMessageConstant.CANCELED_ORDER.equals(orderStatus)) {
			endString = TitanicMessageConstant.CANCELED_ORDER_MSG;
		}
		else if(TitanicMessageConstant.REJECTED_ORDER.equals(orderStatus)) {
			endString = TitanicMessageConstant.REJECTED_ORDER_MSG;
		}
		else if(TitanicMessageConstant.ACCEPTED_ORDER.equals(orderStatus)) {
			endString = TitanicMessageConstant.ACCEPTED_ORDER_MSG;
		}
		else if(TitanicMessageConstant.RECEIVED_ORDER.equals(orderStatus)) {
			endString = TitanicMessageConstant.RECEIVED_ORDER_MSG;
		}
		
		String msg = "Dear "+ existingOrder.getCustomer().getUser().getName()+", Your Order-"+ existingOrder.getOrderCode()  + " is " + endString + " " + TitanicMessageConstant.ME;
		System.out.println(msg);
		
		Notification notifier = new Notification();
		notifier.setCustomer(existingOrder.getCustomer());
		notifier.setRead(false);
		notifier.setMessage("Order "+ existingOrder.getOrderCode() + " is " + orderStatus);
		notifier.setDescription(msg);
		save(notifier);
		
	}

	// GET NEW NOTIFICATIONS FOR CUSTOMER
	public Notification getNewMsgs(Customer customer) {
		return nRepository.findOneByCustomerAndIsRead(customer, false);
	}
}
