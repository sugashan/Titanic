package com.titanic.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.titanic.entity.Authority;
import com.titanic.entity.Role;


public interface AuthorityRepository extends JpaRepository<Authority, Integer> {

	List<Authority> findByRoles(List<Role> roles);



}
