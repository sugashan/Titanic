package com.titanic.service.reviewandinquiry;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.titanic.entity.Inquiry;
import com.titanic.respository.InquiryRepository;

@Service
public class InquiryManagementService {

	@Autowired
	private InquiryRepository iRepository;
	
	// SAVE INQUIRY
	public void save(@Valid Inquiry inq) {
		iRepository.save(inq);
	}

}
