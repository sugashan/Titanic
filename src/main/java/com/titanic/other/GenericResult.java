package com.titanic.other;

/**
 * @author S.Sugashan
 * @CreatedOn 19th December 2017
 * @Purpose Return result definition - to return complex results in methods
 */
public class GenericResult {
	
	private String message;

    private Object result;
    
	public GenericResult(String message, Object result) {
		super();
		this.message = message;
		this.result = result;
	}
	
	public GenericResult() {
		// TODO Auto-generated constructor stub
	}


	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
    
}
