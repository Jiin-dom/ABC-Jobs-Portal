package com.abcjobs3.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs3.entity.Educations;
import com.abcjobs3.entity.Experiences;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.service.EducationsService;
import com.abcjobs3.service.ExperiencesService;
import com.abcjobs3.service.UserDetailsService;
import com.abcjobs3.service.UsersService;

@Controller
public class DashboardController {

	@Autowired
	UserDetailsService ud;
	
	@Autowired
	EducationsService eds;
	
	@Autowired
	ExperiencesService exs;
	
	@Autowired
	UsersService usersService;
	
	@GetMapping(value="/dashboard") // profile overview
	public String dashboard(HttpSession session, Model model) throws Exception {
		try {
			this.setModel(model, session);
			return "dashboard/dashboard";  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return "login/login";
		}
	}
	
	@GetMapping(value="/profile") // update profile GET
	public String updateProfile(Model model, HttpSession session) throws Exception {
		try {
			this.setModel(model, session);
			return "dashboard/profile";  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return "login/login";
		}
	}
	
	
	@GetMapping(value="/profile-page") // update profile GET
	public String profilepage(Model model, HttpSession session) throws Exception {
		try {
			
			Long loggedInUserId = (Long) session.getAttribute("userId");
			List<Users> users = usersService.findAllUsersExceptLoggedInUser(loggedInUserId);
			// Shuffle the list of users
            List<Users> shuffledUsers = new ArrayList<>(users);
            Collections.shuffle(shuffledUsers);
            
            // Get up to 4 users (or fewer if the list is smaller)
            int numUsersToDisplay = Math.min(shuffledUsers.size(), 4);
            List<Users> usersToDisplay = shuffledUsers.subList(0, numUsersToDisplay);
            
            model.addAttribute("users", usersToDisplay);
            
            String profilemsg = (String) session.getAttribute("profilemsg");
            if (profilemsg != null) {
                model.addAttribute("profilemsg", profilemsg);
                // Clear the success message from the session after adding it to the model
                session.removeAttribute("profilemsg");
            }
            
			this.setModel(model, session);
			
			return "dashboard/profile-page";  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return "login/login";
		}
	}
	
//	@PostMapping(value="/profile") // update profile POST
//	public String up(
//			@ModelAttribute("profile") UserDetails userDetails,
//			@RequestParam("position") String position, @RequestParam("startDateEX") String startDateEX, 
//			@RequestParam("endDateEX") String endDateEX, @RequestParam("companyNameEX") String companyNameEX, 
//			@RequestParam("intitutionName") String intitutionName, @RequestParam("startDateED") String startDateED, 
//			@RequestParam("endDateED") String endDateED, @RequestParam("educationName") String educationName, 
//			
//			Experiences experiences, Educations educations,
//			Model model, HttpSession session) {
//		
//		Long userDetailsId = (Long) session.getAttribute("userId");
//		ud.updateProfile(userDetailsId, userDetails);
//		
//		if(position.equals("") || startDateEX.equals("") || endDateEX.equals("") || companyNameEX.equals("")) {
//			System.out.println("Experiences Empty");
//		} else {
//			// exs.updateExperiences(String.valueOf(userDetailsId), experiences);
//			
//			experiences.setPosition(position);
//			experiences.setStartDate(startDateEX);
//			experiences.setEndDate(endDateEX);
//			experiences.setCompany(companyNameEX);
//			experiences.setUserDetailsId(userDetailsId);
//			
//			exs.addExperiences(experiences);
//		}
//		
//		if(intitutionName.equals("") || startDateED.equals("") || endDateED.equals("") || educationName.equals("")) {
//			System.out.println("Educations Empty");
//		} else {
//			educations.setEducationName(educationName);
//			educations.setStartDate(startDateED);
//			educations.setEndDate(endDateED);
//			educations.setIntitutionName(intitutionName);
//			educations.setUserDetailsId(userDetailsId);
//			
//			eds.addEducations(educations);
//		}
//		
//		this.setModel(model, session);
//		
//		String msg = "Profile has been updated";
//		model.addAttribute("message", msg);
//		return "redirect:/dashboard";
//	}
	
	
	@PostMapping(value="/profile") // update profile POST
	public String up(
			@ModelAttribute("profile") UserDetails userDetails,
			@RequestParam("position") String position, @RequestParam("startDateEX") String startDateEX, 
			@RequestParam("endDateEX") String endDateEX, @RequestParam("companyNameEX") String companyNameEX, 
			@RequestParam("intitutionName") String intitutionName, @RequestParam("startDateED") String startDateED, 
			@RequestParam("endDateED") String endDateED, @RequestParam("educationName") String educationName, 
			
			@RequestParam("imageFile") MultipartFile multipartFile, Experiences experiences, Educations educations,
			Model model, HttpSession session) {
		
		Long userDetailsId = (Long) session.getAttribute("userId");
		if (!multipartFile.isEmpty()) {
	        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
	        userDetails.setPhotos(fileName);

	        try {
	            String uploadDir = "./src/main/resources/static/images/profile/" + userDetailsId;
	            Path uploadPath = Paths.get(uploadDir);

	            if (!Files.exists(uploadPath)) {
	                Files.createDirectories(uploadPath);
	            }

	            try (InputStream inputStream = multipartFile.getInputStream()) {
	                Path filePath = uploadPath.resolve(fileName);
	                Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
	            } catch (IOException e) {
	                throw new IOException("Could not save uploaded file: " + fileName);
	            }

	            userDetails.setPhotoImagePath("/images/profile/" + userDetailsId + "/" + fileName);
	        } catch (Exception e) {
	            e.printStackTrace();
	            // Handle exceptions
	        }
	    }
		ud.updateProfile(userDetailsId, userDetails);
		
		if(position.equals("") || startDateEX.equals("") || endDateEX.equals("") || companyNameEX.equals("")) {
			System.out.println("Experiences Empty");
		} else {
			// exs.updateExperiences(String.valueOf(userDetailsId), experiences);
			
			experiences.setPosition(position);
			experiences.setStartDate(startDateEX);
			experiences.setEndDate(endDateEX);
			experiences.setCompany(companyNameEX);
			experiences.setUserDetailsId(userDetailsId);
			
			exs.addExperiences(experiences);
		}
		
		if(intitutionName.equals("") || startDateED.equals("") || endDateED.equals("") || educationName.equals("")) {
			System.out.println("Educations Empty");
		} else {
			educations.setEducationName(educationName);
			educations.setStartDate(startDateED);
			educations.setEndDate(endDateED);
			educations.setIntitutionName(intitutionName);
			educations.setUserDetailsId(userDetailsId);
			
			eds.addEducations(educations);
		}
		
		String profilemsg = "Profile has been updated";
		session.setAttribute("profilemsg", profilemsg);
		this.setModel(model, session);

		return "redirect:/profile-page";
	}

//	 @GetMapping(value="/dashboard") // profile overview
//	    public String dashboard(HttpSession session, Model model, HttpServletRequest request) {
//	        try {
//	        	Long userId = (Long) session.getAttribute("userId");
//	        	if (userId != null) {
//	        		System.out.println("Logged in user ID: " + userId);
//	        		} else {
//	        			System.out.println("walay id PUTANGINA");
//	        		}
//	        	System.out.println("Logged in user ID: " + userId);
//	            UserDetails userDetails = ud.getDetailsById(userId);
//	            List<Experiences> experiences = exs.getExperiencesByUserDetailsId(userId);
//	            List<Educations> educations = eds.getEducationsByUserDetailsId(userId);
//	            
//	            // Assuming you have a method to get the associated User object in your UserDetails entity.
//	            Users user = userDetails.getUser();
//
//	            model.addAttribute("firstName", userDetails.getFirstName());
//	            model.addAttribute("lastName", userDetails.getLastName());
//	            model.addAttribute("email", user.getEmail());
//	            model.addAttribute("phoneNumber", userDetails.getPhone());
//	            // Add other attributes as needed...
//
//	            model.addAttribute("experiences", experiences);
//	            model.addAttribute("educations", educations);
//
//	            return "dashboard/dashboard";  
//	        } catch (Exception e) {
//	            String msg = "Login required";
//	            model.addAttribute("message", msg);
//	            return "login/login";
//	        }
//	    }

