<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/job.css">
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    
    
</head>
<body>
	<jsp:include page="../header2.jsp">
		<jsp:param value="Dashboard" name="HTMLtitle" />
	</jsp:include>
	

    <div class=" container alert alert-success alert-dismissible fade show my-3 opacity-50 ${ applicationSuccessMessage == null ? "d-none" : "d-block" }" role="alert">
  		${applicationSuccessMessage}
  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	
	<div class=" container alert alert-danger alert-dismissible fade show my-3 opacity-50 ${ applicationCancelMessage == null ? "d-none" : "d-block" }" role="alert">
  		${applicationCancelMessage}
  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>

	<!-- Search Form -->
  <!--  <div class="jobSearchBanner"> -->
  <div class="jobSearchBanner">
	    <div class="container jobSearchBannerCont">
	        <form action="" method="get" class="jobSearchBannerForm row gx-2 justify-content-center">
	            <div class="col-lg-5 col-md-6">
	                <div class="input-group jobSearchInputGroup" style="width: 100%">
	                    <span class="input-group-text" id="basic-addon1" style="font-weight: 500">What</span>
	                    <input type="text" name="jobindex" class="form-control" name="searchfield" aria-label="Username"
	                        aria-describedby="basic-addon1" placeholder="Job title, keyword, or company"
	                        value="<%= request.getParameter("jobindex") != null ? request.getParameter("jobindex") : "" %>">
	                </div>
	            </div>
	            <div class="col-lg-5 col-md-6">
	                <div class="input-group jobSearchInputGroup"  style="width: 100%">
	                    <span class="input-group-text" id="basic-addon2" style="font-weight: 500">Where</span>
	                    <input type="text" name="jobindex" class="form-control" name="searchfield" aria-label="Username"
	                        aria-describedby="basic-addon2" placeholder="Country, city, state, or keyword"
	                        value="<%= request.getParameter("jobindex") != null ? request.getParameter("jobindex") : "" %>">
	                </div>
	            </div>
	        </form>
	    </div>
	</div>


    <!-- Tab Navigation -->
    <div class="container">
        <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
                    type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Jobs</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
                    type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">My Jobs</button>
            </li>
        </ul>
    </div>

    <!-- Tab Content -->
    <div class="container">
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
                tabindex="0">
                <div class="container jobPageContainer">
					<c:forEach items="${jobs}" var="job">
			            <c:set var="timeSincePosted" value="${timeSincePostedMap[job.jobId]}" />
			            <div class="card jobCardsListCard">
						  <div class="card-body jobPageCardBody">
							  <div class="detailsExceptButton">
								<h4 class="card-title jobTitle1">${job.jobTitle}</h4>
							    <h6 class="card-subtitle jobCompany1">${job.jobCompany}</h6>
							    <p class="card-text jobLocation1"><i class="bi bi-geo-alt-fill"></i> ${job.jobLocation}</p>
							    <div class="workSettingNType">
							    	<p class="card-text jobType">${job.jobType}</p> 
							    	<p class="card-text workSetting1">${job.workSetting}</p> 
							    </div>
							    
							  </div>
						    
						    <div>
						     	 <a href="jobs/job-details/${job.jobId}" class="actionbtn viewJobDetailsbtn1" style=" margin-bottom: 15px;"><button class="btn viewJobDetailsbtnInside" onclick="showJobDetails(${job.jobId})" style="color: #fefefe;">Show Details</button></a>
						     	<p class="postedAtTime postedAtTime1">${timeSincePosted}</p> <!-- Corrected the variable here -->
						    </div>
						  </div> 
						</div>
			        </c:forEach>
                </div>
            </div>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab"
                tabindex="0">
                <div class="container jobPageContainer">
                   <c:forEach var="application" items="${appliedJobs}">
						  
						  	<c:set var="timeSincePosted" value="${timeSincePostedMap[job.jobId]}" />
				            <div class="card jobCardsListCard">
							  <div class="card-body jobPageCardBody">
								  <div class="detailsExceptButton">
									<h4 class="card-title jobTitle1">${application.job.jobTitle}</h4>
								    <h6 class="card-subtitle jobCompany1">${application.job.jobCompany}</h6>
								    <p class="card-text jobLocation1"><i class="bi bi-geo-alt-fill"></i> ${application.job.jobLocation}</p>
								    <div class="workSettingNType">
								    	<p class="card-text jobType">${application.job.jobType}</p> 
								    	<p class="card-text workSetting1">${application.job.workSetting}</p> 
								    </div>
								    
								  </div>
							    
							    <div>
							     	<form action="/deleteApplication" method="post">
						                <input type="hidden" name="jobId" value="${application.job.jobId}">
						                <input type="hidden" name="userId" value="${user.userId}">
						                <button type="submit" class="btn btn-outline-danger">Cancel Application</button>
						            </form>
							    </div>
							  </div> 
							</div>
			
						</c:forEach>
                </div>
            </div>
        </div>
    </div>

</body>
</html>