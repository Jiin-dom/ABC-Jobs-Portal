package com.abcjobs3.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abcjobs3.entity.Comment;
import com.abcjobs3.entity.Educations;
import com.abcjobs3.entity.Experiences;
import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.JobApplication;
import com.abcjobs3.entity.JobDetails;
import com.abcjobs3.entity.Post;
import com.abcjobs3.entity.Reply;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.UserDetailsRepository;
import com.abcjobs3.repository.UsersRepository;
import com.abcjobs3.service.CommentService;
import com.abcjobs3.service.EducationsService;
import com.abcjobs3.service.ExperiencesService;
import com.abcjobs3.service.JobApplicationService;
import com.abcjobs3.service.JobService;
import com.abcjobs3.service.PostService;
import com.abcjobs3.service.ReplyService;
import com.abcjobs3.service.UserDetailsService;
import com.abcjobs3.service.UsersService;

@Controller
public class HomeController {
	
	@Autowired
	PostService postService;
	
	@Autowired
	UsersRepository userRepository;
	
	@Autowired
	UsersService usersService;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Autowired
	UserDetailsRepository repo;
	
	@Autowired
	JobApplicationService jobApplicationService;
	
	@Autowired
	JobService js;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	ReplyService replyService;
	
	@Autowired
	EducationsService educationsService;
	
	@Autowired
	ExperiencesService experiencesService;

//    @GetMapping("/")
//    public String handleRootRequest(Model model) {
//        return "landing";
//    }

	@GetMapping("/")
	public String home(HttpServletRequest req, @CookieValue(value = "email", defaultValue = "") String email,
			@CookieValue(value = "userId", defaultValue = "") String userId, HttpSession session) {
		if (!email.equals("")) {
			// add session
			session.setAttribute("email", email);
			session.setAttribute("userId", userId);
			session.setAttribute("isLogin", true);
		}
		return "landing"; // Return the logical view name (view name without .html extension)
	}
	
