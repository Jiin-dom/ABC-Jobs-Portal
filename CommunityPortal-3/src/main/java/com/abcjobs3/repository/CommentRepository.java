package com.abcjobs3.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.abcjobs3.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {

}
