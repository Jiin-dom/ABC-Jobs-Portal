package com.abcjobs3.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.abcjobs3.repository.EducationsRepository;
import com.abcjobs3.entity.Educations;

@Service
@Transactional
public class EducationsService {
	@Autowired
	EducationsRepository repo;
	
	public Educations addEducations(Educations ed) {
		return repo.save(ed);
	}

	public List<Educations> getEducationsByUserDetailsId(Long udID) {
		return repo.getEducationsByUserDetailsId(udID);
	}
}
