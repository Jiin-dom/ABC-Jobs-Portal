<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/job.css">
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    
    
</head>
<style>

</style>
<body>
 <jsp:include page="../header3.jsp">
		<jsp:param value="Dashboard" name="HTMLtitle" />
	</jsp:include>
	
<div class="alert alert-success alert-dismissible fade show my-3 opacity-50 ${ message == null ? " d-none" : "d-block" }" role="alert">
    ${ message }
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

	<div class="jobSearchBanner">
		    <div class="container jobSearchBannerCont">
		        <form action="" method="get" class="jobSearchBannerForm row gx-2 justify-content-center">
		            <div class="col-lg-5 col-md-6">
		                <div class="input-group jobSearchInputGroup mb-1" style="width: 100%">
		                    <span class="input-group-text" id="basic-addon1" style="font-weight: 500">What</span>
		                    <input type="text" name="jobindex" class="form-control" name="searchfield" aria-label="Username"
		                        aria-describedby="basic-addon1" placeholder="Job title, keyword, or company"
		                        value="<%= request.getParameter("jobindex") != null ? request.getParameter("jobindex") : "" %>">
		                </div>
		            </div>
		            <div class="col-lg-5 col-md-6">
		                <div class="input-group jobSearchInputGroup mb-1"  style="width: 100%">
		                    <span class="input-group-text" id="basic-addon2" style="font-weight: 500">Where</span>
		                    <input type="text" name="jobindex" class="form-control" name="searchfield" aria-label="Username"
		                        aria-describedby="basic-addon2" placeholder="Country, city, state, or keyword"
		                        value="<%= request.getParameter("jobindex") != null ? request.getParameter("jobindex") : "" %>">
		                </div>
		            </div>
		        </form>
		    </div>
		</div>

<div>
    <div class="container jobDetailsPageContainer">

        <div class="card jobDetailsCard">
            				     <div class="jobDetailsCardTop">
				    	<h4 class="card-title jobDetailsTitle">${job.jobTitle}</h4>
				        <h6 class="card-subtitle jobDetailsCompany mt-3">${job.jobCompany}</h6>
				        <p class="card-text jobDetailsLocation"><i class="bi bi-geo-alt-fill"></i> ${job.jobLocation}</p>
						<c:choose>
						    <c:when test="${applied}">
						        <!-- Display some message if the user has already applied for the job -->
						        <!-- <p>You have already applied for this job.</p> -->
						         <form action="/cancel" method="post">
						            <!-- Add other form fields here -->
						            <input type="hidden" name="userId" value="${userId}" />
						            <input type="hidden" name="jobId" value="${job.jobId}" />
						            <button type="submit" class="btn btn-danger">Cancel Application</button>
						        </form>
						    </c:when>
						    <c:otherwise>
						        <form action="/apply" method="post">
						            <!-- Add other form fields here -->
						            <input type="hidden" name="userId" value="${userId}" />
						            <input type="hidden" name="jobId" value="${job.jobId}" />
						            <button type="submit" class="btn jobApplyBtn" style="background-color: #2D77CE; color: #fefefe"
						                    ${applied ? 'disabled' : ''}>Apply</button>
						        </form>
						    </c:otherwise>
						</c:choose>

						
				    </div>
			    <div class="card-body jobDetailsCardBody p-0 pt-3">


			        <div class="jobtypeDiv">
			        	<p class="card-text jobDetailsTypeLabel"><i class="bi bi-briefcase-fill"></i> Job Type</p>
			        	<p class="card-text jobDetailsType" >${job.jobType}</p>
			        
			        </div>
			        <div class="workSetDiv">
			        	<p class="card-text jobDetailsTypeLabel"><i class="bi bi-person-fill-gear"></i> Work Setting</p>
			        	<p class="card-text jobDetailsType" >${job.workSetting}</p>			        
			        </div>
			        
			        <p class="card-text jobDetailsDesc">${jobDetails.jobDesc}</p>
			        <hr>
			         <p class="card-text resLabel">Responsibilities:</p>
			        <ul>
			            <c:forEach items="${jobDetails.jobDosAsList}" var="responsibility">
			                <li class="jobDetailsDosNQualList">${responsibility}</li>
			            </c:forEach>
			        </ul>
			        
			        <p class="card-text resLabel">Qualities:</p>
			        <ul>
			            <c:forEach items="${jobDetails.jobQualAsList}" var="quality">
			                <li class="jobDetailsDosNQualList">${quality}</li>
			            </c:forEach>
			        </ul>
			    </div>
        </div>
    </div>
</div>

</body>
</html>