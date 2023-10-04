package com.abcjobs3.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.JobApplicationRepository;
import com.abcjobs3.repository.JobRepository;

@Service
@Transactional
public class JobService {

	@Autowired
	JobRepository jobRepository;
	
	@Autowired
	JobApplicationRepository jobApplicationRepository;
	
	public Job postJob(Job job) {
		return jobRepository.save(job);
	}
	
    public List<Job> getAllJobs() {
        return jobRepository.findAll();
    }
    
    public Job getJobById(Long id) {
        Optional<Job> optionalJob = jobRepository.findById(id);
        return optionalJob.orElse(null);
    }
    
    
//    public List<Job> getJobsNotAppliedByUser(Long userId) {
//        return jobRepository.findJobsNotAppliedByUserId(userId);
//    }
    
    public List<Job> getJobsNotAppliedByUser(Users user) {
        return jobRepository.findJobsNotAppliedByUser(user);
    }
    
//	public boolean deleteJobById(Long jobId) {
//		try {
//			jobRepository.deleteById(jobId);
//			return true;
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		return false;
//	}
    
    public boolean deleteJobAndApplications(Long jobId) {
        Optional<Job> jobOptional = jobRepository.findById(jobId);
        if (jobOptional.isPresent()) {
            Job job = jobOptional.get();
            jobApplicationRepository.deleteByJob(job); // Delete all job applications for this job
            jobRepository.delete(job); // Delete the job itself
            return true;
        }
        return false;
    }
    



	
}
