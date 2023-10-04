package com.abcjobs3.entity;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="job")
public class Job {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_id")
	private Long jobId;
	
	@Column(name = "job_title")
	private String jobTitle;
	
	@Column(name = "job_company")
	private String jobCompany;
	
	@Column(name = "work_setting")
	private String workSetting;
	
	@Column(name = "job_location")
	private String jobLocation;
	
	@Column(name = "job_type")
	private String jobType;
	
    @Column(name = "posted_at")
    private LocalDateTime postedAt;
	
    @OneToOne(mappedBy = "job", cascade = CascadeType.ALL)
    private JobDetails jobDetails;
	
	public Job() {}


	public Job(Long jobId, String jobTitle, String jobCompany, String workSetting, String jobLocation, String jobType,
			LocalDateTime postedAt, JobDetails jobDetails) {
		super();
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.jobCompany = jobCompany;
		this.workSetting = workSetting;
		this.jobLocation = jobLocation;
		this.jobType = jobType;
		this.postedAt = postedAt;
		this.jobDetails = jobDetails;
	}

	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobCompany() {
		return jobCompany;
	}

	public void setJobCompany(String jobCompany) {
		this.jobCompany = jobCompany;
	}

	public String getWorkSetting() {
		return workSetting;
	}

	public void setWorkSetting(String workSetting) {
		this.workSetting = workSetting;
	}

	public String getJobLocation() {
		return jobLocation;
	}

	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public LocalDateTime getPostedAt() {
		return postedAt;
	}

	public void setPostedAt(LocalDateTime postedAt) {
		this.postedAt = postedAt;
	}

	public JobDetails getJobDetails() {
		return jobDetails;
	}

	public void setJobDetails(JobDetails jobDetails) {
		this.jobDetails = jobDetails;
	}
	
	
	
	
	
}
