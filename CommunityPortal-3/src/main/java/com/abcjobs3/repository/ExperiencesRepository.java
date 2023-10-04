package com.abcjobs3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.Experiences;

@Repository
public interface ExperiencesRepository extends JpaRepository<Experiences, Long> {
	@Query(value = "SELECT * FROM experiences WHERE id_profile = :id", nativeQuery = true)
	public List<Experiences> getExperiencesByUserDetailsId(@Param("id") Long udID);
	
}
