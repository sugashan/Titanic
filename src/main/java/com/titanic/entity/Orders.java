package com.titanic.entity;

import java.util.Date;
import java.util.List;

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
	
	@OneToOne
	private Branch outletBranch;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date orderedOn;
	
	private String waitingTime;
	
	@OneToOne
	private Customer customer;
	
	@OneToOne
	private Employee cook;
	
	private String deliveryType;
	
	@OneToMany
	private List<FoodOrder> foodOrder;
	
	@OneToOne
	private DeliveryOrder deliveryTypeorder;
	
	@OneToOne
	private PickUpDeskOrder pickUpOrder;
	
	private String expectedOrderTime; 
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date deliveredTime;
	
	
	// ORDERED-ON & DELIVERED TIME ON SERVER TIMESTAMP
	@PrePersist
    protected void onCreate() {
		orderedOn = new Date();
    }
	
	@PreUpdate
    protected void onUpdate() {
		deliveredTime = new Date();
    }

	
	// GETTER SETTER
	public Date getDeliveredTime() {
		return deliveredTime;
	}
	public void setDeliveredTime(Date deliveredTime) {
		this.deliveredTime = deliveredTime;
	}
	public String getExpectedOrderTime() {
		return expectedOrderTime;
	}
	public void setExpectedOrderTime(String expectedOrderTime) {
		this.expectedOrderTime = expectedOrderTime;
	}
	public PickUpDeskOrder getPickUpOrder() {
		return pickUpOrder;
	}
	public void setPickUpOrder(PickUpDeskOrder pickUpOrder) {
		this.pickUpOrder = pickUpOrder;
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
	public Branch getOutletBranch() {
		return outletBranch;
	}
	public void setOutletBranch(Branch outletBranch) {
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
	public Employee getCook() {
		return cook;
	}
	public void setCook(Employee cook) {
		this.cook = cook;
	}
	public List<FoodOrder> getFoodOrder() {
		return foodOrder;
	}
	public void setFoodOrder(List<FoodOrder> foodOrder) {
		this.foodOrder = foodOrder;
	}
	public String getDeliveryType() {
		return deliveryType;
	}
	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	public DeliveryOrder getDeliveryTypeorder() {
		return deliveryTypeorder;
	}
	public void setDeliveryTypeorder(DeliveryOrder deliveryTypeorder) {
		this.deliveryTypeorder = deliveryTypeorder;
	}
	
}