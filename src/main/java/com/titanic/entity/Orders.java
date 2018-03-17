package com.titanic.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String orderCode;
	private String orderStatus;
	private Payment payment;
	private Branch branch;
	private String orderedOn;
	private String waitingTime;
	private Customer customer;
	private Employee employee;
	private String deliveryType;
	
	@OneToMany
	private List<FoodOrder> foodOrder;
	
	@OneToOne
	private DeliveryOrder deliveryTypeorder;

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
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	public String getOrderedOn() {
		return orderedOn;
	}
	public void setOrderedOn(String orderedOn) {
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
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
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