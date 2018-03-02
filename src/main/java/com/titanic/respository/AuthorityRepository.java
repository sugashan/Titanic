package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.titanic.entity.Authority;

public interface AuthorityRepository extends JpaRepository<Authority, Integer> {

}
