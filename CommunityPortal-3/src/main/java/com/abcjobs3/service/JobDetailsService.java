package com.abcjobs3.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobDetails;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.repository.JobDetailsRepository;
import com.abcjobs3.repository.JobRepository;

@Service
@Transactional
public class JobDetailsService {

	@Autowired
	JobDetailsRepository jobDetailsRepo;
	
	@Autowired
	JobRepository jobRepo;
	
	public JobDetails saveJobDetails(JobDetails jobDetails) {
		return jobDetailsRepo.save(jobDetails);
	}
	
//	public JobDetails getDetailsById(Long id) {
//		return jobDetailsRepo.findById(id).get();
//	}
	
	public JobDetails updateJobDetails(Long jobDetailsId, JobDetails jd) {
		JobDetails jobDetails = jobDetailsRepo.findById(jobDetailsId).get();
		
		jobDetails.setJobDesc(jd.getJobDesc());
		jobDetails.setJobDos(jd.getJobDos());
		jobDetails.setJobQual(jd.getJobQual());
		jobDetails.setJobSkills(jd.getJobSkills());
		
		// save
 		return jobDetailsRepo.save(jobDetails);
	}
	
    public JobDetails getJobDetailsByJobId(Long jobId) {
        return jobDetailsRepo.findByJobId(jobId);
    }
    public JobDetails getDetailsById(Long jobDetailsId) {
        Optional<JobDetails> jobDetailsOptional = jobDetailsRepo.findById(jobDetailsId);
        return jobDetailsOptional.orElse(null);
    }
    
	public List<Job> searchByJobKey(String key) {
		return jobRepo.searchByJobKey(key);
	}
	
}
