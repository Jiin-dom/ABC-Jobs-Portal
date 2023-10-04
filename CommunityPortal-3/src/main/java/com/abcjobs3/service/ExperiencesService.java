package com.abcjobs3.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Experiences;
import com.abcjobs3.repository.ExperiencesRepository;

@Service
@Transactional
public class ExperiencesService {
	@Autowired
	ExperiencesRepository repo;
	
	public List<Experiences> getExperiencesByUserDetailsId(Long id) {
		return repo.getExperiencesByUserDetailsId(id);
	}
	
	public Experiences addExperiences(Experiences ex) {
		return repo.save(ex);
	}
	
	public Experiences updateExperiences(String udID, Experiences ex) {
//		Long exId=;
//		Experiences experiences = repo.findById(exId).get();
//		
//		// update
//		experiences.setUserDetailsId(udID);
//		experiences.setCompany(ex.getCompany());
//		experiences.setPosition(ex.getPosition());
//		experiences.setStartDate(ex.getStartDate());
//		experiences.setEndDate(ex.getEndDate());
//		
//		// save
//		return repo.save(experiences);
		return null;
	}
	
	
//	public Experiences updateExp(Long userDetailsId, Experiences ud) {
//		Experiences experiences = repo.findById(userDetailsId).get();
//		experiences.setCompany(ud.getCompany());
//		experiences.setPosition(ud.getPosition());
//		experiences.setStartDate(ud.getStartDate());
//		experiences.setEndDate(ud.getEndDate());
//		
//		return repo.save(experiences);
//	}
	
}
