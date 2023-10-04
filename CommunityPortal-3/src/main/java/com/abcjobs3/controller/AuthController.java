package com.abcjobs3.controller;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.management.Notification;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjobs3.entity.Role;
import com.abcjobs3.entity.UserDetails;
import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.RoleRepository;
import com.abcjobs3.service.UserDetailsService;
import com.abcjobs3.service.UsersService;


@Controller
public class AuthController {

	@Autowired
	private UsersService us;
	
	@Autowired
	private UserDetailsService ud;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@GetMapping(value="/register")
	public String registration(@ModelAttribute("user") Users user) throws Exception {
		return "registration/register"; 
	}
	
	
	@PostMapping(value="/register")
	public String registration(
			@RequestParam("email") String email,
			@RequestParam("password") String password,
			@RequestParam("fname") String firstName,
			@RequestParam("lname") String lastName,
			@RequestParam("phone") String phone,
			Users user, UserDetails userDetails, Model model) throws Exception {
		try {
			user.setEmail(email);
			user.setPassword(password);
			user.setEmailVerifiedAt(java.time.LocalDate.now().toString());
			user.setCreatedAt(java.time.LocalDate.now().toString());

			// Check if the role with ID 2 already exists in the database
			Role userRole = roleRepository.findById(2L).orElse(null);
			if (userRole == null) {
				// Role with ID 2 does not exist, create a new one
				userRole = new Role();
				userRole.setId(2L);
				// Set other properties for the role if needed
			}

			// Now add the role to the set of roles for the user
			Set<Role> roles = new HashSet<>();
			roles.add(userRole);
			user.setRoles(roles);

			// Save the user with updated roles
			us.register(user);

			userDetails.setUserId(user.getUserId());
			userDetails.setFirstName(firstName);
			userDetails.setLastName(lastName);
			userDetails.setPhone(phone);

			// Save the UserDetails entity
			ud.register(userDetails);

			model.addAttribute("email", user.getEmail());
			return "registration/emailconfirm";
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("errMsg", "Email has already taken");
		return "registration/register";
	}
	
	

	@GetMapping(value="/login")
	public String login(HttpSession session) throws Exception {
		return "login/login"; 
	}
	
//	@PostMapping(value="/login") // login process
//	public String login(
//			@ModelAttribute("login") Users user, Model model, 
//			HttpServletRequest req, HttpServletResponse res) {
//	
//		String rememberMe = req.getParameter("rememberMe");
//		HttpSession session = req.getSession();
//		Users isLogin = us.login(user);
//		
//		if(isLogin != null) {
//
//			session.setAttribute("email", isLogin.getEmail());
//			session.setAttribute("userId", isLogin.getUserId());
//
//			//added and changed
//	        // Assuming the user has only one role, you can get the first role from the Set
//	        Role userRole = isLogin.getRoles().stream().findFirst().orElse(null);
//	        if (userRole != null) {
//	            session.setAttribute("roleId", userRole.getId());
//	        }
//	        
//			session.setAttribute("isLogin", true);
//			return "redirect:/homepage";
//			//end
//		}
//		
//		String msg = "Credentials are incorrect !";
//		model.addAttribute("message", msg);
//		return "redirect:/login";
//	}
	
	@PostMapping(value="/login") // login process
	public String login(
			@ModelAttribute("login") Users user, Model model, 
			HttpServletRequest req, HttpServletResponse res) {
	
		try {
			String rememberMe = req.getParameter("rememberMe");
			HttpSession session = req.getSession();
			Users isLogin = us.login(user);
			
			if(isLogin != null) {

				session.setAttribute("email", isLogin.getEmail());
				session.setAttribute("userId", isLogin.getUserId());

				//added and changed
		        // Assuming the user has only one role, you can get the first role from the Set
		        Role userRole = isLogin.getRoles().stream().findFirst().orElse(null);
		        if (userRole != null) {
		            session.setAttribute("roleId", userRole.getId());
		        }
		        
				session.setAttribute("isLogin", true);
				return "redirect:/homepage";
				//end
			} else {
				String msg = "Invalid Credentials";
				model.addAttribute("message", msg);
				System.out.println(msg);
				return "login/login";
			}
			

		} catch (Exception e) {
			String msg = "Enter Credentials";
			model.addAttribute("message", msg);
			System.out.println(msg);
			return "login/login";
		}
	}
	
//	@RequestMapping(value="/login", method = RequestMethod.POST) // login process
//	public String login(@RequestParam("emailAddress") String email,
//			@RequestParam("password") String password, Model model,
//			HttpServletRequest req, HttpServletResponse res) throws Exception {
//		try {
//			String rememberMe = req.getParameter("rememberMe");
//			HttpSession session = req.getSession();
//			
//			User foundUser = UServ.getByEmail(email);
//			UserProfile userProfile = UPServ.get(foundUser.getPid());
//			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//			if(email.toLowerCase().equals(foundUser.getEmail().toLowerCase()) 
//					&& passwordEncoder.matches(password, foundUser.getPassword())) {
//				if (rememberMe != null) { // remember me checked
//		             Cookie eCookie = new Cookie("email", foundUser.getEmail());
//		             eCookie.setMaxAge(10 * 60); // 10 minutes
//		             res.addCookie(eCookie);
//
//		             Cookie iCookie = new Cookie("userId", String.valueOf(foundUser.getId()));
//		             iCookie.setMaxAge(10 * 60);
//		             res.addCookie(iCookie);
//		        }
//				
//				session.setAttribute("User", foundUser);
//				session.setAttribute("Profile", userProfile);
//				session.setAttribute("Pid", userProfile.getId());
//				session.setAttribute("Uid", foundUser.getId());
//				session.setAttribute("isLoggedIn", true);
//				
//				Long JobId = foundUser.getUserprofile().getJid();
//				
//				if (JobId != 1) {
//					session.setAttribute("hasJob", true);
//					
//				}
//				
//				Long AdminID = foundUser.getId();
//				if(AdminID == 1) {
//					session.setAttribute("isAdmin", true);
//					this.setModel(model, session);
//					session.setAttribute("adminName", userProfile.getFname());
//					return "dashboard";
//				}
//				this.setModel(model, session);
//				
//			}else{
//				String msg = "Incorrect Credentials!";
//				model.addAttribute("message", msg);
//				return "login";
//			}
//			
//			return "dashboard";
//		} catch (Exception e) {
//			String msg = "User Not Found";
//			model.addAttribute("message", msg);
//			return "login";
//			
//		}
	
//	@RequestMapping(value="/login", method = RequestMethod.POST) // login process
//	public String login(@RequestParam("emailAddress") String email,
//			@RequestParam("password") String password, Model model,
//			HttpServletRequest req, HttpServletResponse res) throws Exception {
//		try {
//			String rememberMe = req.getParameter("rememberMe");
//			HttpSession session = req.getSession();
//			
//			User foundUser = UServ.getByEmail(email);
//			UserProfile userProfile = UPServ.get(foundUser.getPid());
//			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//			if(email.toLowerCase().equals(foundUser.getEmail().toLowerCase()) 
//					&& passwordEncoder.matches(password, foundUser.getPassword())) {
//				if (rememberMe != null) { // remember me checked
//		             Cookie eCookie = new Cookie("email", foundUser.getEmail());
//		             eCookie.setMaxAge(10 * 60); // 10 minutes
//		             res.addCookie(eCookie);
//
//		             Cookie iCookie = new Cookie("userId", String.valueOf(foundUser.getId()));
//		             iCookie.setMaxAge(10 * 60);
//		             res.addCookie(iCookie);
//		        }
//				
//				session.setAttribute("User", foundUser);
//				session.setAttribute("Profile", userProfile);
//				session.setAttribute("Pid", userProfile.getId());
//				session.setAttribute("Uid", foundUser.getId());
//				session.setAttribute("isLoggedIn", true);
//				
//				Long JobId = foundUser.getUserprofile().getJid();
//				
//				if (JobId != 1) {
//					session.setAttribute("hasJob", true);
//					
//				}
//				
//				Long AdminID = foundUser.getId();
//				if(AdminID == 1) {
//					session.setAttribute("isAdmin", true);
//					this.setModel(model, session);
//					session.setAttribute("adminName", userProfile.getFname());
//					return "dashboard";
//				}
//				this.setModel(model, session);
//				
//			}else{
//				String msg = "Incorrect Credentials!";
//				model.addAttribute("message", msg);
//				return "login";
//			}
//			
//			return "dashboard";
//		} catch (Exception e) {
//			String msg = "User Not Found";
//			model.addAttribute("message", msg);
//			return "login";
//			
//		}
	
	
	
	
	
	
	@GetMapping(value="/logout")
	public String logout(HttpServletResponse res, HttpSession session) throws Exception {
		session.invalidate();

		Cookie eCookie = new Cookie("email", "");
		eCookie.setMaxAge(0); // 10 minutes
		res.addCookie(eCookie);
		
		Cookie iCookie = new Cookie("userId", "");
		iCookie.setMaxAge(0);
		res.addCookie(iCookie);
		
		return "landing"; 
	}
	
	@GetMapping(value="/forgotpassword")
	public String forgotPassword(HttpServletResponse res) throws Exception {
		return "login/forgotpassword";  
	}
	
	@PostMapping(value="/forgotpassword") // forgot password logic
	public String forgotPassword(@RequestParam("email") String email, Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		String checkEmail = us.checkEmail(email);
		
		if(checkEmail != null) {
			session.setAttribute("isReset", true);
			session.setAttribute("email", email);
			return "login/forgotpassword-second";
		}
				
		String msg = "Email not found";
		model.addAttribute("message", msg);
		return "login/forgotpassword";
	}
	
	
	@GetMapping(value="/forgotpassword-second")
	public String reset(Model model, HttpSession session) throws Exception {
		if((Boolean) session.getAttribute("isReset")) {
			return "login/forgotpassword-second";  
		}
	
		String msg = "Email required";
		model.addAttribute("message", msg);
		return "login/forgotpassword"; 
	}
	
	@PostMapping(value="/forgotpassword-second") // reset password
	public String reset(@RequestParam("password") String password, Model model, HttpSession session) throws Exception {
		try {
			us.updatePassword(password, (String) session.getAttribute("email"));
			
			String msg = "Password has been changed";
			model.addAttribute("scMessage", msg);
			session.invalidate();
		} catch (Exception e) {
			System.out.println(e);
			return "login/forgotpassword-second";
		}
		
		return "login/login";
	}
	
	
	//original
//	@PostMapping(value="/register")
//	public String registration(
//			@RequestParam("email") String email,
//			@RequestParam("password") String password,
//			@RequestParam("fname") String firstName,
//			@RequestParam("lname") String lastName,
//			@RequestParam("phone") String phone,
//			Users user, UserDetails userDetails, Model model) throws Exception {
//		try {
//			
//			//added
//			// Assuming you have a Role object representing the desired role, for example:
//			Role userRole = new Role();
//			userRole.setId(2L); // Assuming 2 is the role ID for the desired role
//
//			// Now add the role to the set of roles for the user
//			Set<Role> roles = new HashSet<>();
//			roles.add(userRole);
//			user.setRoles(roles);
//			//end added
//			
//			user.setEmail(email);
//			user.setPassword(password);
//			user.setEmailVerifiedAt(java.time.LocalDate.now().toString());
//			user.setCreatedAt(java.time.LocalDate.now().toString());
//			us.register(user);
//			
////			userDetails.setUserId(us.getLastUser().split(",")[0]);
//			
//			userDetails.setFirstName(firstName);
//			userDetails.setLastName(lastName);
//			userDetails.setPhone(phone);
//			ud.register(userDetails);
//			
//
//
//	
//			model.addAttribute("email", user.getEmail());
//			return "registration/emailconfirm";
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		model.addAttribute("errMsg", "Email has already taken");
//		return "registration/register";
//	}
	
	
	
	
}
