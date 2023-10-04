package com.abcjobs3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abcjobs3.entity.Educations;

@Repository
public interface EducationsRepository extends JpaRepository<Educations, Long> {
	@Query(value = "SELECT * FROM educations WHERE id_profile = :udID", nativeQuery = true)
	public List<Educations> getEducationsByUserDetailsId(@Param("udID") Long udID);
}
