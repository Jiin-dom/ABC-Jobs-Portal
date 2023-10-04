<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="/resources/css/style.css"> -->
<link rel="stylesheet" href="/resources/css/homepage.css" rel="preload">


<style>
.comment {
    margin-left: 0; /* Adjust as needed */
}

.reply {
    margin-left: 20px; /* Adjust indentation level */
}

.nestedReply {
    margin-left: 40px; /* Adjust indentation level */
}
</style>


</head>
<body class="homepagebody">
 	<jsp:include page="../header2.jsp">
		<jsp:param value="ABC Jobs" name="HTMLtitle" />
	</jsp:include>
	
				 <script>
				       console.log("User ID: ${userId}");
				 </script>

	
	<!-- <div class="homepageWholeContainer" style="background-color: #F9F7F7; height: 100vh; margin:0;"> -->
	<div class="homepageWholeContainer">
		<div class="container homepageContainer">
			<div class="row homep homepageContainerRow">
			<div class="col-lg-1 col-md-0"></div>
				<div class="col-lg-2 col-md-3 d-none d-md-block homepagecol1">
					<div class="card homeProfileCard mt-sm-none">

						<c:choose>
						    <c:when test="${empty profilePicPath}">
								<a href="/profile-page" class="aTagBeforeImg">
									<img src="/resources/images/profile.png" class="homeProfileCardImg" id="homeProfileCardImg">
								</a>
						    </c:when>
						    <c:otherwise>
						        <a href="/dashboard" class="aTagBeforeImg">
						            <img src="${profilePicPath}" alt="${profilePic}" class="homeProfileCardImg" id="homeProfileCardImg"/>
						        </a>
						    </c:otherwise>
						</c:choose>
						
				      
				      <div class="card-body homeProfileCardBody">
				        <h2 class="homeProfileCardUserName">${firstName} ${lastName}</h2>
				        <c:if test="${not empty headline}">
							<h3  class="homeProfileCardJob">${headline}</h3>
						</c:if>
				        <%-- <h3  class="homeProfileCardJob">${headline}</h3> --%>
				        <ul class="stats">
				          <li class="homeProfileCardList">
							<a  class="homeProfileCardList" href="/jobs" style="font-weight: 400;"><i class="bi bi-bookmark-fill"></i><p> My Jobs</p></a>
				          </li>
				          <li class="homeProfileCardList">
							<i class="bi bi-binoculars-fill"></i><p> Job Seek</p>
				          </li>
				          <li class="homeProfileCardList">
				            <i class="bi bi-people-fill"></i><p> Connections</p>
				          </li>
				        </ul>
				      </div>
				    </div>
				</div>
				
				<div class="col-lg-5 col-md-9 homepagecol2">
					<div class=" card threadPostDiv" id="threadPostDiv">
						<div class="profileNpostInput">
							<c:choose>
							    <c:when test="${empty profilePicPath}">
							        <div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white profileshape"
										style="width: 50px; height: 50px; border: 1px solid #112D4E; margin-left: 0px;">
										<span style="font-size: 10px;">${f}</span> <span style="font-size: 10px;">${l}</span>
									</div>
							    </c:when>
							    <c:otherwise>
							            <img src="${profilePicPath}" alt="${profilePic}" class="profilePicTwo"/>
							    </c:otherwise>
							</c:choose>
							
							<input class="postInputFieldHomepage" type="text" data-bs-toggle="modal" data-bs-target="#exampleModalCenter" style="width:87%; margin-left: 10px; height: 50px; border-radius: 15px; padding-left: 20px;"
								placeholder="What's on your mind?">
							
						</div>
						<div>
							<div class="d-flex justify-content-evenly mediaUploads">
								<div class="d-flex text-success align-items-center">
									<i class="bi bi-images me-1"></i>
									<h6 class="mb-0">Photo</h6>
								</div>
								<div class="d-flex text-danger align-items-center">
									<i class="bi bi-camera-video me-1"></i>
									<h6 class="mb-0">Video</h6>
								</div>
								<div class="d-flex text-primary align-items-center">
									<i class="bi bi-newspaper me-1"></i>
									<h6 class="mb-0">Article</h6>
								</div>
							</div>
						</div>
					</div>
					
					<c:forEach items="${posts}" var="post">
						<c:set var="timeSincePostedPost" value="${timeSincePostedMap[post.postId]}" />
						
