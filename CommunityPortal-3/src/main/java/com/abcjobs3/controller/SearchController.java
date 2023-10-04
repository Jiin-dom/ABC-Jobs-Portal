package com.abcjobs3.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs3.entity.Educations;
import com.abcjobs3.entity.Experiences;
import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.service.EducationsService;
import com.abcjobs3.service.ExperiencesService;
import com.abcjobs3.service.JobDetailsService;
import com.abcjobs3.service.UserDetailsService;

@Controller
public class SearchController {

	@Autowired
	UserDetailsService ud;
	
	@Autowired
	EducationsService eds;
	
	@Autowired
	ExperiencesService exs;
	
	@Autowired
	JobDetailsService jds;
	
	@GetMapping(value="/search")
	public String search(HttpServletRequest req, Model model) throws Exception {
		String q = req.getParameter("q");
		
		if(q != null && !q.equals("")) {
			q = q.split(" ")[0];
			List<UserDetails> selectedUser = ud.searchByKey(q);
			model.addAttribute("selected", selectedUser);
			
			if(selectedUser.size() == 0) {
				model.addAttribute("notFound", true);
			}
		}
		
		return "search/search";  
	}
	
	@GetMapping(value="/job")
	public String searchJob(HttpServletRequest req, Model model) throws Exception {
		String jobindex = req.getParameter("jobindex");
		
		if(jobindex != null && !jobindex.equals("")) {
			jobindex = jobindex.split(" ")[0];
			List<Job> selectedJob = jds.searchByJobKey(jobindex);
			model.addAttribute("selected", selectedJob);
			
			if(selectedJob.size() == 0) {
				model.addAttribute("notFound", true);
			}
		}
		
		return "jobs/job";  
	}
	
	@PostMapping(value="/result") // view someone profile
	public ModelAndView searchProfile(@RequestParam("uId") String uId, Model model, HttpSession session) throws Exception {
		this.setModel(model, session, uId);
		return new ModelAndView("search/profile-page");  
	}
	
	private void setModel(Model model, HttpSession session, String uId) {
		Long userId = Long.parseLong(uId);
	    UserDetails userDetails = ud.getDetailsById(userId);
	    Long udID = userDetails.getUserId();
		
	    model.addAttribute("f", userDetails.getFirstName().charAt(0));
        model.addAttribute("l", userDetails.getLastName().charAt(0));
	    model.addAttribute("firstName", userDetails.getFirstName());
	    model.addAttribute("lastName", userDetails.getLastName());
	    
	    model.addAttribute("fullName", userDetails.getFirstName() + " " + userDetails.getLastName());
	    
	    if (userDetails.getHeadline() != null) {
	        model.addAttribute("headline", userDetails.getHeadline());
	    }
	    if (userDetails.getAbout() != null) {
	        model.addAttribute("about", userDetails.getAbout());
	    }
	    if (userDetails.getPhone() != null) {
	        model.addAttribute("phone", userDetails.getPhone());
	    }
	    if (userDetails.getCompany() != null) {
	        model.addAttribute("company", userDetails.getCompany());
	    }
	    if (userDetails.getCity() != null) {
	        model.addAttribute("city", userDetails.getCity());
	    }
	    if (userDetails.getCountry() != null) {
	        model.addAttribute("country", userDetails.getCountry());
	    }
	    if (userDetails.getPhotos() != null) {
	        model.addAttribute("profilePic", userDetails.getPhotos());
	    }
	    if (userDetails.getPhotoImagePath() != null) {
	        model.addAttribute("profilePicPath", userDetails.getPhotoImagePath());
	    }
	    model.addAttribute("email", session.getAttribute("email"));

	    // experiences
	    model.addAttribute("ex", exs.getExperiencesByUserDetailsId(udID)); // Experiences[]
	    
	    // educations
	    model.addAttribute("ed", eds.getEducationsByUserDetailsId(udID)); // Educations[]
	}
	
	
	
}
