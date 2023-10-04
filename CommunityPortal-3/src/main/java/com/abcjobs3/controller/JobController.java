package com.abcjobs3.controller;

import java.security.Principal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs3.entity.Educations;
import com.abcjobs3.entity.Experiences;
import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobApplication;
import com.abcjobs3.entity.JobDetails;
import com.abcjobs3.entity.Profile;
import com.abcjobs3.entity.Role;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.JobApplicationRepository;
import com.abcjobs3.repository.JobRepository;
import com.abcjobs3.repository.UsersRepository;
import com.abcjobs3.service.JobApplicationService;
import com.abcjobs3.service.JobDetailsService;
import com.abcjobs3.service.JobService;
import com.abcjobs3.service.UsersService;

@Controller
public class JobController {
	
	@Autowired
	JobService js;
	
	@Autowired
	JobDetailsService jds;
	
	@Autowired
	JobApplicationService jas;
	
	@Autowired
	UsersService us;
	
	@Autowired
	UsersRepository userRepository;
	
	@Autowired
	JobApplicationRepository jar;
	
	@Autowired
	JobRepository jobRepository;

	
	@GetMapping(value="/admin/post-job")
	public String registration(@ModelAttribute("Job") Job job) throws Exception {
		return "administrator/post-job"; 
	}
	
