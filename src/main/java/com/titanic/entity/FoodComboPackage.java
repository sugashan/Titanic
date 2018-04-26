package com.titanic.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;


@Entity
public class FoodComboPackage {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String code;
	
	@NotNull(message="Food Type Can Not Be Empty!")
	private String name;
	
	@OneToMany(mappedBy="fcpkg")
	private List<PackageMeals> packageMeal;
	
	private float price;
	private String image;
	private String description;
	
	private String validUntil;
	
	private String validFrom;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date addedOn;
	
	private Boolean status;
	
	private String pckgMealString;
	
	@PrePersist
    protected void onCreate() {
		addedOn = new Date();
    }
	
	
	public String getPckgMealString() {
		return pckgMealString;
	}
	public void setPckgMealString(String pckgMealString) {
		this.pckgMealString = pckgMealString;
	}
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
	public String getValidUntil() {
		return validUntil;
	}
	public void setValidUntil(String validUntil) {
		this.validUntil = validUntil;
	}
	public String getValidFrom() {
		return validFrom;
	}
	public void setValidFrom(String validFrom) {
		this.validFrom = validFrom;
	}
	public Date getAddedOn() {
		return addedOn;
	}
	public void setAddedOn(Date addedOn) {
		this.addedOn = addedOn;
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
