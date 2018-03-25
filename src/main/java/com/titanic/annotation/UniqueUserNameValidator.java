package com.titanic.annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.titanic.respository.UserRepository;

public class UniqueUserNameValidator implements ConstraintValidator<UniqueUserName, String>{
	
	@Autowired
	private UserRepository uRepository;
	
	@Override
	public void initialize(UniqueUserName constraintAnnotation) {
	}

	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(uRepository == null) {
			return true;
		}
		return uRepository.findByUserName(value) == null;
	}
}
