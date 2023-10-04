package com.abcjobs3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.Users;

@Repository
public interface JobRepository extends JpaRepository<Job, Long>{
	@Query(value = "SELECT * FROM job"
	 		+ " WHERE job_title LIKE %:key%"
	 		+ " OR job_company LIKE %:key%"
	 		+ " OR job_location LIKE %:key%"
	 		+ " OR job_type LIKE %:key%"
	 		+ " OR work_setting LIKE %:key%", nativeQuery = true)
	public List<Job> searchByJobKey(@Param("key") String key);
	
//    @Query("SELECT j FROM Job j WHERE j NOT IN (SELECT ja.job FROM JobApplication ja WHERE ja.userId = :userId)")
//    List<Job> findJobsNotAppliedByUserId(@Param("userId") Long userId);
	
	@Query("SELECT j FROM Job j WHERE j NOT IN (SELECT ja.job FROM JobApplication ja WHERE ja.userId = :user)")
	List<Job> findJobsNotAppliedByUser(@Param("user") Users user);

}
