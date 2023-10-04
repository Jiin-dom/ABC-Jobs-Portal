package com.abcjobs3.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Reply {

 	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reply_id")
    private Long replyId;

    @ManyToOne
    @JoinColumn(name = "comment_id", referencedColumnName = "comment_id")
    private Comment comment;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private Users user;

    @Column(name = "reply")
    private String reply;
    
    @Column(name = "replied_at")
    private LocalDateTime repliedAt;
    
    @ManyToOne
    @JoinColumn(name = "parent_reply_id", referencedColumnName = "reply_id")
    private Reply parentReply; // Reference to the parent reply

    @OneToMany(mappedBy = "parentReply", cascade = CascadeType.ALL)
    private List<Reply> childReplies; // List of child replies

    public Reply() {
    }

	public Reply(Long replyId, Comment comment, Users user, String reply, LocalDateTime repliedAt, Reply parentReply,
			List<Reply> childReplies) {
		super();
		this.replyId = replyId;
		this.comment = comment;
		this.user = user;
		this.reply = reply;
		this.repliedAt = repliedAt;
		this.parentReply = parentReply;
		this.childReplies = childReplies;
	}

	public Long getReplyId() {
		return replyId;
	}

	public void setReplyId(Long replyId) {
		this.replyId = replyId;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public LocalDateTime getRepliedAt() {
		return repliedAt;
	}

	public void setRepliedAt(LocalDateTime repliedAt) {
		this.repliedAt = repliedAt;
	}

	public Reply getParentReply() {
		return parentReply;
	}

	public void setParentReply(Reply parentReply) {
		this.parentReply = parentReply;
	}

	public List<Reply> getChildReplies() {
		return childReplies;
	}

	public void setChildReplies(List<Reply> childReplies) {
		this.childReplies = childReplies;
	}

	
    
}
