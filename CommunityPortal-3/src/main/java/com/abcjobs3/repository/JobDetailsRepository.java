package com.abcjobs3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobDetails;
import com.abcjobs3.entity.UserDetails;

@Repository
public interface JobDetailsRepository extends JpaRepository<JobDetails, Long> {
	JobDetails findByJobId(Long jobId);
	

}
