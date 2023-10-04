package com.abcjobs3.service;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.abcjobs3.entity.Educations;
import com.abcjobs3.entity.Experiences;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.UserDetailsRepository;

@Service
@Transactional
public class UserDetailsService {
	@Autowired
	UserDetailsRepository repo;
	
	@Autowired
	EducationsService educationsService;
	
	@Autowired
	ExperiencesService experiencesService;
	
	
	
	public UserDetails register(UserDetails userDetails) {
		return repo.save(userDetails);
	}
	
	//Original
//	public String getDetailsById(String userId) {
//		return repo.getDetailsById(userId);
//	}
	
	public String getDetailsIdAsString(String userId) {
		return repo.getDetailsById(userId);
	}
	
	public UserDetails updateProfile(Long userDetailsId, UserDetails ud) {
		UserDetails userDetails = repo.findById(userDetailsId).get();
		
		// update
		userDetails.setFirstName(ud.getFirstName());
		userDetails.setLastName(ud.getLastName());
		userDetails.setHeadline(ud.getHeadline());
		userDetails.setAbout(ud.getAbout());
		userDetails.setPhone(ud.getPhone());
		userDetails.setCompany(ud.getCompany());
		userDetails.setCity(ud.getCity());
		userDetails.setCountry(ud.getCountry());
		userDetails.setPhotos(ud.getPhotos());
		userDetails.setPhotoImagePath(ud.getPhotoImagePath());
		
		// save
 		return repo.save(userDetails);
	}
	
	public UserDetails updateAbout(Long userDetailsId, UserDetails ud) {
		UserDetails userDetails = repo.findById(userDetailsId).get();
		
		userDetails.setAbout(ud.getAbout());
		
		return repo.save(userDetails);
	}
//	
//	public Experiences updateExperience(Long userDetailsId, Experiences ud) {
//		UserDetails expDetails = repo.findById(userDetailsId).get();
//		
////		expDetails.setUserDetailsId(udID);
//		expDetails.setCompany(ud.getCompany());
//		expDetails.setPosition(ud.getPosition());
//		expDetails.setStartDate(ud.getStartDate());
//		expDetails.setEndDate(ud.getEndDate());
//		
//		return repo.save(userDetails);
//	}
//	
//	
//	public UserDetails updateEducation(Long userDetailsId, UserDetails ud) {
//		UserDetails userDetails = repo.findById(userDetailsId).get();
//		
//		userDetails.setAbout(ud.getAbout());
//		
//		return repo.save(userDetails);
//	}
	
	
	public List<UserDetails> searchByKey(String key) {
		return repo.searchByKey(key);
	}
	
	public List<UserDetails> getAllUserDetails() {
		return repo.findAll();
	}
	
	public UserDetails getDetailsById(Long id) {
		return repo.findById(id).get();
	}
	
	public void setModelAttributes(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null) {
            UserDetails userDetails = repo.findById(userId).get();
            List<Experiences> experiences = experiencesService.getExperiencesByUserDetailsId(userId);
            List<Educations> educations = educationsService.getEducationsByUserDetailsId(userId);

            // Assuming you have a method to get the associated User object in your UserDetails entity.
            Users user = userDetails.getUser();

            model.addAttribute("f", userDetails.getFirstName().charAt(0));
            model.addAttribute("l", userDetails.getLastName().charAt(0));
            model.addAttribute("fullname", userDetails.getFirstName() + " " + userDetails.getLastName());
            model.addAttribute("firstName", userDetails.getFirstName());
            model.addAttribute("lastName", userDetails.getLastName());
            model.addAttribute("email", user.getEmail());
            model.addAttribute("phoneNumber", userDetails.getPhone());
            model.addAttribute("headline", userDetails.getHeadline());
            model.addAttribute("about", userDetails.getAbout());
            model.addAttribute("phone", userDetails.getPhone());
            model.addAttribute("company", userDetails.getCompany());
            model.addAttribute("country", userDetails.getCountry());
            model.addAttribute("city", userDetails.getCity());
            model.addAttribute("experiences", experiences);
            model.addAttribute("educations", educations);
            model.addAttribute("profilePic", userDetails.getPhotos());
            model.addAttribute("profilePicPath", userDetails.getPhotoImagePath());
        }
    }

}
