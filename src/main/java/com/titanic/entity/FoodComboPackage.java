package com.titanic.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;


@Entity
public class FoodComboPackage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String code;
	@NotNull(message="Food Type Can Not Be Empty!")
	private String name;
	
	@OneToMany(mappedBy="fcpkg", cascade=CascadeType.REMOVE)
	private List<PackageMeals> packageMeal;
	
	private float price;
	private String image;
	private String description;
	@NotNull(message="Food Type Can Not Be Empty!")
	private String validUntil;
	@NotNull(message="Food Type Can Not Be Empty!")
	private String addedOn;
	private Boolean status;
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAddedOn() {
		return addedOn;
	}
	public void setAddedOn(String addedOn) {
		this.addedOn = addedOn;
	}
	public String getValidUntil() {
		return validUntil;
	}
	public void setValidUntil(String validUntil) {
		this.validUntil = validUntil;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public List<PackageMeals> getPackageMeal() {
		return packageMeal;
	}
	public void setPackageMeal(List<PackageMeals> packageMeal) {
		this.packageMeal = packageMeal;
	}

	
}