    public String getTimeSincePosted(LocalDateTime postedAt) {
        LocalDateTime currentDateTime = LocalDateTime.now();
        Duration duration = Duration.between(postedAt, currentDateTime);

        long days = duration.toDays();
        long hours = duration.toHours() % 24;
        long minutes = duration.toMinutes() % 60;

        String timeSincePosted;
        
        if (days > 0) {
            timeSincePosted = String.format("%d days, %d hours ago", days, hours);
            
        } else if (hours > 0) {
            timeSincePosted = String.format("%d hours ago", hours);
            
        } else {
            timeSincePosted = String.format("%d minutes ago", minutes);
            
        }

        return (timeSincePosted) ;
    }
    
//    public String[] getTimeSincePosted(LocalDateTime postedAt) {
//        LocalDateTime currentDateTime = LocalDateTime.now();
//        Duration duration = Duration.between(postedAt, currentDateTime);
//
//        long days = duration.toDays();
//        long hours = duration.toHours() % 24;
//        long minutes = duration.toMinutes() % 60;
//
//        String timeSincePosted;
//        String timeSincePostedWOPosted;
//        if (days > 0) {
//            timeSincePosted = String.format("Posted %d days, %d hours ago", days, hours);
//            timeSincePostedWOPosted = String.format("%dd, %dh", days, hours);
//        } else if (hours > 0) {
//            timeSincePosted = String.format("Posted %d hours ago", hours);
//            timeSincePostedWOPosted = String.format("%dh", hours);
//        } else {
//            timeSincePosted = String.format("Posted %d minutes ago", minutes);
//            timeSincePostedWOPosted = String.format("%dm", minutes);
//        }
//
//        return new String[]{timeSincePosted, timeSincePostedWOPosted};
//    }

	
//	@GetMapping("/homepage")
//	public String homepage(Model model, HttpSession session, Principal principal) {
//			List<Post> posts = postService.getAllPost();
//			Map<Long, String> timeSincePostedMap = new HashMap<>(); // New map to store time since posted
//
//		  //display users
//		  	Long loggedInUserId = (Long) session.getAttribute("userId");
//		    List<Users> users = usersService.findAllUsersExceptLoggedInUser(loggedInUserId);
//		    
//		    List<JobApplication> appliedJobs = jobApplicationService.getAppliedJobsByUserId(loggedInUserId);
//		    
//		    
//		    // Shuffle the list of users
//		    List<Users> shuffledUsers = new ArrayList<>(users);
//		    Collections.shuffle(shuffledUsers);
//		    
//		 // Get up to 4 users (or fewer if the list is smaller)
//		    int numUsersToDisplay = Math.min(shuffledUsers.size(), 4);
//		    List<Users> usersToDisplay = shuffledUsers.subList(0, numUsersToDisplay);
//		    
//		    //looping every posted time tgo calculate it and compare it
//	        for (Post post : posts) {
//	            String timeSincePosted = getTimeSincePosted(post.getPostedAt()); // Call the method here with postedAt value
//	            timeSincePostedMap.put(post.getPostId(), timeSincePosted);
//	            
//	            //calculate the posted time of comments in a po0st
//	            for (Comment comment : post.getComments()) {
//	                String timeSinceCommented = getTimeSincePosted(comment.getCommentedAt());
//	                timeSincePostedMap.put(comment.getCommentId(), timeSinceCommented);
//	            }
//	        }
//	        
//	        //setting user's details in the page
//	        userDetailsService.setModelAttributes(model, session);
//	        
//		  model.addAttribute("posts", posts);
//		  model.addAttribute("timeSincePostedMap", timeSincePostedMap);
//		  
//		  model.addAttribute("users", usersToDisplay);
//		return "dashboard/homepage"; // Return the logical view name for the thank you page
//	}
    
//    @GetMapping("/homepage")
//    public String homepage(Model model, HttpSession session, Principal principal) {
//
//            Long loggedInUserId = (Long) session.getAttribute("userId");
//            Users user = userRepository.findById(loggedInUserId).orElse(null);
//            
//
//            List<Post> posts = postService.getAllPost();
//            Map<Long, String> timeSincePostedMap = new HashMap<>();
//            
//            List<Users> users = usersService.findAllUsersExceptLoggedInUser(loggedInUserId);
//            
//            List<Job> jobs = js.getJobsNotAppliedByUser(user);
//            model.addAttribute("jobs", jobs);
//            
//            // Shuffle the list of users
//            List<Users> shuffledUsers = new ArrayList<>(users);
//            Collections.shuffle(shuffledUsers);
//            
//            // Get up to 4 users (or fewer if the list is smaller)
//            int numUsersToDisplay = Math.min(shuffledUsers.size(), 4);
//            List<Users> usersToDisplay = shuffledUsers.subList(0, numUsersToDisplay);
//            
//            // Loop through posts to calculate time since posted
//            for (Post post : posts) {
//                String timeSincePosted = getTimeSincePosted(post.getPostedAt());
//                timeSincePostedMap.put(post.getPostId(), timeSincePosted);
//                
//                // Calculate the posted time of comments in a post
//                for (Comment comment : post.getComments()) {
//                    String timeSinceCommented = getTimeSincePosted(comment.getCommentedAt());
//                    timeSincePostedMap.put(comment.getCommentId(), timeSinceCommented);
//                }
//            }
//            
//            // Setting user's details in the page
//            userDetailsService.setModelAttributes(model, session);
////            this.setModelAttributes(model, session);
//            
//            model.addAttribute("posts", posts);
//            model.addAttribute("timeSincePostedMap", timeSincePostedMap);
//            model.addAttribute("users", usersToDisplay);
//            model.addAttribute("loggedInUserId", loggedInUserId);
//            
//            return "dashboard/homepage";
//
//    }

	


	
    @GetMapping("/homepage")
    public String homepage(Model model, HttpSession session, Principal principal) {

            Long loggedInUserId = (Long) session.getAttribute("userId");
            Users user = userRepository.findById(loggedInUserId).orElse(null);
            
            if (loggedInUserId != null) {
            	
            	List<Post> posts = postService.getAllPost();
                Map<Long, String> timeSincePostedMap = new HashMap<>();
                
                List<Users> users = usersService.findAllUsersExceptLoggedInUser(loggedInUserId);
                
                List<Job> jobs = js.getJobsNotAppliedByUser(user);
                model.addAttribute("jobs", jobs);
                
                // Shuffle the list of users
                List<Users> shuffledUsers = new ArrayList<>(users);
                Collections.shuffle(shuffledUsers);
                
                // Get up to 4 users (or fewer if the list is smaller)
                int numUsersToDisplay = Math.min(shuffledUsers.size(), 4);
                List<Users> usersToDisplay = shuffledUsers.subList(0, numUsersToDisplay);
                
                // Loop through posts to calculate time since posted
                for (Post post : posts) {
                    String timeSincePosted = getTimeSincePosted(post.getPostedAt());
                    timeSincePostedMap.put(post.getPostId(), timeSincePosted);
                    
                    // Calculate the posted time of comments in a post
                    for (Comment comment : post.getComments()) {
                        String timeSinceCommented = getTimeSincePosted(comment.getCommentedAt());
                        timeSincePostedMap.put(comment.getCommentId(), timeSinceCommented);
                    }
                }
                
                // Setting user's details in the page
                userDetailsService.setModelAttributes(model, session);
//                this.setModelAttributes(model, session);
                
                model.addAttribute("posts", posts);
                model.addAttribute("timeSincePostedMap", timeSincePostedMap);
                model.addAttribute("users", usersToDisplay);
                model.addAttribute("loggedInUserId", loggedInUserId);
                
                return "dashboard/homepage";
            	
            } else {
        		String msg = "Login required !";
        		model.addAttribute("scMessage", msg);
            	session.invalidate();
            	return "login/login";
            	
            }

            

    }


