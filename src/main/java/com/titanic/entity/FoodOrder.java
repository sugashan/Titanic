package com.titanic.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

@Entity
public class FoodOrder {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int mealId;
	
	@NotNull(message="Quantity should be atleast 1.")
	private int quantity;
	
	private String customizedFoodMsg;
	
	@OneToOne
	@JoinColumn(name="order_id")
	private Orders order;
	
	private String mealName;
	

	public String getMealName() {
		return mealName;
	}
	public void setMealName(String mealName) {
		this.mealName = mealName;
	}
	public int getMealId() {
		return mealId;
	}
	public void setMealId(int mealId) {
		this.mealId = mealId;
	}
	public String getCustomizedFoodMsg() {
		return customizedFoodMsg;
	}
	public void setCustomizedFoodMsg(String customizedFoodMsg) {
		this.customizedFoodMsg = customizedFoodMsg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
}
