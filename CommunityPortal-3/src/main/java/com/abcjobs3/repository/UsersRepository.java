package com.abcjobs3.repository;

import org.springframework.data.repository.query.Param;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.*;

@Repository
public interface UsersRepository extends JpaRepository<Users, Long> {
	
	Users findByEmail(String email);
	
    @Query(value = "SELECT * FROM users ORDER BY user_id DESC LIMIT 1", nativeQuery = true) 
    String getLastUser();
    
    @Query(value = "SELECT * FROM users WHERE :email = email AND :password = password", nativeQuery = true)
    Users login(@Param("email") String email, @Param("password") String password);

    @Query(value = "SELECT * FROM users WHERE email = :email", nativeQuery = true)
    String checkEmail(@Param("email") String email);
    
    List<Users> findAllByEmailNot(String email);
    
    @Query("SELECT u FROM Users u WHERE u.userId <> :userId")
    List<Users> findAllExceptLoggedInUser(@Param("userId") Long userId);
    
    
}