<!-- 						    <script>
						        console.log("Post ID: ${post.postId}");
						    </script> -->
						<div class="card postCard" id="postCard">
							<div class="card-body postCardBody">
								<div class="postCardUserProfile">
									<c:choose>
									    <c:when test="${empty post.user.userDetails.photoImagePath}">
											<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white profileshape"
												style="width: 50px; height: 50px; border: 1px solid #112D4E; margin-left: 0px;">
												<span style="font-size: 10px;">${post.user.userDetails.firstName.charAt(0)}</span> <span style="font-size: 10px;">${post.user.userDetails.lastName.charAt(0)}</span>
											</div>
									    </c:when>
									    <c:otherwise>									        
									            <img src="${post.user.userDetails.photoImagePath}" alt="${post.user.userDetails.photos}" class="profilePic3Post" />
									    </c:otherwise>
									</c:choose>

									<div>
										<p class="postCardUserProfileName">${post.user.userDetails.firstName} ${post.user.userDetails.lastName}</p>
										<c:if test="${not empty post.user.userDetails.headline}">
											<h3  class="homeProfileCardJob">${post.user.userDetails.headline}</h3>
										</c:if>
										
										<p class="postCardUserProfileTime">${timeSincePostedPost}</p>
									</div>
								</div>
								<div class="postCardContent">
									<p class="postCardPostContent">${post.postContent}</p>
									
							        <!-- Conditionally render the image section if photoImagePath has a value -->
							        <c:if test="${not empty post.photoImagePath}">
							            <img class="card-img-top" src="${post.photoImagePath}" alt="${post.photos}" style="width: 100%">
							        </c:if>
							        <!-- ended -->
									
								</div>
								
								<div class="postCardActionButtonsDiv">
									<div class="postCardActionButtons">
										<i class="bi bi-hand-thumbs-up"></i>
										<p>Like</p>
									</div>
									<div class="postCardActionButtons commentButton" data-post-id="${postId}" onclick="toggleCommentInput(this);">
										<i class="bi bi-chat-square-text"></i>
										<p>Comment</p>
									</div>
									<div class="postCardActionButtons">
										<i class="bi bi-arrow-repeat"></i>
										<p>Repost</p>
									</div>
								</div>
								
								
								
								<div class="commentsContainer">
									<c:forEach items="${post.comments}" var="comment">
							            <div class="comment" id="commentBox">
							            	<div  class="commentInner">
							            		<div>
													
													<c:choose>
													    <c:when test="${empty comment.user.userDetails.photoImagePath}">
															<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-success  bg-gradient text-white profileshape"
																style="width: 30px; height: 30px; border: 0px solid #112D4E; margin-left: 0px;">
																<span style="font-size: 10px;">${comment.user.userDetails.firstName.charAt(0)}</span> <span style="font-size: 10px;">${comment.user.userDetails.lastName.charAt(0)}</span>
															</div>
													    </c:when>
													    <c:otherwise>									        
													            <img src="${comment.user.userDetails.photoImagePath}" alt="${comment.user.userDetails.photos}" class="profilePic4Comment" />
													    </c:otherwise>
													</c:choose>
								            	</div>
							            	
							            	<div  class="commentPart3">
							            		<div class="comment3">
								            		<div class="commentPart2">
									            		<div class="commentPart1">
									            			<div class="commentPart1Usernames">
									            				<p class="commenterName">${comment.user.userDetails.firstName} ${comment.user.userDetails.lastName}</p>
									            				<p class="commenterHeadline">${comment.user.userDetails.headline}</p>
									            			</div>
									            			<div class="timeNDeleteToggle">
									            				<p class="commentTime">${timeSincePostedMap[comment.commentId]}</p>
									            				 <c:if test="${loggedInUserId eq comment.user.userId}">
										            				<div class="dropdown">
																	  <i class="bi bi-three-dots-vertical" data-bs-toggle="dropdown" aria-expanded="false"></i>
																	  <ul class="dropdown-menu">
																	    <li>
															                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#deleteModal${comment.commentId}">
															                    Delete
															                </a>
																	    </li>
																	    
																	  </ul>
																	</div>

																</c:if>
									            			</div>
									            			
									            		</div>
									            		<p  class="commenterComment">${comment.comment}</p>
									            	</div>
	 												
	 												<div class="replyNshow">
		 												<div class="replyToggle" data-comment-id="${commentId}" onclick="toggleReplyInput(this);">
												            <p>Reply</p>
												        </div>
												        <c:if test="${not empty comment.replies}">
													        <div class="showMoreButton" id="showMoreButton_${commentId}" onclick="toggleReplies(this);">
			         											Show More <i class="bi bi-caret-down-fill"></i>      											
			         										</div>
		         										</c:if>
	 												</div>
							            		</div>

										        
										        <div class="repliesContainer"  id="repliesContainer_${commentId}" style="display: none;">
											        <c:forEach items="${comment.replies}" var="reply">
											            <div class="reply">
											                <!-- Display reply content, user, and other information -->
											                <c:if test="${empty reply.parentReply}">
														        <div class="replyBlogCont">    
															        	<div>	
																			<c:choose>
																			    <c:when test="${empty reply.user.userDetails.photoImagePath}">
																					<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-success  bg-gradient text-white profileshape"
																						style="width: 30px; height: 30px; border: 0px solid #112D4E; margin-left: 0px;">
																						<span style="font-size: 10px;">${reply.user.userDetails.firstName.charAt(0)}</span> <span style="font-size: 10px;">${reply.user.userDetails.lastName.charAt(0)}</span>
																					</div>
																			    </c:when>
																			    <c:otherwise>									        
																			            <img src="${reply.user.userDetails.photoImagePath}" alt="${reply.user.userDetails.photos}" class="profilePic5Reply" />
																			    </c:otherwise>
																			</c:choose>
														            	</div>
															        
															        <div class="replyBlob">
															        	<div  class="replyBlobInner" id="replyBlobInner">
															        		<div class="replyUsernameNTime">
															        			<div>
															        				<p class="replyUserName">${reply.user.userDetails.firstName} ${reply.user.userDetails.lastName}</p>
															        				<p class="replyUserHeadline">${reply.user.userDetails.headline}</p>
															        			</div>
															        			
															        			<div class="timeNDeleteToggle">
														            				<p class="commentTime">${timeSincePostedMap[reply.replyId]}</p>
														            				 <c:if test="${loggedInUserId eq reply.user.userId}">
															            				<div class="dropdown">
																						  <i class="bi bi-three-dots-vertical" data-bs-toggle="dropdown" aria-expanded="false"></i>
																						  <ul class="dropdown-menu">
																						    <li>
																				                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#deleteModal${reply.replyId}">
																				                    Delete
																				                </a>
																						    </li>
																						    
																						  </ul>
																						</div>
																						
																					</c:if>
														            			</div>
															        		</div>
															        		<p class="replyContent">${reply.reply}</p>
															        	</div>
															        																      							        
															           <div class="replyNshow">
							 												<div class="replyToggle" data-reply-id="${replyId}" onclick="toggleReplyReplyInput(this);">
																	            <p>Reply</p>
																	        </div>
																	        <c:if test="${not empty reply.childReplies}">
																		        <div class="showMoreButton" id="showMoreButton_${replyId}" onclick="toggleNestedReplies(this);">
								         											Show More <i class="bi bi-caret-down-fill"></i>      											
								         										</div>
							         										</c:if>
						 												</div>
															        </div>
															        
														        
														        </div>
															</c:if>

											                <!-- ... (other reply information) ... -->											                
														        <div class="replyNestedInputField" id="replyNestedInputField_${replyId}" style="display: none;">
														        	<div  class="replyNestedInputFieldInner">
															        	<c:choose>
																		    <c:when test="${empty profilePicPath}">
																				<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-success  bg-gradient text-white profileshape"
																					style="width: 30px; height: 30px; border: 0px solid #112D4E; margin-left: 0px;">
																					<span style="font-size: 10px;">${reply.user.userDetails.firstName.charAt(0)}</span> <span style="font-size: 10px;">${reply.user.userDetails.lastName.charAt(0)}</span>
																				</div>
																		    </c:when>
																		    <c:otherwise>									        
																		            <img src="${profilePicPath}" alt="${profilePic}" class="profilePic5Reply" />
																		    </c:otherwise>
																		</c:choose>
																        <form action="/reply-nested" method="post"  id="commentInputForm">
																            <input type="hidden" name="userId" value="${userId}">
																            <!-- <input type="text" name="reply" class="commentInput" placeholder="Write a reply..." style="color: #919191"> --%> -->
																            <input type="hidden" name="commentId" value="${comment.commentId}">
																	        <input type="hidden" name="parentReplyId" value="${reply.replyId}">
																	        <input type="hidden" name="userId" value="${userId}">
																	        <input type="text" name="reply" id="commentInput" class="commentInput form-control" placeholder="Write a reply..." >
																            <!-- <button type="submit">Submit</button> -->
																        </form>
															        </div>
															    </div>
													    
														    
														    <!-- Render nested replies -->
									                      <div class="nestedRepliesContainer" style="display: none;">
								                            <c:forEach items="${reply.childReplies}" var="nestedReply">
								                                <div class="nestedReply">
								                                      <div class="replyBlogCont">
															        	<div>
																			<c:choose>
																			    <c:when test="${empty nestedReply.user.userDetails.photoImagePath}">
																					<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-success  bg-gradient text-white profileshape"
																						style="width: 30px; height: 30px; border: 0px solid #112D4E; margin-left: 0px;">
																						<span style="font-size: 10px;">${nestedReply.user.userDetails.firstName.charAt(0)}</span> <span style="font-size: 10px;">${nestedReply.user.userDetails.lastName.charAt(0)}</span>
																					</div>
																			    </c:when>
																			    <c:otherwise>									        
																			            <img src="${nestedReply.user.userDetails.photoImagePath}" alt="${nestedReply.user.userDetails.photos}" class="profilePic6NestedReply" />
																			    </c:otherwise>
																			</c:choose>
														            	</div>
															        <div class="replyBlob">
															        	<div  class="replyBlobInner">
															        		<div class="replyUsernameNTime">
															        			<div>
															        				<p class="replyUserName">${nestedReply.user.userDetails.firstName} ${nestedReply.user.userDetails.lastName}</p>
															        				<p class="replyUserHeadline">${nestedReply.user.userDetails.headline}</p>
															        			</div>
															        			<div class="timeNDeleteToggle">
														            				<p class="commentTime">${timeSincePostedMap[reply.replyId]}</p>
														            				 <c:if test="${loggedInUserId eq reply.user.userId}">
															            				<div class="dropdown">
																						  <i class="bi bi-three-dots-vertical" data-bs-toggle="dropdown" aria-expanded="false"></i>
																						  <ul class="dropdown-menu">
																						    <li>
																				                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#deleteModal_${comment.commentId}_${nestedReply.replyId}">
																				                    Delete
																				                </a>
																						    </li>
																						    
																						  </ul>
																						</div>
																					
																					</c:if>
														            			</div>
															        		</div>
															        		<p class="replyContent">${nestedReply.reply}</p>
															        	</div>
															        	<div class="replyToggle" data-reply-id="${replyId}" onclick="toggleReplyReplyInput(this);">
																            <p>Reply</p>
																        </div>
															        </div>

														        </div>
								                                </div>
								                            </c:forEach>
								                        </div>
											            </div>
											        </c:forEach>
											    </div>

								            	  <div class="replyInputField" id="replyInputField_${commentId}" style="display: none;">
											      	<div class="replyNestedInputFieldInner">
														<c:choose>
														    <c:when test="${empty profilePicPath}">
																<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-success  bg-gradient text-white profileshape"
																	style="width: 30px; height: 30px; border: 0px solid #112D4E; margin-left: 0px;">
																	<span style="font-size: 10px;">${f}</span> <span style="font-size: 10px;">${l}</span>
																</div>
														    </c:when>
														    <c:otherwise>									        
														            <img src="${profilePicPath}" alt="${profilePic}" class="profilePic4Comment" />
														    </c:otherwise>
														</c:choose>
												        <form action="/reply" method="post" id="commentInputForm">
												            <input type="hidden" name="commentId" value="${comment.commentId}">
												            <input type="hidden" name="userId" value="${userId}">
												            <input type="text" name="reply" id="commentInput" class="commentInput  form-control" placeholder="Write a reply...">
												            <!-- <button type="submit">Submit</button> -->
												        </form>
												   </div>
											    </div>
							            	</div>						            	
							            	</div>
							            </div>
							        </c:forEach>
								</div>
						        
								
								<div class="commentInputField" id="commentInputField_${postId}" style="display: none;">
								    <div class="replyNestedInputFieldInner">
								        <c:choose>
										    <c:when test="${empty profilePicPath}">
												<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-success  bg-gradient text-white profileshape"
													style="width: 30px; height: 30px; border: 0px solid #112D4E; margin-left: 0px;">
													<span style="font-size: 10px;">${f}</span> <span style="font-size: 10px;">${l}</span>
												</div>
										    </c:when>
										    <c:otherwise>									        
										            <img src="${profilePicPath}" alt="${profilePic}" class="profilePic4Comment" />
										    </c:otherwise>
										</c:choose>
								         <form action="/post-comment" method="post" id="commentInputForm">
									        <input type="hidden" name="postId" value="${post.postId}">
									        <input type="hidden" name="userId" value="${userId}">
									        <input type="text" name="content" id="commentInput" class="commentInput  form-control" placeholder="Write a comment..." style="color: #919191; font-size: 14px;">
									        <!-- <button type="submit">Submit</button> -->
									    </form>
								   </div>
								</div>
							</div>
						
						</div>
					</c:forEach>
				</div>
				
				<div class="col-lg-3 col-md-12 d-none d-md-block homepagecol3">
					<div class="card" id="peopleUmightKnowCard">
						<div class="card-body">
							<h3 class="peopleUmightKnow">People you might know</h3>
							<div class="peopleUmightKnowList" style="display: flex; flex-direction: column; justify-content: space-between;">
								
								<c:forEach items="${users}" var="user">
									<div class="peopleDisplayDiv">
										<c:choose>
										    <c:when test="${empty user.userDetails.photoImagePath}">
												<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white profileshape"
													style="width: 50px; height: 50px; border: 1px solid #112D4E; margin-left: 0px;">
													<span style="font-size: 10px;">${user.userDetails.firstName.charAt(0)}</span> <span style="font-size: 10px;">${user.userDetails.lastName.charAt(0)}</span>
												</div>
										    </c:when>
										    <c:otherwise>									        
										            <img src="${user.userDetails.photoImagePath}" alt="${user.userDetails.photos}" class="profilePicUserList" />
										    </c:otherwise>
										</c:choose>
										<div>
											<h4 class="userDisplayName">${user.userDetails.getFirstName()} ${user.userDetails.getLastName()}</h4>
											<p class="userDisplayHeadline">${user.userDetails.getHeadline()}</p>
											<button class="userDisplayButton">Connect</button>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					
					<div class="card" id="recentJobPosts">
						<div class="card-body" id="recentJobPostsBody">
							<h3 class="peopleUmightKnow">Recent Job Postings</h3>
							<div>				
							<c:forEach items="${jobs}" var="jobs">
									<div class="jobDisplayDivInner mb-3" id="jobDisplayDivInner">
										
										<div>
											<h4 class="jobDisplayTitle">${jobs.jobTitle}</h4>
											<p class="jobDisplayCompany">${jobs.jobLocation}</p>
											<%-- <p class="jobDisplayType">${jobs.jobType}</p> --%>
										</div>
										<div>
											<a href="jobs/job-details/${jobs.jobId}"><button class="userDisplayButton">View</button></a>
										</div>
									</div>
							</c:forEach>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-1 col-md-0"></div>
			</div>
		</div>
	</div>
	

	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">Create
						Post</h5>
					<button type="button" class="closemdl" data-bs-dismiss="modal"
						aria-label="Close" style="border: none; background-color: #ffff;">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/post-content" method="post" modelAttribute="post" enctype="multipart/form-data">
						<div class="select-menu select-menuWProfilePost">
							<div class="rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white profileshape" style="width: 45px; height: 45px; border: 1px solid #112D4E; margin-left: 0px;">
								<span style="font-size: 10px;">${f}</span> <span style="font-size: 10px;">${l}</span>
							</div>
							
							<div>
								<h5 class="userNameInPostModal">${firstName} ${lastName}</h5>
								<select id="privacy" name="privacy" class="form-select mb-3 postOptions" style="font-size:12px; border-radius: 10px; background-color: #f5f5f7; font-weight: 500; margin: 0;" aria-label=".form-select-lg example" required>
								  <option selected value="Public">Public</option>
								  <option value="Private">Private</option>
								  <option value="Custom">Custom</option>
								</select>
							</div>

						</div>
						<textarea id="postContent" name="postContent" class="mb-3" style="margin-top: 10px; width: 100%;font-size: 14px; border: none;" placeholder="Write post here..."></textarea>

			            <div class="holder" style="height: 300px; width: 100%; margin: auto;">
			                <img id="imgPreview" src="#" alt="" style="width: inherit;" />
			            </div>
			            
			            <!-- <input type="file" class="form-control" name="imageFile" id="photo" accept="image/*" style="display: none;"> -->
						<div class="d-flex justify-content-evenly" style="border: 1px solid #AAAAAA; border-radius: 20px; padding: 10px;">
							<div class="image-upload">
							    <label for="photo">
							        <div class="d-flex text-success align-items-center">
										<i class="bi bi-images me-1"></i>
										<h6 class="mb-0">Photo</h6>
									</div>
							    </label>
							
							    <input type="file" name="imageFile" id="photo" accept="image/*"/>
							</div>