	private void setModel(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null) {
            System.out.println("Logged in user ID: " + userId);
        } else {
            System.out.println("walay id PUTANGINA");
        }
        System.out.println("Logged in user ID: " + userId);

        UserDetails userDetails = ud.getDetailsById(userId);
        List<Experiences> experiences = exs.getExperiencesByUserDetailsId(userId);
        List<Educations> educations = eds.getEducationsByUserDetailsId(userId);

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

//	private void setModel(Model model, HttpSession session) {
//	    // Get the logged-in user's authentication object
//	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//
//	    // Assuming your user details are stored in a custom UserDetails object, replace CustomUserDetails with your actual UserDetails class.
//	    if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
//	        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//
//	        // Get the user's details from the UserDetails object
//	        Users loggedInUser = userDetails.getUser();
//
//	        // Add the User object to the Model
//	        model.addAttribute("user", loggedInUser);
//	        
//	        // Add other attributes to the model
//	        model.addAttribute("f", userDetails.getFirstName().charAt(0));
//	        model.addAttribute("l", userDetails.getLastName().charAt(0));
//	        model.addAttribute("firstName", userDetails.getFirstName());
//	        model.addAttribute("lastName", userDetails.getLastName());
//	        model.addAttribute("fullName", userDetails.getFirstName() + " " + userDetails.getLastName());
//	        model.addAttribute("headline", userDetails.getHeadline());
//	        model.addAttribute("about", userDetails.getAbout());
//	        model.addAttribute("phone", userDetails.getPhone());
//	        model.addAttribute("company", userDetails.getCompany());
//	        model.addAttribute("email", loggedInUser.getEmail());
//
//	        // Add other attributes as needed...
//	        
//	        // experiences
//	        model.addAttribute("ex", exs.getExperiencesByUserDetailsId(userDetails.getUserId())); // Experiences[]
//	        
//	        // educations
//	        model.addAttribute("ed", eds.getEducationsByUserDetailsId(userDetails.getUserId())); // Educations[]
//	    } else {
//	        // Handle the case where the user is not logged in or authentication data is not available
//	        String msg = "Login required";
//	        model.addAttribute("message", msg);
//	    }
//	}
	
//	private void setModel(Model model, HttpSession session) {
//		String userId = String.valueOf(session.getAttribute("userId"));
//		String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
//		String udID = userDetails[0];
//		
//		model.addAttribute("f", userDetails[1].charAt(0));
//		model.addAttribute("l", userDetails[2].charAt(0));
//		
//		model.addAttribute("firstName", userDetails[1]);
//		model.addAttribute("lastName", userDetails[2]);
//		
//		model.addAttribute("fullName", userDetails[1] + " " + userDetails[2]);
//		model.addAttribute("headline", userDetails[3]);
//		model.addAttribute("about", userDetails[4]);
//		model.addAttribute("phone", userDetails[5]);
//		model.addAttribute("company", userDetails[6]);
//		model.addAttribute("email", session.getAttribute("email"));
//
//		model.addAttribute("city", userDetails[7]);
//		model.addAttribute("country", userDetails[8]);
//		
//		// experiences
//		model.addAttribute("ex", exs.getExperiencesByUserDetailsId(udID)); // Experiences[]
//		
//		// educations
//		model.addAttribute("ed", eds.getEducationsByUserDetailsId(udID)); // Educations[]
//		
////		// notifications
////		List<BulkEmail> be = bes.getEmail(); 
////		model.addAttribute("nf1", be.get(be.size() - 1));
////		model.addAttribute("nf2", be.get(be.size() - 2));
////		model.addAttribute("nf3", be.get(be.size() - 3));
//	}
}
