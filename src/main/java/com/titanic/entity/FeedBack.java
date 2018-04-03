package com.titanic.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Size;


@Entity
public class FeedBack {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=3, message="Name Should Be Atleast 3 Character!")
	private String customerName;
	
	@Size(min=10, message="Enter a valid mobile!")
	private String custMobile;
	
	@javax.validation.constraints.Email(message="Invalid Email!")
	@Size(min=8, message="Invalid Email!")
	private String custEmail;
	
	@Size(min=4, message="Message Should Be Atleast 4 Character!")
	private String message;
	
	@Size(min=4, message="Subject Should Be Atleast 4 Character!")
	private String subject;
	
	
	private String replyMsg;
	private Boolean isReplied;
	
	
	public String getReplyMsg() {
		return replyMsg;
	}
	public void setReplyMsg(String replyMsg) {
		this.replyMsg = replyMsg;
	}
	public Boolean getIsReplied() {
		return isReplied;
	}
	public void setIsReplied(Boolean isReplied) {
		this.isReplied = isReplied;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustMobile() {
		return custMobile;
	}
	public void setCustMobile(String custMobile) {
		this.custMobile = custMobile;
	}
	public String getCustEmail() {
		return custEmail;
	}
	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
