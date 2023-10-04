package com.abcjobs3.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Job;
import com.abcjobs3.entity.Post;
import com.abcjobs3.repository.PostRepository;

@Service
@Transactional
public class PostService {
	
	@Autowired
	PostRepository postRepository;

    public Post createPost(Post post) {
        return postRepository.save(post);
    }

    public Post getPostById(Long id) {
        return postRepository.findById(id).orElse(null);
    }
    
    public List<Post> getAllPost() {
        return postRepository.findAllByOrderByPostedAtDesc();
    }
}
