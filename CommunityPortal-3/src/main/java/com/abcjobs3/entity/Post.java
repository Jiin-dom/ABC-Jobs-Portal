package com.abcjobs3.entity;

import java.beans.Transient;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="post")
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "post_id")
	private Long postId;
	
	@Column(name = "privacy")
	private String privacy;
	
	@Column(name = "post_content")
	private String postContent;
	
    @Column(name = "posted_at")
    private LocalDateTime postedAt;
    
	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private Users user;
	
    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Comment> comments = new ArrayList<>();
    
	@Column(nullable = true, length = 64)
	private String photos;

	@Column(nullable = true, length = 64)
	private String photoImagePath;
	
	
	
	public Post() {}
	
	

	public Post(Long postId, String privacy, String postContent, LocalDateTime postedAt, Users user,
			List<Comment> comments, String photos, String photoImagePath) {
		super();
		this.postId = postId;
		this.privacy = privacy;
		this.postContent = postContent;
		this.postedAt = postedAt;
		this.user = user;
		this.comments = comments;
		this.photos = photos;
		this.photoImagePath = photoImagePath;
	}


	

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}


	public String getPhotoImagePath() {
		return photoImagePath;
	}



	public void setPhotoImagePath(String photoImagePath) {
		this.photoImagePath = photoImagePath;
	}



	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Long getPostId() {
		return postId;
	}

	public void setPostId(Long postId) {
		this.postId = postId;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public LocalDateTime getPostedAt() {
		return postedAt;
	}

	public void setPostedAt(LocalDateTime postedAt) {
		this.postedAt = postedAt;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	
	
	
	
}
