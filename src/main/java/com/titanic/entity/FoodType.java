package com.titanic.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

@Entity
public class FoodType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(min=3, message="Name Shoud Be Atleast 3 character!")
	private String name;
	private String description;
	
	@OneToMany(mappedBy="foodType", cascade=CascadeType.REMOVE)
	private List<Meal> meal;
	
	private String preFix;
	
	
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Meal> getMeal() {
		return meal;
	}
	public void setMeal(List<Meal> meal) {
		this.meal = meal;
	}
	public String getPreFix() {
		return preFix;
	}
	public void setPreFix(String preFix) {
		this.preFix = preFix;
	}
}
