package com.abcjobs3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobApplication;
import com.abcjobs3.entity.Users;

@Repository
public interface JobApplicationRepository extends JpaRepository<JobApplication, Long> {
//    boolean existsByJob_JobIdAndUserId(Long jobId, Long userId);
//    
//    void deleteByJob_JobIdAndUserId(Long jobId, Long userId);
//    
//    @Query("SELECT ja FROM JobApplication ja WHERE ja.job = :job AND ja.userId = :user")
//    JobApplication findByJobAndUserId(@Param("job") Job job, @Param("user") Users user);
//    
//    @Query("SELECT ja FROM JobApplication ja WHERE ja.job.jobTitle = :jobTitle AND ja.userId.user_id = :userId")
//    JobApplication findByJobTitleAndUserId(@Param("jobTitle") String jobTitle, @Param("userId") Long userId);
//    
//    @Query("SELECT ja.job.jobId FROM JobApplication ja WHERE ja.userId.user_id = :userId")
//    List<Long> findJobIdsByUserId(@Param("userId") Long userId);
//    
//    JobApplication findByUserIdAndJobJobTitle(Long userId, String jobTitle);
//    
//    JobApplication findByUserIdAndJobJobTitle(Users user, String jobTitle);
//    
//    @Query("SELECT j FROM Job j WHERE j NOT IN (SELECT ja.job FROM JobApplication ja WHERE ja.userId.user_id = :userId)")
//    List<Job> findJobsNotAppliedByUserId(@Param("userId") Long userId);
//    
//    List<JobApplication> findByUserIdUserId(Long userId);
	
	 boolean existsByJob_JobIdAndUserId(Long jobId, Long userId);
	    
    void deleteByJob_JobIdAndUserId(Long jobId, Long userId);
    
    @Query("SELECT ja FROM JobApplication ja WHERE ja.job = :job AND ja.userId = :user")
    JobApplication findByJobAndUserId(@Param("job") Job job, @Param("user") Users user);
    
    @Query("SELECT ja FROM JobApplication ja WHERE ja.job.jobTitle = :jobTitle AND ja.userId.userId = :userId")
    JobApplication findByJobTitleAndUserId(@Param("jobTitle") String jobTitle, @Param("userId") Long userId);
    
    @Query("SELECT ja.job.jobId FROM JobApplication ja WHERE ja.userId.userId = :userId")
    List<Long> findJobIdsByUserId(@Param("userId") Long userId);
    
    JobApplication findByUserIdAndJobJobTitle(Long userId, String jobTitle);
    
    JobApplication findByUserIdAndJobJobTitle(Users user, String jobTitle);
    
    
    List<JobApplication> findByUserIdUserId(Long userId);
    
    void deleteByJobAndUserId(Job job, Users user);
    
    //delete job application when job is deleted
    void deleteByJob(Job job);

    

    
}

