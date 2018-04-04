package com.titanic.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class DeliveryOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String deliveryDate;
	private String deliveryTime;
	
	@OneToOne
	private Orders order;
	
	private String recieverCustName;
	private String deliveryAddress;
	private String houseNumber;
	private String refMobile;
	
	private Boolean deliveryStatus;
	
	// DELIVERY BOY
	@OneToOne
	private Employee employee;
	
	
	
	public String getRecieverCustName() {
		return recieverCustName;
	}
	public void setRecieverCustName(String recieverCustName) {
		this.recieverCustName = recieverCustName;
	}
	public String getHouseNumber() {
		return houseNumber;
	}
	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	public String getRefMobile() {
		return refMobile;
	}
	public void setRefMobile(String refMobile) {
		this.refMobile = refMobile;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public Boolean getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(Boolean deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
}
