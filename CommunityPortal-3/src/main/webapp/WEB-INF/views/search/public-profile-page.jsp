<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/profilepage.css">
</head>
<body style="background-color: #F9F7F7">

    <div class=" container alert alert-success alert-dismissible fade show my-3 opacity-50 ${ profilemsg == null ? "d-none" : "d-block" }" role="alert">
  		${profilemsg}
  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	<div class="container profilepage">
		<div class="profile-main">
			<div class="profle-container">
				<img src="/resources/images/profheader.png" width="100%">
				<div class="profile-container-inner">
				
					
					
					<c:choose>
					    <c:when test="${empty profilePicPath}">
					        <img src="/resources/images/blankProfilepic.png" class="profile-pic">
					    </c:when>
					    <c:otherwise>
					        <div class="col-2">
					            <img src="${profilePicPath}" alt="${profilePic}" class="profile-pic" />
					        </div>
					    </c:otherwise>
					</c:choose>
					<h1>${firstName} ${lastName}</h1>
					<b>${headline}</b>
					<p>${city} ${country}</p>
					<a>Contact Info</a>
					
					<div class="mutual-connection">
						<img src="/resources/images/idduno.jpg">
						<span>1 mutual connection: Orlando Diggs</span>
					</div>
					
					<div class="profile-btn">
						<a href="#" class="primary-btn"><img src="/resources/images/idduno.jpg">Connect</a>
						<a href="#"><img src="/resources/images/idduno.jpg">Message</a>
					</div>
				</div>
			</div>
			
			<div class="profile-description">
				<h2>About</h2>
				<p>Whats you eta whats your eta</p>
				<a href="#" class="see-more-link">See more...</a>
			</div>
			
			<div class="profile-description">
				<h2>Experience</h2>
				<div class="profile-desc-row">
					<img src="/resources/images/idduno.jpg">
					<div>
						<h3>Lead Font-end developer</h3>
						<b>Micro Nutrient &middot; Deficiency</b>
						<b>Feb 2012 &middot; Present</b>
						<hr>
					</div>
				</div>
				<div class="profile-desc-row">
					<img src="/resources/images/idduno.jpg">
					<div>
						<h3>Lead Font-end developer</h3>
						<b>Micro Nutrient &middot; Deficiency</b>
						<b>Feb 2012 &middot; Present</b>
						<hr>
					</div>
				</div>
				<div class="profile-desc-row">
					<img src="/resources/images/idduno.jpg">
					<div>
						<h3>Lead Font-end developer</h3>
						<b>Micro Nutrient &middot; Deficiency</b>
						<b>Feb 2012 &middot; Present</b>
						<hr>
					</div>
				</div>
				
				<a href="#" class="experience-link">Show all experiences...</a>
			</div>
				<div class="profile-description">
					<h2>Education</h2>
					<div class="profile-desc-row">
						<img src="/resources/images/idduno.jpg">
						<div>
							<h3>Lithan Academy</h3>
							<b>Micro Nutrient &middot; Deficiency</b>
							<b>Feb 2012 &middot; Present</b>
							<hr>
						</div>
					</div>
					<div class="profile-desc-row">
						<img src="/resources/images/idduno.jpg">
						<div>
							<h3>University of cebu</h3>
							<b>Micro Nutrient &middot; Deficiency</b>
							<b>Feb 2012 &middot; Present</b>
							<hr>
						</div>
					</div>
					<div class="profile-desc-row">
						<img src="/resources/images/idduno.jpg">
						<div>
							<h3>Software engineering</h3>
							<b>Micro Nutrient &middot; Deficiency</b>
							<b>Feb 2012 &middot; Present</b>
							<hr>
						</div>
					</div>
					
					<a href="#" class="experience-link">Show all education...</a>
				</div>
		</div>
		

		
		<!-- sidebar -->
		<div class="profile-sidebar">
			<div class="sidebar-ad">
				<a href="profile" class="editProfileTagSide">Edit profile <i class="bi bi-pencil-square"></i> </a>
			
			</div>
			
			<div class="sidebar-people">
				<h3>People you may know</h3>
				<div class="sidebar-people-row">
					<img src="/resources/images/idduno.jpg">
					<div>
						<h2>User name</h2>
						<p>User headline</p>
						<a href="#">Connect</a>
					</div>
				</div>
				<div class="sidebar-people-row">
					<img src="/resources/images/idduno.jpg">
					<div>
						<h2>User name</h2>
						<p>User headline</p>
						<a href="#">Connect</a>
					</div>
				</div>
				<div class="sidebar-people-row">
					<img src="/resources/images/idduno.jpg">
					<div>
						<h2>User name</h2>
						<p>User headline</p>
						<a href="#">Connect</a>
					</div>
				</div>
				<div class="sidebar-people-row">
					<img src="/resources/images/idduno.jpg">
					<div>
						<h2>User name</h2>
						<p>User headline</p>
						<a href="#">Connect</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>