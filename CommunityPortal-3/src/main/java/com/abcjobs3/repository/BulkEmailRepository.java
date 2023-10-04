package com.abcjobs3.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.BulkEmail;

@Repository
public interface BulkEmailRepository extends JpaRepository<BulkEmail, Long>{

}
