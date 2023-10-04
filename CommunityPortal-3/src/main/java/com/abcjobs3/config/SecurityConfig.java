package com.abcjobs3.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {



    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	System.out.println("At Authen configure");
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
 
    	System.out.println("At Security configure");
        http.csrf().disable()
                .authorizeRequests()
                    .antMatchers("/**, /css/**, /images/**, /webjars/**, /js/**, /register, /login, /dashboard", "/admin/**, /homepage, /applied-jobs/**", "/deleteApplication", "/admin/delete-job/**").permitAll()
//                    .antMatchers("/**, /css/**, /images/**, /webjars/**, /js/**, /register, /login, /dashboard", "/forgotpassword", "/forgotpassword-second", "/thankyou", "/emailconfirm").permitAll()
//                    .antMatchers("/css/**").permitAll()
//                    .antMatchers("/images/**").permitAll()
//                    .antMatchers("/webjars/**").permitAll()
//                    .antMatchers("/js/**").permitAll()
//                    .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
//                    .antMatchers(HttpMethod.GET, "/loginForm").permitAll()
//                    .antMatchers(HttpMethod.GET, "/homepage").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/homepage").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/homepage", "/post-comment", "/reply", "/reply-nested").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/post-content", "/delete-comment", "/delete-reply").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.GET, "/dashboard", "/profile").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/profile").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/admin/**").hasRole("Administrator")
//                    .antMatchers(HttpMethod.GET, "/admin/**").hasRole("Administrator")
//                    .antMatchers(HttpMethod.GET, "/jobs/**").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.GET, "/jobs", "/applied-jobs").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/applied-jobs/**", "/deleteApplication").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/apply", "/cancel").hasAnyRole("User","Administrator")
//                    .antMatchers(HttpMethod.POST, "/deleteApplication").hasRole("User")
//                .and()
//                .logout()
//                    .logoutSuccessUrl("/logout")
//                    .invalidateHttpSession(true)
        		.and()
        		.sessionManagement()
		        	.invalidSessionUrl("/login");
                  
    }
}