<!-- 							<div class="d-flex text-success align-items-center">
								<i class="bi bi-images me-1"></i>
								<h6 class="mb-0">Photo</h6>
							</div> -->
							<div class="d-flex text-danger align-items-center">
								<i class="bi bi-camera-video me-1"></i>
								<h6 class="mb-0">Video</h6>
							</div>
							<div class="d-flex text-primary align-items-center">
								<i class="bi bi-newspaper me-1"></i>
								<h6 class="mb-0">Article</h6>
							</div>
						</div>
						<input type="hidden" name="userId" value="${userId}" />
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary"
								data-bs-dismiss="modal">Post</button>
						</div>
					</form>
				</div>
					
			</div>
		</div>
	</div>
	
		<script>
    function toggleCommentInput(clickedElement) {
        var postId = clickedElement.getAttribute('data-post-id');
        console.log("Toggle called for post ID:", postId);
        var postCard = clickedElement.closest('.postCard');
        if (postCard) {
            var commentInputField = postCard.querySelector(`#commentInputField_${postId}`);
            if (commentInputField) {
                commentInputField.style.display = commentInputField.style.display === 'none' ? 'block' : 'none';
            } else {
                console.error(`Comment input field with ID commentInputField_${postId} not found.`);
            }
        } else {
            console.error(`Post card for post ID ${postId} not found.`);
        }
    }
 	
  	function toggleReplyInput(clickedElement) {
 	    var commentId = clickedElement.getAttribute('data-comment-id');
 	    console.log("Toggle called for comment ID:", commentId);
 	    
 	    // Find the closest .comment element
 	    var commentBlob = clickedElement.closest('.comment');
 	    
 	    if (commentBlob) {
 	        // Search within the .comment element for the corresponding reply input field
 	        var replyInputField = commentBlob.querySelector(`#replyInputField_${commentId}`);
 	        if (replyInputField) {
 	            replyInputField.style.display = replyInputField.style.display === 'none' ? 'block' : 'none';
 	        } else {
 	            console.error(`Reply input field with ID replyInputField_${commentId} not found.`);
 	        }
 	    } else {
 	        console.error(`Comment blob for comment ID ${commentId} not found.`);
 	    }
 	} 
	
 	function toggleReplyReplyInput(clickedElement) {
 	    var replyId = clickedElement.getAttribute('data-reply-id');
 	    console.log("Toggle called for reply ID:", replyId);
 	    
 	    // Find the closest .comment element
 	    var replyBlob = clickedElement.closest('.reply');
 	    
 	    if (replyBlob) {
 	        // Search within the .comment element for the corresponding reply input field
 	        var replyNestedInputField = replyBlob.querySelector(`#replyNestedInputField_${replyId}`);
 	        if (replyNestedInputField) {
 	        	replyNestedInputField.style.display = replyNestedInputField.style.display === 'none' ? 'block' : 'none';
 	        } else {
 	            console.error(`Reply input field with ID replyNestedInputField_${replyId} not found.`);
 	        }
 	    } else {
 	        console.error(`Comment blob for comment ID ${commentId} not found.`);
 	    }
 	} 

    function submitComment(postId) {
        var commentInput = document.querySelector(`#commentInputField_${postId} .commentInput`);
        if (commentInput) {
            var comment = commentInput.value;

            // Perform whatever action you want with the comment, such as sending it to the server

            // Clear the comment input field
            commentInput.value = '';

            // Hide the comment input field after submitting
            toggleCommentInput({getAttribute: () => postId});
        } else {
            console.error(`Comment input field with ID commentInputField_${postId} not found.`);
        }
    }
    
    
    function toggleReplies(clickedElement) {
        const commentContainer = clickedElement.closest('.comment');
        if (commentContainer) {
            const repliesContainer = commentContainer.querySelector('.repliesContainer');
            const showMoreButton = commentContainer.querySelector('.showMoreButton');
            if (repliesContainer && showMoreButton) {
                if (repliesContainer.style.display === 'none') {
                    repliesContainer.style.display = 'block';
                    showMoreButton.innerHTML = 'Show Less <i class="bi bi-caret-up-fill"></i>';
                } else {
                    repliesContainer.style.display = 'none';
                    showMoreButton.innerHTML = 'Show More <i class="bi bi-caret-down-fill"></i>';
                }
            }
        }
    }
    
    function toggleNestedReplies(clickedElement) {
        const replyContainer = clickedElement.closest('.reply');
        if (replyContainer) {
            const nestedRepliesContainer = replyContainer.querySelector('.nestedRepliesContainer');
            const showMoreButton = replyContainer.querySelector('.showMoreButton');
            if (nestedRepliesContainer && showMoreButton) {
                if (nestedRepliesContainer.style.display === 'none') {
                    nestedRepliesContainer.style.display = 'block';
                    showMoreButton.innerHTML = 'Show Less <i class="bi bi-caret-up-fill"></i>';
                } else {
                    nestedRepliesContainer.style.display = 'none';
                    showMoreButton.innerHTML = 'Show More <i class="bi bi-caret-down-fill"></i>';
                }
            }
        }
    }



    
    $(document).ready(() => {
        $("#photo").change(function () {
            const file = this.files[0];
            if (file) {
                let reader = new FileReader();
                reader.onload = function (event) {
                    $("#imgPreview")
                      .attr("src", event.target.result);
                };
                reader.readAsDataURL(file);
            }
        });
    });

</script>

</body>
</html>