package com.titanic.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

@Entity
public class PackageMeals {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int id;
		
		@NotNull(message="Food Type Can Not Be Empty!")
		private int mealId;
		
		@NotNull(message="Food Type Can Not Be Empty!")
		private String mealName;
		
		@NotNull(message="Food Type Can Not Be Empty!")
		private String quantity;
		
		@OneToOne
		@JoinColumn(name="fcpkg_id")		
		private FoodComboPackage fcpkg;
		
		public int getMealId() {
			return mealId;
		}
		public void setMealId(int mealId) {
			this.mealId = mealId;
		}
		public String getMealName() {
			return mealName;
		}
		public void setMealName(String mealName) {
			this.mealName = mealName;
		}
		public String getQuantity() {
			return quantity;
		}
		public void setQuantity(String quantity) {
			this.quantity = quantity;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public FoodComboPackage getFcpkg() {
			return fcpkg;
		}
		public void setFcpkg(FoodComboPackage fcpkg) {
			this.fcpkg = fcpkg;
		}
		
		
	}
