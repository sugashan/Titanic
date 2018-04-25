package com.titanic.other;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.titanic.entity.FoodOrder;
import com.titanic.entity.Notification;
import com.titanic.entity.Orders;
import com.titanic.respository.OrderFoodRepository;
import com.titanic.service.food.MealManagementService;
import com.titanic.service.msgandfaq.NotificationManagementService;

@Service
@Transactional
public class OrderRelatedCommonService {
	
	@Autowired
	private MealManagementService mmService;
	
	@Autowired
	private NotificationManagementService nmService;
	
	@Autowired
	private OrderFoodRepository ofRepository;
	

	// CALCULATE WAITING TIME
	public int getCalculateExpectedWaitingTime(FoodOrder foodOrder) {
		int waitingTime = 0;
		// TODO Auto-generated method stub
		int forOneMealWaitingtime = mmService.findOnebyId(foodOrder.getMealId()).getAvgCookingTime();
		int arrearOrderOnSameMeal = ofRepository.countByMealIdInState(TitanicMessageConstant.ACCEPTED_ORDER, foodOrder.getMealId());
		int quantity = foodOrder.getQuantity();
		waitingTime = (quantity + arrearOrderOnSameMeal) * forOneMealWaitingtime;
		return waitingTime;
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
			if(existingOrder.getExpectedDeliverTime() != "") {
				endString += " Expected Deliver time: "+ existingOrder.getExpectedDeliverTime();
			}
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
		nmService.save(notifier);
		
	}

}
