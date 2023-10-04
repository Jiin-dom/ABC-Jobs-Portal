package com.abcjobs3.entity;

import java.util.Arrays;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="job_details")
public class JobDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_details_id")
	private Long jobDetailsId;
	
	@Column(name = "job_id")
	private Long jobId;
	
	@Column(name="job_desc")
	private String jobDesc;
	
	@Column(name="job_dos")
	private String jobDos;
	
	@Column(name="job_qual")
	private String jobQual;
	
    public List<String> getJobDosAsList() {
        return Arrays.asList(jobDos.split("\n"));
    }

    public List<String> getJobQualAsList() {
        return Arrays.asList(jobQual.split("\n"));
    }
	
	@Column(name="job_skills")
	private String jobSkills;
	
	@OneToOne(optional=false)
	@JoinColumn(name = "job_id", referencedColumnName = "job_id", insertable=false, updatable=false)
	private Job job;
	
	public JobDetails() {}


	public JobDetails(Long jobDetailsId, Long jobId, String jobDesc, String jobDos, String jobQual, String jobSkills,
			Job job) {
		super();
		this.jobDetailsId = jobDetailsId;
		this.jobId = jobId;
		this.jobDesc = jobDesc;
		this.jobDos = jobDos;
		this.jobQual = jobQual;
		this.jobSkills = jobSkills;
		this.job = job;
	}

	


	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}


	public Long getJobDetailsId() {
		return jobDetailsId;
	}

	public void setJobDetailsId(Long jobDetailsId) {
		this.jobDetailsId = jobDetailsId;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	public String getJobDos() {
		return jobDos;
	}

	public void setJobDos(String jobDos) {
		this.jobDos = jobDos;
	}

	public String getJobQual() {
		return jobQual;
	}
	
	
	

	public void setJobQual(String jobQual) {
		this.jobQual = jobQual;
	}

	public String getJobSkills() {
		return jobSkills;
	}

	public void setJobSkills(String jobSkills) {
		this.jobSkills = jobSkills;
	}
	
	  
	

}
