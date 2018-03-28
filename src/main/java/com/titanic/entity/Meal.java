package com.titanic.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Meal {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=3, message="Invalid Meal Name!")
	private String name;
	
	// Save the location of the image
	private String imageUrl;
	
	private String code;
	
	@NotNull(message="price Can Not Be Empty!")
	private Float price;
	
	@OneToOne
	private User addedByUser;
	
	@NotNull(message="Prefered Time Can Not Be Empty!")
	private String preferedTime;
	private String description;
	
	@NotNull(message="Prefered Time Can Not Be Empty!")
	private String itemCatergory;
	
	@OneToOne
	@JoinColumn(name="foodType_id")
	private FoodType foodType;
	
	@NotNull(message="Food Type Can Not Be Empty!")
	private int foodTypeId;
	
	private String incrediants;
	private boolean isSpecial;
	
	
	

	public boolean isSpecial() {
		return isSpecial;
	}
	public void setSpecial(boolean isSpecial) {
		this.isSpecial = isSpecial;
	}
	public String getIncrediants() {
		return incrediants;
	}
	public void setIncrediants(String incrediants) {
		this.incrediants = incrediants;
	}
	public int getFoodTypeId() {
		return foodTypeId;
	}
	public void setFoodTypeId(int foodTypeId) {
		this.foodTypeId = foodTypeId;
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
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public User getAddedByUser() {
		return addedByUser;
	}
	public void setAddedByUser(User addedByUser) {
		this.addedByUser = addedByUser;
	}
	public FoodType getFoodType() {
		return foodType;
	}
	public void setFoodType(FoodType foodType) {
		this.foodType = foodType;
	}
	public String getPreferedTime() {
		return preferedTime;
	}
	public void setPreferedTime(String preferedTime) {
		this.preferedTime = preferedTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getItemCatergory() {
		return itemCatergory;
	}
	public void setItemCatergory(String itemCatergory) {
		this.itemCatergory = itemCatergory;
	}
	
	
}
