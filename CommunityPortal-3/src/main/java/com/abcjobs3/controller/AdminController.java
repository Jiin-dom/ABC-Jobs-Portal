package com.abcjobs3.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs3.entity.BulkEmail;
import com.abcjobs3.entity.Educations;
import com.abcjobs3.entity.Experiences;
import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobApplication;
import com.abcjobs3.entity.JobDetails;
import com.abcjobs3.entity.Profile;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.service.BulkEmailService;
import com.abcjobs3.service.EducationsService;
import com.abcjobs3.service.ExperiencesService;
import com.abcjobs3.service.JobApplicationService;
import com.abcjobs3.service.JobDetailsService;
import com.abcjobs3.service.JobService;
import com.abcjobs3.service.UserDetailsService;
import com.abcjobs3.service.UsersService;

@Controller
public class AdminController {

	@Autowired
	UsersService us;
	
	@Autowired
	UserDetailsService ud;
	
	@Autowired
	EducationsService eds;
	
	@Autowired
	ExperiencesService exs;
	
	@Autowired
	BulkEmailService bs;
	
	@Autowired
	JobApplicationService jas;
	
	@Autowired
	JobService jobService;
	
	@Autowired
	JobDetailsService jobDetailsService;
	
//	@RequestMapping(value="/admin") 
//	public String index(Model model, HttpSession session) {
//		String name = ud.getDetailsById(session.getAttribute("userId").toString()).split(",")[1];
//		model.addAttribute("adminName", name);
//		return "administrator/adminlanding";
//	}
	
    @GetMapping("/admin")
    public String index(Model model, HttpSession session) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        model.addAttribute("adminName", username);
        return "administrator/adminlanding";
    }
    
	@GetMapping(value="/admin/all-users") 
	public String allUsers(Model model, HttpSession session) {
		List<UserDetails> users = ud.getAllUserDetails();
		String cd = null;

		System.out.println("OK " + cd);
		model.addAttribute("users", users);

		return "administrator/users-list";
	}
	
	@PostMapping(value="/admin/delete/{id}") 
	public String deleteUserById(@PathVariable("id") Long id, Model model) {
		boolean isDeleted = us.deleteUserById(id);
		if(isDeleted) {
			model.addAttribute("err", "Cannot delete this user");
		}
		return "redirect:/admin/all-users";
	}
	
	@GetMapping(value = "/admin/profile/{id}")
	public ModelAndView profile(@PathVariable("id") Long id, Model model, HttpSession session, Profile profile) {
		UserDetails userDetails = ud.getDetailsById(id);
		List<Experiences> experiences = exs.getExperiencesByUserDetailsId(userDetails.getUserDetailsId());
		List<Educations> educations = eds.getEducationsByUserDetailsId(userDetails.getUserDetailsId());
		
		profile.setId(userDetails.getUserDetailsId());
		profile.setFirstName(userDetails.getFirstName());
		profile.setLastName(userDetails.getLastName());
		profile.setFullName(userDetails.getFirstName() + " " + userDetails.getLastName());
		profile.setHeadline(userDetails.getHeadline());
		profile.setAbout(userDetails.getAbout());
		profile.setPhone(userDetails.getPhone());
		profile.setCompany(userDetails.getCompany());
		profile.setEmail(userDetails.getUser().getEmail());
		profile.setCity(userDetails.getCity());
		profile.setCountry(userDetails.getCountry());
		profile.setEx(experiences);
		profile.setEd(educations);
		
		this.setModel(profile, model, session);
		return new ModelAndView("administrator/admin-profileUpdate");
	}
	
	
	@PostMapping(value="admin/profile/profile") // update profile POST
	public String up(@ModelAttribute("profile") UserDetails userDetails, Model model, HttpSession session) {
		Long userDetailsId = userDetails.getUserDetailsId();
		ud.updateProfile(userDetailsId, userDetails);
		return "redirect:../all-users";
	}
	
	
	private void setModel(Profile profile, Model model, HttpSession session) {
		model.addAttribute("id", profile.getId());
		model.addAttribute("f", profile.getFirstName().charAt(0));
		model.addAttribute("l", profile.getLastName().charAt(0));
		
		model.addAttribute("firstName", profile.getFirstName());
		model.addAttribute("lastName", profile.getLastName());
		
		model.addAttribute("fullName", profile.getFullName());
		model.addAttribute("headline", profile.getHeadline());
		model.addAttribute("about", profile.getAbout());
		model.addAttribute("phone", profile.getPhone());
		model.addAttribute("company", profile.getCompany());
		model.addAttribute("email", profile.getEmail());
		model.addAttribute("city", profile.getCity());
		model.addAttribute("country", profile.getCountry());
		
		
		// experiences
		model.addAttribute("ex", profile.getEx()); // Experiences[]
		
		// educations
		model.addAttribute("ed", profile.getEd()); // Educations[]
	}
	
	
	
	@GetMapping(value="/admin/send-bulk")
	public String sendBulk(@ModelAttribute("sendBulk") BulkEmail bulkEmail, HttpSession session) {
		return "administrator/sendbulkmail";
	}
	
	@PostMapping(value="/admin/send-bulk")
	public String sb(@ModelAttribute("sendBulk") BulkEmail bulkEmail, HttpSession session) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();
		
		bulkEmail.setSendBy("1");
		bulkEmail.setCreatedAt(dtf.format(now));
		bs.sendEmail(bulkEmail.getEmailSubject(), bulkEmail.getEmailBody(), null);
		
		bs.saveToDB(bulkEmail);
		return "redirect:/admin";
	}
	
	
	@GetMapping("/admin/jobApplications")
    public String showAllJobApplications(Model model) {
        List<JobApplication> jobApplications = jas.getAllJobApplications();
        model.addAttribute("jobApplications", jobApplications);
        return "administrator/job-applicants"; // Create a new JSP called jobApplications.jsp
    }
	
	
