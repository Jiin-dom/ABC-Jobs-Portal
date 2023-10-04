package com.abcjobs3.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobApplication;
import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.JobApplicationRepository;
import com.abcjobs3.repository.JobRepository;
import com.abcjobs3.repository.UsersRepository;

@Service
@Transactional
public class JobApplicationService{
	
	@Autowired
	JobApplicationRepository jobappRepo;
	
	@Autowired
	UsersService userService;
	
	@Autowired
	JobService jobService;
	
	@Autowired
	UsersRepository userRepository;
	
	@Autowired
	JobRepository jobRepository;

	 public void applyForJob(Long jobId, Long userId) {
	    Users user = userService.getUserById(userId);
        Job job = jobService.getJobById(jobId);

        if (user != null && job != null) {
            JobApplication jobApplication = new JobApplication();
            jobApplication.setUserId(user);
            jobApplication.setJob(job);
            jobApplication.setApplicationDate(LocalDateTime.now());

            jobappRepo.save(jobApplication);
        } else {
            // Handle case where user or job is not found
        }
    }
	 
//	   public void saveJobApplication(JobApplication jobApplication) {
//		   jobappRepo.save(jobApplication);
//	    }
	 
	    public void saveJobApplication(JobApplication jobApplication, Long userId) {
	        // Fetch the user from the repository to ensure it's a managed entity
	        Users user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("Invalid user ID"));

	        // Set the user in the JobApplication
	        jobApplication.setUserId(user);
	        jobApplication.setApplicationDate(LocalDateTime.now());

	        // Save the job application
	        jobappRepo.save(jobApplication);
	    }
	    
	    public void saveJobApplication(JobApplication jobApplication) {
	    	jobappRepo.save(jobApplication);
	    }
	   
//	    public boolean hasUserApplied(Long jobId, Long userId) {
//	        return jobappRepo.existsByJob_JobIdAndUserId(jobId, userId);
//	    }

	    public boolean hasUserApplied(Long jobId, Long userId) {
	        return jobappRepo.existsByJob_JobIdAndUserId(jobId, userId);
	    }


	    
	    public void cancelJobApplication(Long jobId, Long userId) {
	        jobappRepo.deleteByJob_JobIdAndUserId(jobId, userId);
	    }
	    
	    public List<Long> getJobIdsForUser(Long userId) {
	        return jobappRepo.findJobIdsByUserId(userId);
	    }
	    
	    public List<JobApplication> getAllJobApplications() {
	        return jobappRepo.findAll();
	    }
	    
//	    public JobApplication getJobApplicationByUserIdAndJobTitle(Long userId, String jobTitle) {
//	        return jobappRepo.findByUserIdAndJobJobTitle(userId, jobTitle);
//	    }
	    
	    public JobApplication getJobApplicationByJobTitleAndUserId(String jobTitle, Long userId) {
	        return jobappRepo.findByJobTitleAndUserId(jobTitle, userId);
	    }
	    
        
        public JobApplication getJobApplicationByUserIdAndJobTitle(Long userId, String jobTitle) {
            Users user = userRepository.findById(userId).orElse(null);
            if (user != null) {
                return jobappRepo.findByUserIdAndJobJobTitle(user, jobTitle);
            }
            return null;
        }
        
        public List<JobApplication> getAppliedJobsByUserId(Long userId) {
            return jobappRepo.findByUserIdUserId(userId);
        }
        
    	public boolean deleteJobApplicationById(Long applicationId) {
    		try {
    			jobappRepo.deleteById(applicationId);
    			return true;
    		} catch (Exception e) {
    			System.out.println(e);
    		}
    		return false;
    	}
    	
    	
        public void deleteByJobAndUserId(Job job, Users user) {
        	jobappRepo.deleteByJobAndUserId(job, user);
        }
        
        
//        public List<JobApplication> getAppliedJobsByUserId(Long userId) {
//            return jobappRepo.findAppliedJobsByUserId(userId);
//        }
        
//        public List<JobApplication> getAppliedJobsByUserId(Long userId) {
//            List<JobApplication> appliedJobs = jobappRepo.findAppliedJobsByUserId(userId);
//
//            if (appliedJobs != null && !appliedJobs.isEmpty()) {
//                return appliedJobs;
//            } else {
//                // Handle the case where the user has not applied for any jobs
//                return new ArrayList<>(); // Return an empty list or null, depending on your preference
//            }
//        }

	
//	  public List<Job> getJobsNotAppliedByUserId(Long userId) { return
//	  jobappRepo.findJobsNotAppliedByUserId(userId); }
	 
        
        public List<Job> getJobsNotAppliedByUserId(Long userId) {
            List<Long> appliedJobIds = jobappRepo.findJobIdsByUserId(userId);
            List<Job> allJobs = jobRepository.findAll();
            
            // Filter out applied jobs
            List<Job> jobsNotAppliedTo = allJobs.stream()
                    .filter(job -> !appliedJobIds.contains(job.getJobId()))
                    .collect(Collectors.toList());
            
            return jobsNotAppliedTo;
        }

	    
//        public List<Job> getAppliedJobsByUserId(Long userId) {
//            List<Job> appliedJobs = new ArrayList<>();
//
//            List<Long> jobIds = jobappRepo.findJobIdsByUserId(userId);
//            
//            for (Long jobId : jobIds) {
//                Job job = jobService.getJobById(jobId);
//                if (job != null) {
//                    appliedJobs.add(job);
//                }
//            }
//
//            return appliedJobs;
//        }

        
//	    public void cancelJobApplication(Long jobId, Long userId) {
//	        // Fetch the Job and Users objects from their respective repositories
//	        Job job = jobService.getJobById(jobId);
//	        Users user = userService.getUserById(userId);
//
//	        if (job != null && user != null) {
//	            jobappRepo.deleteByJob_JobIdAndUserId(job, user);
//	        } else {
//	            // Handle case where job or user is not found
//	        }
//	    }

	    
//	    public boolean hasUserApplied(Long jobId, Long userId) {
//	        Job job = new Job();
//	        job.setJobId(jobId);
//
//	        Users user = new Users();
//	        user.setId_user(userId);
//
//	        return jobappRepo.existsByJobAndUserId(job, user);
//	    }
	    
//	    public boolean hasUserApplied(Long jobId, Long userId) {
//	        Job job = jobService.getJobById(jobId);
//	        Users user = userService.getUserById(userId);
//
//	        if (job != null && user != null) {
//	            // Fetch the JobApplication by job and user
//	            JobApplication jobApplication = jobappRepo.findByJobAndUserId(job, user);
//	            return jobApplication != null;
//	        }
//
//	        return false;
//	    }
	
	




    
}
