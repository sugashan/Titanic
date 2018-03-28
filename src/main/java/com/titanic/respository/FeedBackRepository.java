package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.FeedBack;

public interface FeedBackRepository extends JpaRepository<FeedBack, Integer> {

}
