package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.titanic.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

}
