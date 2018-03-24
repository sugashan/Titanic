package com.titanic.entity;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Employee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=10, max=12, message="Invalid NIC")
	private String nic;
	
	@Size(min=10, message="Invalid Mobile Number!")
	private String contact;
	
	@DateTimeFormat
	private String dob;

	@OneToOne
	private User user;
	
	@OneToOne
	@JoinColumn(name="branch_id")
	private Branch branch;
	
	private boolean availableForDeivery;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Boolean getAvailableForDeivery() {
		return availableForDeivery;
	}
	public void setAvailableForDeivery(Boolean availableForDeivery) {
		this.availableForDeivery = availableForDeivery;
	}
	
	
	
}
