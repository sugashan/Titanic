package com.titanic.service.review;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.titanic.entity.FeedBack;
import com.titanic.respository.FeedBackRepository;

@Service
public class ReviewManagementService {
	
	@Autowired
	private FeedBackRepository fbRepository;
	
	// GET ALL COMMENTS AND REVIEWS
	public List<FeedBack> getAllComments() {
		return fbRepository.findAll();
	}

	// SAVE NEW COMMENT
	public void save(@Valid FeedBack feedBack) {
		fbRepository.save(feedBack);
	}

}
