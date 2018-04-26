package com.titanic.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import com.titanic.annotation.UniqueUserName;


@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=3, message="Name Should Be Atleast 3 Character!")
	private String name;
	
	private String mobile;
	
	@Size(min=4, message="Password Should Be Atleast 4 Character!")
	private String password;
	
	@javax.validation.constraints.Email(message="Invalid Email!")
	@Size(min=5, message="Invalid Email!")
	private String email;
	
	@Size(min=4, message="Invalid UserName!")
	@Column(unique = true)
	@UniqueUserName(message="UserName Already exits!")
	private String userName;
	
	private String address;
	private Boolean enabled;
	
	private int roleId;
	
	@OneToOne
	private Login login;
	
	@OneToOne
	private Role role;
	
	// CONSTRUCTORS
	public User(int id, @Size(min = 3, message = "Name Should Be Atleast 3 Character!") String name,
			@Size(min = 10, message = "Invalid Mobile Number!") String mobile,
			@Email(message = "Invalid Email!") @Size(min = 5, message = "Invalid Email!") String email,
			@Size(min = 4, message = "Invalid UserName!") String userName, String address) {
		
		super();
		this.id = id;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.userName = userName;
		this.address = address;
	}
	
	public User() {

	}

	// GETTERS SETTERS
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Login getLogin() {
		return login;
	}
	public void setLogin(Login login) {
		this.login = login;
	}
	public Boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
}