	@PostMapping(value="/admin/post-job")
	public String postjob(Job job, JobDetails jobDetails, Model model) throws Exception {
		
	    LocalDateTime now = LocalDateTime.now();
	   
		
		try {
			 job.setPostedAt(now);
			
			//save job
			js.postJob(job);

			return "redirect:/admin/post-job2?jobId=" + job.getJobId();
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("errMsg", "Failed. Job was not posted successfully");
		return "redirect:/admin/post-job2?jobId=" + job.getJobId();
	}
	
	@GetMapping(value = "/admin/post-job2")
    public String postJob2(@RequestParam(value = "jobId") Long jobId, @ModelAttribute("jobDetails") JobDetails jobDetails) {
        jobDetails.setJobId(jobId);
        return "administrator/post-job2";
    }

    @PostMapping(value = "/admin/post-job2")
    public String savePostJob2(@ModelAttribute("jobDetails") JobDetails jobDetails, Model model) {
        // Save the JobDetails entity
        jds.saveJobDetails(jobDetails);
        String msg = "Job posted successfully!";
        model.addAttribute("message", msg);
        return "redirect:/jobs";
    }
    
    
    public String getTimeSincePosted(LocalDateTime postedAt) {
        LocalDateTime currentDateTime = LocalDateTime.now();
        Duration duration = Duration.between(postedAt, currentDateTime);

        long days = duration.toDays();
        long hours = duration.toHours() % 24;
        long minutes = duration.toMinutes() % 60;

        String timeSincePosted;
        if (days > 0) {
            timeSincePosted = String.format("Posted %d days, %d hours ago", days, hours);
        } else if (hours > 0) {
            timeSincePosted = String.format("Posted %d hours ago", hours);
        } else {
            timeSincePosted = String.format("Posted %d minutes ago", minutes);
        }

        return timeSincePosted;
    }



    
//    @GetMapping("/jobs")
//    public String showAllJobs(Model model) {
//        List<Job> jobs = js.getAllJobs();
//        Map<Long, JobDetails> jobDetailsMap = new HashMap<>();
//        Map<Long, String> timeSincePostedMap = new HashMap<>(); // New map to store time since posted
//
//        for (Job job : jobs) {
//            JobDetails jobDetails = jds.getJobDetailsByJobId(job.getJobId());
//            jobDetailsMap.put(job.getJobId(), jobDetails);
//            String timeSincePosted = getTimeSincePosted(job.getPostedAt()); // Call the method here with postedAt value
//            timeSincePostedMap.put(job.getJobId(), timeSincePosted);
//        }
//
//        model.addAttribute("jobs", jobs);
//        model.addAttribute("jobDetailsMap", jobDetailsMap);
//        model.addAttribute("timeSincePostedMap", timeSincePostedMap); // Add the map to the model
//
//        return "jobs/job";
//    }
    
//    @GetMapping("/jobs")
//    public String showJobsNotApplied(Model model, HttpSession session) {
//    	 Long userId = (Long) session.getAttribute("userId");
//         List<Job> jobs = js.getJobsNotAppliedByUser(userId);
//         model.addAttribute("jobs", jobs);
//         return "jobs/job"; // Create a JSP page for this view
//     
//    }
    
    @GetMapping("/jobs")
    public String showJobsNotApplied(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        Users user = userRepository.findById(userId).orElse(null);
        if (userId != null) {

            List<Job> jobs = js.getJobsNotAppliedByUser(user);
            model.addAttribute("jobs", jobs);
            
            // Fetch the list of applied jobs for the user
            List<JobApplication> appliedJobs = jas.getAppliedJobsByUserId(userId);
            
            String applicationSuccessMessage = (String) session.getAttribute("applicationSuccessMessage");
            if (applicationSuccessMessage != null) {
                model.addAttribute("applicationSuccessMessage", applicationSuccessMessage);
                // Clear the success message from the session after adding it to the model
                session.removeAttribute("applicationSuccessMessage");
            }
            
            String applicationCancelMessage = (String) session.getAttribute("applicationCancelMessage");
            if (applicationCancelMessage != null) {
                model.addAttribute("applicationCancelMessage", applicationCancelMessage);
                // Clear the success message from the session after adding it to the model
                session.removeAttribute("applicationCancelMessage");
            }
            
            // Add the applied jobs to the model
            model.addAttribute("appliedJobs", appliedJobs);
            return "jobs/job"; // Create a JSP page for this view
        } else {
            // Handle the case where userId is not available in the session
            return "redirect:/login"; // Redirect to login or handle appropriately
        }
    }


    
    @GetMapping("/jobs/job-details/{jobId}")
    public String viewJobDetails(@PathVariable Long jobId, Model model, Principal principal, HttpSession session) {
        Job job = js.getJobById(jobId);
        JobDetails jobDetails = jds.getJobDetailsByJobId(jobId);
        
        // Get the user ID from the session using your existing method
        Long userId = getUserIdFromPrincipal(principal, session);

        // Check if the user has already applied for the job
        boolean applied = jas.hasUserApplied(jobId, userId);
        System.out.println("applied: " + applied); // Add this line to check the value of "applied"

        model.addAttribute("job", job);
        model.addAttribute("jobDetails", jobDetails);
        model.addAttribute("applied", applied); // Add the applied flag to the model

        return "jobs/job-details";
    }
    


        


    @PostMapping("/apply")
    public String saveJobApplication(@RequestParam("userId") Long userId, @RequestParam("jobId") Long jobId, Model model, HttpSession session) {
        Job job = js.getJobById(jobId);
        Users user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("Invalid user ID"));

        // Create a new JobApplication and set the user and jobs
        JobApplication jobApplication = new JobApplication();
        jobApplication.setUserId(user);
        jobApplication.setJob(job);
        jobApplication.setApplicationDate(LocalDateTime.now());

        session.setAttribute("userId", userId);

        // Create a new JobApplication and set the job
        JobApplication jobApplications = new JobApplication();
        jobApplications.setJob(job);

        // Save the job application
        jas.saveJobApplication(jobApplications, userId);

        String message = "Job application submitted successfully!";
        session.setAttribute("applicationSuccessMessage", message);
       
        return "redirect:/jobs";
    }
    

    
    @PostMapping("/cancel")
    public String cancelJobApplication(@RequestParam("userId") Long userId, @RequestParam("jobId") Long jobId, Model model, HttpSession session) {
        // Delete the job application for the given job ID and user ID
        jas.cancelJobApplication(jobId, userId);

        String message = "Job application has been cancelled!";
        session.setAttribute("applicationCancelMessage", message);
        return "redirect:/jobs";
    }
    
    
    @GetMapping("/applied-jobs")
    public String showAppliedJobs(Model model, HttpSession session) {
        // Retrieve the userId from the session
        Long userId = (Long) session.getAttribute("userId");
        
        // Fetch the list of applied jobs for the user
        List<JobApplication> appliedJobs = jas.getAppliedJobsByUserId(userId);
        
        // Add the applied jobs to the model
        model.addAttribute("appliedJobs", appliedJobs);
        
        return "jobs/applied-jobs"; // Return the name of the JSP page
    }

    
	@PostMapping(value="/applied-jobs/{applicationId}") 
	public String deleteUserById(@PathVariable("applicationId") Long applicationId, Model model) {
		boolean isApplicationDeleted = jas.deleteJobApplicationById(applicationId);
		if(isApplicationDeleted) {
			model.addAttribute("err", "Cannot delete this job");
		}
		return "redirect:/applied-jobs";
	}
	
//	@GetMapping("/delete-application")
//	public String deleteApplication(@RequestParam("jobId") Long jobId, HttpSession session) {
//	    Long userId = (Long) session.getAttribute("userId");
//	    
//	    jas.deleteByJobIdAndUserId(jobId, userId);
//	    
//	    return "redirect:/applied-jobs";
//	}
	
	@PostMapping("/deleteApplication")
	public String deleteApplication(@RequestParam("jobId") Long jobId, HttpSession session) {
	    Long userId = (Long) session.getAttribute("userId");
	    Users user = userRepository.findById(userId).orElse(null);
	    
	    Job job = jobRepository.findById(jobId).orElse(null);
	    
	    if (user != null && job != null) {
	        jas.deleteByJobAndUserId(job, user);
	        String message = "Job application has been cancelled!";
	        session.setAttribute("applicationCancelMessage", message);
	    }
	    
	    
	    return "redirect:/jobs";
	}



    
    
    private Long getUserIdFromPrincipal(Principal principal, HttpSession session) {
        if (principal != null && session.getAttribute("userId") != null) {
            return (Long) session.getAttribute("userId");
            
        }
        return null;
    }


	
}
