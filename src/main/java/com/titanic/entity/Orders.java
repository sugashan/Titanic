package com.titanic.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String orderCode;
	private String orderStatus;
	
	@OneToOne
	private Payment payment;
	
	private String outletBranch;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderedOn;
	
	private String waitingTime;
	
	@OneToOne
	private Customer customer;
	
	private String orderType;
	private String tempStringForDeliveryOpt;
	
	@OneToMany(mappedBy="order", cascade=CascadeType.REMOVE)
	private List<FoodOrder> foodOrder;
	
	private String expectedDeliverTime; 
	
	private String foodOrderString;
	private String description;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastUpdatedTime;

	@OneToOne
	private Employee handledEmployee;
	
	
	// ORDERED-ON & DELIVERED TIME ON SERVER TIMESTAMP
	@PrePersist
    protected void onCreate() {
		orderedOn = new Date();
    }
	
	@PreUpdate
    protected void onUpdate() {
		lastUpdatedTime = new Date();
    }

	
	// GETTER SETTER
	
	public String getOrderType() {
		return orderType;
	}
	public Employee getHandledEmployee() {
		return handledEmployee;
	}
	public void setHandledEmployee(Employee handledEmployee) {
		this.handledEmployee = handledEmployee;
	}
	public String getTempStringForDeliveryOpt() {
		return tempStringForDeliveryOpt;
	}
	public void setTempStringForDeliveryOpt(String tempStringForDeliveryOpt) {
		this.tempStringForDeliveryOpt = tempStringForDeliveryOpt;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFoodOrderString() {
		return foodOrderString;
	}
	public void setFoodOrderString(String foodOrderString) {
		this.foodOrderString = foodOrderString;
	}
	public Date getLastUpdatedTime() {
		return lastUpdatedTime;
	}
	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}
	public String getExpectedDeliverTime() {
		return expectedDeliverTime;
	}
	public void setExpectedDeliverTime(String expectedDeliverTime) {
		this.expectedDeliverTime = expectedDeliverTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public String getOutletBranch() {
		return outletBranch;
	}
	public void setOutletBranch(String outletBranch) {
		this.outletBranch = outletBranch;
	}
	public Date getOrderedOn() {
		return orderedOn;
	}
	public void setOrderedOn(Date orderedOn) {
		this.orderedOn = orderedOn;
	}
	public String getWaitingTime() {
		return waitingTime;
	}
	public void setWaitingTime(String waitingTime) {
		this.waitingTime = waitingTime;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<FoodOrder> getFoodOrder() {
		return foodOrder;
	}
	public void setFoodOrder(List<FoodOrder> foodOrder) {
		this.foodOrder = foodOrder;
	}
	
}