package com.titanic.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;


@Entity
public class Inquiry {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	private Customer customer;
	
	@Size(min=4, message="Message Should Be Atleast 4 Character!")
	private String inqMessage;
	
	@Size(min=4, message="Subject Should Be Atleast 4 Character!")
	private String inqSubject;
	
	
	private String inqreplyMsg;
	private Boolean isReplied;
	
	public Boolean getIsReplied() {
		return isReplied;
	}
	public void setIsReplied(Boolean isReplied) {
		this.isReplied = isReplied;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInqMessage() {
		return inqMessage;
	}
	public void setInqMessage(String inqMessage) {
		this.inqMessage = inqMessage;
	}
	public String getInqSubject() {
		return inqSubject;
	}
	public void setInqSubject(String inqSubject) {
		this.inqSubject = inqSubject;
	}
	public String getInqreplyMsg() {
		return inqreplyMsg;
	}
	public void setInqreplyMsg(String inqreplyMsg) {
		this.inqreplyMsg = inqreplyMsg;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
}
