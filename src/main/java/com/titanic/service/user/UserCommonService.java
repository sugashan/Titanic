package com.titanic.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.titanic.entity.Branch;
import com.titanic.entity.Login;
import com.titanic.entity.Role;
import com.titanic.entity.User;
import com.titanic.respository.BranchRepository;
import com.titanic.respository.LoginRepository;
import com.titanic.respository.RoleRepository;
import com.titanic.respository.UserRepository;

@Service
public class UserCommonService {
	
	@Autowired
	private UserRepository uRepository;
	
	@Autowired
	private RoleRepository rRepository;
	
	@Autowired
	private BranchRepository bRepository;
	
	@Autowired
	private LoginRepository lRepository;

		// GET A USER WITH ID
		public User findOneByIdUser(int id) {
			return uRepository.findById(id);
		}
		
		// GET A USER WITH NAME
		public User findOneByUserName(String name) {
			return uRepository.findByUserName(name);
		}
		
		// GET ROLE WITH ID
		public Role findRoleById(int id) {
			return rRepository.findById(id);
		}
		
		// GET ALL ROLES
		public List<Role> findAllRoles() {
			List<Role> roles= rRepository.findAll();
			//	List<Authority> authority = aRepository.findByRoles(roles);
			return roles;
		}
		
		// GET BRANCH WITH ID
		public Branch getBranchWithId(int id) {
			return bRepository.findById(1);
		}

		// SAVING LOGGING CREDIANTIAL
		public void saveLogin(User currUser) {
			Login logger = new Login();
			logger.setUser(currUser);
			lRepository.save(logger);
		}
}
