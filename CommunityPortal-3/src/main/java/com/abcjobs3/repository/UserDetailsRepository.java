package com.abcjobs3.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.UserDetails;

@Repository
public interface UserDetailsRepository extends JpaRepository<UserDetails, Long> {
//    @Query(value = "SELECT id_profile, first_name, last_name, headline, about, phone, company, city, country FROM user_profile"
//            + " JOIN users ON user_profile.user_id = users.user_id"
//            + " WHERE users.user_id = :userId", nativeQuery = true)
//    public String getDetailsById(@Param("userId") String userId);
//    
//    @Query(value = "SELECT * FROM user_profile"
//            + " WHERE first_name LIKE %:key%"
//            + " OR last_name LIKE %:key%"
//            + " OR headline LIKE %:key%"
//            + " OR city LIKE %:key%"
//            + " OR country LIKE %:key%", nativeQuery = true)
//    public List<UserDetails> searchByKey(@Param("key") String key);
	
    @Query(value = "SELECT id_profile, first_name, last_name, headline, about, phone, company, city, country FROM user_profile"
            + " JOIN users ON user_profile.userId = users.userId"
            + " WHERE users.userId = :userId", nativeQuery = true)
    public String getDetailsById(@Param("userId") String userId);
    
    @Query(value = "SELECT * FROM user_profile"
            + " WHERE first_name LIKE %:key%"
            + " OR last_name LIKE %:key%"
            + " OR headline LIKE %:key%"
            + " OR city LIKE %:key%"
            + " OR country LIKE %:key%", nativeQuery = true)
    public List<UserDetails> searchByKey(@Param("key") String key);
}

