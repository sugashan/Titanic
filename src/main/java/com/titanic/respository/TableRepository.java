package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.titanic.entity.Table;

public interface TableRepository extends JpaRepository<Table, Integer> {

}
