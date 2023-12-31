package com.abcjobs3.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abcjobs3.entity.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
	List<Post> findAllByOrderByPostedAtDesc(); // Replace with appropriate field

}