	@PostMapping("/post-content")
    public String postContent(
            @RequestParam("userId") Long userId,
            @ModelAttribute("post") Post post,
            Users user,
            Model model,
            RedirectAttributes ra,
            @RequestParam("imageFile") MultipartFile multipartFile
    ) throws Exception {
        LocalDateTime now = LocalDateTime.now();

        Users userEntity = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid user ID"));

        post.setPostedAt(now);
        post.setUser(userEntity);

        // Process the uploaded file
        if (!multipartFile.isEmpty()) {
            String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
            post.setPhotos(fileName);

            // Save the file to a directory (similar to your existing logic)
            String uploadDir = "./src/main/resources/static/images/car-photo/" + post.getPostId();
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

            post.setPhotoImagePath("/images/car-photo/" + post.getPostId() + "/" + post.getPhotos());
        }

        // Save the post
        postService.createPost(post);

        return "/homepage";
    }

	@PostMapping("/delete-comment")
	public String deleteComment(@RequestParam Long commentId) {
	    commentService.deleteCommentAndReplies(commentId);
	    return "redirect:/homepage"; // Redirect back to the homepage
	}
	
    @PostMapping("/delete-reply")
    public String deleteReply(@RequestParam Long replyId) {
        Reply replyToDelete = replyService.getReplyById(replyId);
        if (replyToDelete != null) {
            replyService.deleteReplyAndNestedReplies(replyToDelete);
        }
        return "redirect:/homepage";
    }


//    public void setModelAttributes(Model model, HttpSession session) {
//        Long userId = (Long) session.getAttribute("userId");
//
//        if (userId != null) {
//        	 System.out.println("Logged in user ID: " + userId);
//        	Optional<UserDetails> userDetailsOptional = repo.findById(userId);
//            if (userDetailsOptional.isPresent()) {
//            	UserDetails userDetails = userDetailsOptional.get();
//            	List<Experiences> experiences = experiencesService.getExperiencesByUserDetailsId(userId);
//                List<Educations> educations = educationsService.getEducationsByUserDetailsId(userId);
//
//                // Assuming you have a method to get the associated User object in your UserDetails entity.
//                Users user = userDetails.getUser();
//
//                model.addAttribute("f", userDetails.getFirstName().charAt(0));
//                model.addAttribute("l", userDetails.getLastName().charAt(0));
//                model.addAttribute("fullname", userDetails.getFirstName() + " " + userDetails.getLastName());
//                model.addAttribute("firstName", userDetails.getFirstName());
//                model.addAttribute("lastName", userDetails.getLastName());
//                model.addAttribute("email", user.getEmail());
//                model.addAttribute("phoneNumber", userDetails.getPhone());
//                model.addAttribute("headline", userDetails.getHeadline());
//                model.addAttribute("about", userDetails.getAbout());
//                model.addAttribute("phone", userDetails.getPhone());
//                model.addAttribute("company", userDetails.getCompany());
//                model.addAttribute("country", userDetails.getCountry());
//                model.addAttribute("city", userDetails.getCity());
//                model.addAttribute("experiences", experiences);
//                model.addAttribute("educations", educations);
//                model.addAttribute("profilePic", userDetails.getPhotos());
//                model.addAttribute("profilePicPath", userDetails.getPhotoImagePath());
//            } else {
//            	 System.out.println("There is no ID");
//            }
//        }
//
//    }
    
//    public void setModelAttributes(Model model, HttpSession session) {
//        Long userId = (Long) session.getAttribute("userId");
//        if (userId != null) {
//            System.out.println("Logged in user ID: " + userId);
//        } else {
//            System.out.println("walay id PUTANGINA");
//        }
//        if (userId != null) {
//            UserDetails userDetails = repo.findById(userId).get();
//            List<Experiences> experiences = experiencesService.getExperiencesByUserDetailsId(userId);
//            List<Educations> educations = educationsService.getEducationsByUserDetailsId(userId);
//
//            // Assuming you have a method to get the associated User object in your UserDetails entity.
//            Users user = userDetails.getUser();
//
//            model.addAttribute("f", userDetails.getFirstName().charAt(0));
//            model.addAttribute("l", userDetails.getLastName().charAt(0));
//            model.addAttribute("fullname", userDetails.getFirstName() + " " + userDetails.getLastName());
//            model.addAttribute("firstName", userDetails.getFirstName());
//            model.addAttribute("lastName", userDetails.getLastName());
//            model.addAttribute("email", user.getEmail());
//            model.addAttribute("phoneNumber", userDetails.getPhone());
//            model.addAttribute("headline", userDetails.getHeadline());
//            model.addAttribute("about", userDetails.getAbout());
//            model.addAttribute("phone", userDetails.getPhone());
//            model.addAttribute("company", userDetails.getCompany());
//            model.addAttribute("country", userDetails.getCountry());
//            model.addAttribute("city", userDetails.getCity());
//            model.addAttribute("experiences", experiences);
//            model.addAttribute("educations", educations);
//            model.addAttribute("profilePic", userDetails.getPhotos());
//            model.addAttribute("profilePicPath", userDetails.getPhotoImagePath());
//        }
//    }
			
	
	

	@GetMapping("/thankyou")
	public String thankyou() {
		return "registration/thankyou"; // Return the logical view name for the thank you page
	}

	@GetMapping("/emailconfirm")
	public String verified() {
		return "registration/emailconfirm"; // Return the logical view name for the email confirmation page

	}
	
	
	
}
