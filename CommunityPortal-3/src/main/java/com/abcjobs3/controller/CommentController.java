package com.abcjobs3.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abcjobs3.entity.Comment;
import com.abcjobs3.entity.Post;
import com.abcjobs3.entity.Reply;
import com.abcjobs3.entity.Users;
import com.abcjobs3.repository.PostRepository;
import com.abcjobs3.repository.UsersRepository;
import com.abcjobs3.service.CommentService;
import com.abcjobs3.service.ReplyService;
import com.abcjobs3.service.UsersService;

@Controller
public class CommentController {

	   @Autowired
	   CommentService commentService;
	   
	   @Autowired
	   PostRepository postRepository;
	   
	   @Autowired
	   UsersRepository userRepository;
	   
	   @Autowired
	   ReplyService replyService;
	   
	   @Autowired
	   UsersService usersService;
	   
	   @PostMapping("/post-comment")
	    public String postComment(@RequestParam("postId") Long postId,
	                              @RequestParam("userId") Long userId,
	                              @RequestParam("content") String comment) {
	        LocalDateTime now = LocalDateTime.now();

	        Post post = postRepository.findById(postId).orElseThrow(() -> new IllegalArgumentException("Invalid post ID"));
	        Users user = userRepository.findById(userId).orElseThrow(() -> new IllegalArgumentException("Invalid user ID"));

	        Comment commentContent = new Comment();
	        commentContent.setComment(comment);
	        commentContent.setPost(post);
	        commentContent.setUser(user);
	        commentContent.setCommentedAt(now);

	        commentService.createComment(commentContent);

	        return "redirect:/homepage";
	    }
	   
	   @PostMapping("/reply")
	    public String postReply(@RequestParam("commentId") Long commentId,
	                            @RequestParam("userId") Long userId,
	                            @RequestParam("reply") String replyContent) {
	        LocalDateTime now = LocalDateTime.now();

	        Comment comment = commentService.getCommentById(commentId);
	        Users user = usersService.getUserById(userId);

	        Reply reply = new Reply();
	        reply.setComment(comment);
	        reply.setUser(user);
	        reply.setReply(replyContent);
	        reply.setRepliedAt(now);

	        replyService.postReply(reply);

	        return "redirect:/homepage";
	    }
	   
	   @PostMapping("/reply-nested")
	   public String postNestedReply(@RequestParam("commentId") Long commentId,
	                                 @RequestParam("parentReplyId") Long parentReplyId,
	                                 @RequestParam("userId") Long userId,
	                                 @RequestParam("reply") String replyContent) {
	       LocalDateTime now = LocalDateTime.now();

	       Comment comment = commentService.getCommentById(commentId);
	       Users user = usersService.getUserById(userId);

	       Reply parentReply = replyService.getReplyById(parentReplyId);

	       Reply nestedReply = new Reply();
	       nestedReply.setComment(comment);
	       nestedReply.setParentReply(parentReply);
	       nestedReply.setUser(user);
	       nestedReply.setReply(replyContent);
	       nestedReply.setRepliedAt(now);

	       replyService.postReply(nestedReply);

	       return "redirect:/homepage";
	   }


}
