package com.titanic.entity;

public enum ItemCatergory {
	
	STARTER("starter"), DISH("dish"), APPERTIZERS("appertizers"), DESERTS("deserts"), BEVERAGES("beverages");
	private String name;
	
	ItemCatergory(String name) {
		this.name=name;
	}
	public String getName() {
		return name;
	}

}
