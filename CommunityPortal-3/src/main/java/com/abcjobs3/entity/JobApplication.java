package com.abcjobs3.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="job_application")
public class JobApplication {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "application_id")
    private Long applicationId;

	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private Users userId;



    @ManyToOne
    @JoinColumn(name = "job_id", referencedColumnName = "job_id")
    private Job job;


    @Column(name = "application_date")
    private LocalDateTime applicationDate;
    
    @Column(name = "approved")
    private Boolean approved;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "approved_profile_id", referencedColumnName = "id_profile")
    private UserDetails approvedUserDetails;
    
    
    public JobApplication() {}


	public JobApplication(Long applicationId, Users userId, Job job, LocalDateTime applicationDate, boolean approved,
			UserDetails approvedUserDetails) {
		super();
		this.applicationId = applicationId;
		this.userId = userId;
		this.job = job;
		this.applicationDate = applicationDate;
		this.approved = approved;
		this.approvedUserDetails = approvedUserDetails;
	}

	public boolean isApproved() {
	    // If 'approved' is null, consider it as false
	    return approved != null && approved;
	}


	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public UserDetails getApprovedUserDetails() {
		return approvedUserDetails;
	}

	public void setApprovedUserDetails(UserDetails approvedUserDetails) {
		this.approvedUserDetails = approvedUserDetails;
	}


	public Long getApplicationId() {
		return applicationId;
	}


	public void setApplicationId(Long applicationId) {
		this.applicationId = applicationId;
	}


	public Users getUserId() {
		return userId;
	}


	public void setUserId(Users userId) {
		this.userId = userId;
	}


	public Job getJob() {
		return job;
	}


	public void setJob(Job job) {
		this.job = job;
	}


	public LocalDateTime getApplicationDate() {
		return applicationDate;
	}


	public void setApplicationDate(LocalDateTime applicationDate) {
		this.applicationDate = applicationDate;
	}
    
    
    
    

    
    
}
