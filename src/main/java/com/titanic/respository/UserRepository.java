package com.titanic.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.titanic.entity.Role;
import com.titanic.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findById(int id);

	User findByUserName( String name);

	@Query("SELECT new com.titanic.entity.User( u.id , u.name, u.mobile, u.email, u.userName, u.address) FROM User u WHERE u.mobile = :mobile AND u.enabled = :enabled")
	User findByMobile(@Param("mobile") String mobile, @Param("enabled") boolean enabled);

	User findByRole(Role findRoleById);
}
