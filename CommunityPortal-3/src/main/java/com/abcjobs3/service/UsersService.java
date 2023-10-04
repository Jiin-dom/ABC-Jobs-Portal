package com.abcjobs3.service;

import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.UsersRepository;

@Service
@Transactional
public class UsersService {
	@Autowired
	UsersRepository repo;
	
	public Users register(Users user) {
		return repo.save(user);
	}
	
    public Users saveUser(Users user) {
        return repo.save(user);
    }
	
	//Checks user credentials and also calls the method in the User repository
	public Users login(Users user) {
		try {
			Users login = repo.login(user.getEmail(), user.getPassword());
			return login;
		} catch (Exception e) {
			System.out.println("Credential is null " + e);
		}
		return null;
	}
	
	public String getLastUser() {
		return repo.getLastUser();
	}
	
	public boolean isUserExist(Long id) {
		try {
			repo.findById(id);
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	public String checkEmail(String email) {
		return repo.checkEmail(email);
	}
	
	public Users updatePassword(String password, String email) {
		Long userId = Long.parseLong(repo.checkEmail(email).split(",")[0]);
		Users user = repo.findById(userId).get();
		
		// update 
		user.setPassword(password);
		
		// save
		return repo.save(user);
	}
	
	public boolean deleteUserById(Long id) {
		try {
			repo.deleteById(id);
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
    public Users getUserById(Long userId) {
        // You can implement the logic to retrieve the user from the database by ID
        // For example:
        return repo.findById(userId).orElse(null);
    }
    
    public List<Users> getAllUsersExceptLoggedIn(String loggedInUsername) {
        return repo.findAllByEmailNot(loggedInUsername);
    }
    
    public List<Users> findAllUsersExceptLoggedInUser(Long userId) {
        return repo.findAllExceptLoggedInUser(userId);
    }

	
	
//	public boolean deleteUserById(Long id) {
//			repo.deleteById(id);
//			return true;
//
//	}
//	
//	public void deleteUserById(Long id) {
//		repo.deleteById(id);
//
//
//}
}
