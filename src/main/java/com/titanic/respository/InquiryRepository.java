package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Inquiry;

public interface InquiryRepository extends JpaRepository<Inquiry, Integer> {

}
