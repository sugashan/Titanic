package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Login;

public interface LoginRepository extends JpaRepository<Login, Integer> {


}
