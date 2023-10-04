package com.abcjobs3.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abcjobs3.entity.Reply;
import com.abcjobs3.repository.ReplyRepository;

@Service
@Transactional
public class ReplyService {


    @Autowired
    private ReplyRepository replyRepository;

    public Reply postReply(Reply reply) {
        return replyRepository.save(reply);
    }
    
    public Reply getReplyById(Long replyId) {
        return replyRepository.findById(replyId)
            .orElseThrow(() -> new IllegalArgumentException("Reply not found with ID: " + replyId));
    }
    
//    public void deleteReplyAndNestedReplies(Reply reply) {
//        List<Reply> nestedReplies = reply.getChildReplies();
//        for (Reply nestedReply : nestedReplies) {
//            deleteReplyAndNestedReplies(nestedReply); // Recursively delete nested replies
//            replyRepository.delete(nestedReply);
//        }
//        replyRepository.delete(reply); // Delete the parent reply after nested replies are deleted
//    }
    
    public void deleteReplyAndNestedReplies(Reply replyToDelete) {
        if (replyToDelete != null) {
            if (replyToDelete.getParentReply() == null) {
                // If the replyToDelete is not a nested reply, delete it and its nested replies
                deleteNestedReplies(replyToDelete.getChildReplies());
                replyRepository.delete(replyToDelete);
            } else {
                // If the replyToDelete is a nested reply, delete it only
                replyRepository.delete(replyToDelete);
            }
        }
    }
    
    private void deleteNestedReplies(List<Reply> nestedReplies) {
        if (nestedReplies != null) {
            for (Reply nestedReply : nestedReplies) {
                deleteNestedReplies(nestedReply.getChildReplies());
                replyRepository.delete(nestedReply);
            }
        }
    }
    

}
