package com.titanic.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	private User user;
	
	private String codeBasedCity;
	
	@OneToMany
	private List<Inquiry> inquries;
	
	@OneToMany
	private List<Notification> messages;
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCodeBasedCity() {
		return codeBasedCity;
	}
	public void setCodeBasedCity(String codeBasedCity) {
		this.codeBasedCity = codeBasedCity;
	}
	public List<Inquiry> getInquries() {
		return inquries;
	}
	public void setInquries(List<Inquiry> inquries) {
		this.inquries = inquries;
	}
	public List<Notification> getMessages() {
		return messages;
	}
	public void setMessages(List<Notification> messages) {
		this.messages = messages;
	}
	
	
}
