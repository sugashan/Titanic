package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Branch;

public interface BranchRepository extends JpaRepository<Branch, String>{

}