//	@PostMapping("/admin/approve")
//    public String approveJobApplication(@RequestParam("userId") Long userId, @RequestParam("jobTitle") String jobTitle, @RequestParam Long applicationId) {
//        JobApplication jobApplication = jas.getJobApplicationByUserIdAndJobTitle(userId, jobTitle);
//        if (jobApplication != null) {
//            jobApplication.setApproved(true);
//            // Set the approved user details here (you can get the user details from the UserDetails service)
//            jobApplication.setApprovedUserDetails(ud.getDetailsById(userId));
//            jas.saveJobApplication(jobApplication);
//        }
//        return "redirect:/admin/jobApplications";
//    }
	
//	@PostMapping("/admin/approve")
//	public String approveJobApplication(@RequestParam("userId") Long userId, @RequestParam("jobTitle") String jobTitle, @RequestParam Long applicationId) {
////	    JobApplication jobApplication = jas.getJobApplicationByJobTitleAndUserId(jobTitle, userId);
//		JobApplication jobApplication = jas.getJobApplicationByUserIdAndJobTitle(userId, jobTitle);
//
//	    if (jobApplication != null) {
//	        jobApplication.setApproved(true);
//	        // Set the approved user details here (you can get the user details from the UserDetails service)
////	        jobApplication.setApprovedUserDetails(ud.getDetailsById(userId));
//	        UserDetails userDetails = jobApplication.getUserId().getUserDetails();
//	        userDetails.setCompany(jobApplication.getJob().getJobCompany());
//	        userDetails.setHeadline(jobApplication.getJob().getJobTitle());
//	        jas.saveJobApplication(jobApplication);
//	    }
//	    return "redirect:/admin/jobApplications";
//	}
	
	
	@PostMapping("/admin/approve")
	public String approveJobApplication(@RequestParam("userId") Long userId, @RequestParam("jobTitle") String jobTitle, @RequestParam Long applicationId) {
	    JobApplication jobApplication = jas.getJobApplicationByUserIdAndJobTitle(userId, jobTitle);

	    if (jobApplication != null) {
	        jobApplication.setApproved(true);
	        UserDetails userDetails = jobApplication.getUserId().getUserDetails();
	        userDetails.setCompany(jobApplication.getJob().getJobCompany());
	        userDetails.setHeadline(jobApplication.getJob().getJobTitle());
	        jas.saveJobApplication(jobApplication);
	        
	    }
	    return "redirect:/admin/jobApplications";
	}
	
	
	
//    @GetMapping("/admin/all-jobs")
//    public String getAllJobs(Model model) {
//        List<Job> jobs = jobService.getAllJobs();
//        model.addAttribute("jobs", jobs);
//        return "administrator/all-jobs"; // Return the name of the JSP view
//    }
    
    @GetMapping("/admin/all-jobs")
    public String getAllJobs(Model model) {
        List<Job> jobs = jobService.getAllJobs();

        // Populate job details for each job
        for (Job job : jobs) {
            JobDetails jobDetails = jobDetailsService.getJobDetailsByJobId(job.getJobId());
            job.setJobDetails(jobDetails);
        }

        model.addAttribute("jobs", jobs);
        return "administrator/all-jobs"; // Return the name of the JSP view
    }


    
//	@PostMapping(value="/admin/delete-job/{jobId}") 
//	public String deleteJobById(@PathVariable("jobId") Long jobId, Model model) {
//		boolean isJobDeleted = jobService.deleteJobById(jobId);
//		if(isJobDeleted) {
//			model.addAttribute("err", "Cannot delete this job");
//		}
//		return "redirect:/admin/all-jobs";
//	}
    
    @PostMapping(value="/admin/delete-job/{jobId}") 
    public String deleteJobById(@PathVariable("jobId") Long jobId, Model model) {
        boolean isJobDeleted = jobService.deleteJobAndApplications(jobId);
        if (isJobDeleted) {
            model.addAttribute("err", "Cannot delete this job");
        }
        return "redirect:/admin/all-jobs";
    }
	
    @PostMapping(value="/admin/delete-job-application/{applicationId}") 
    public String deleteJobApplicationById(@PathVariable("applicationId") Long applicationId, Model model) {
        boolean isApplicationDeleted = jas.deleteJobApplicationById(applicationId);
        if (isApplicationDeleted) {
            model.addAttribute("err", "Cannot delete this application");
        }
        return "redirect:/admin/jobApplications";
    }


}
