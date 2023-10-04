package com.abcjobs3.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Comment;
import com.abcjobs3.entity.Reply;
import com.abcjobs3.repository.CommentRepository;
import com.abcjobs3.repository.ReplyRepository;

@Service
@Transactional
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;
    
    @Autowired
    ReplyRepository replyRepository;

    public Comment createComment(Comment comment) {
        return commentRepository.save(comment);
    }
    
    public Comment getCommentById(Long commentId) {
        return commentRepository.findById(commentId).orElse(null);
    }
    
//    public Comment getAllComments(Comment comment) {
//        return commentRepository.save(comment);
//    }
    public void deleteCommentAndReplies(Long commentId) {
        Comment comment = commentRepository.findById(commentId).orElse(null);
        if (comment != null) {
            // Delete nested replies recursively
            deleteNestedReplies(comment.getReplies());
            
            // Delete the comment itself
            commentRepository.delete(comment);
        }
    }

    private void deleteNestedReplies(List<Reply> replies) {
        for (Reply reply : replies) {
            deleteNestedReplies(reply.getChildReplies());
            replyRepository.delete(reply);
        }
    }

}
