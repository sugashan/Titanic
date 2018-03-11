package com.titanic.entity;

public enum MealsSchedule {
	BREAKFAST("breakfast"), LUNCH("lunch"), DINNER("dinner"), ANYTIME("anyTime");
	private String name;
	
	MealsSchedule(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}
}
