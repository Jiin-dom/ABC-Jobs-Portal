<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../resources/css/job.css">
</head>
<body style="background-color:#112D4E">
	<jsp:include page="../header2.jsp">
		<jsp:param value="Admin Dashboard" name="HTMLtitle" />
	</jsp:include>
	
	<div class="formcontainerDiv">
		<div class="container formcontainerDivInner">
			<div class="postjob1Cont1">
				<form id="form" action="post-job" method="post" class="postjobform" modelAttribute="job">
					<div class="user-details">
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Job title</span> 
							<input class="form-control" id="jobTitle" type="text" name="jobTitle" placeholder="Add the title you are hiring for" onkeyup="validatename()" required> 
							
						</div>
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Company</span> 
							<input class="form-control" id="jobCompany" type="text" name="jobCompany" placeholder="Enter company" required>
							<span class="error"></span>
						</div>
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Work Setting</span> 
							<select id="workSetting" name="workSetting" class="form-select mb-3" aria-label=".form-select-lg example" required>
							  <option selected value="On-site">On-site</option>
							  <option value="Hybrid">Hybrid</option>
							  <option value="Remote">Remote</option>
							</select>
						</div>
						
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Employee Location</span> 
							<input class="form-control" id="jobLocation" type="text" name="jobLocation" placeholder="Country or state" required> 
							
						</div>
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Job Type</span> 
							<select id="jobType" name="jobType" class="form-select mb-3" aria-label=".form-select-lg example" required>
							  <option selected value="Full-time">Full-time</option>
							  <option value="Part-time">Part-time</option>
							  <option value="Contract">Contract</option>
							  <option value="Volunteer">Volunteer</option>
							  <option value="Internship">Internship</option>
							  <option value="Other">Other</option>
							</select>
						</div>
					</div>
					
					<input type="hidden" name="jobId" value="${job.jobId}">
					<div class=button>
						<button class="button btnPOstJB1" type="submit"
							value="Continue">Continue</button>
					</div>
				</form>
			</div>
		</div>
		
	</div>
	
	

</body>

</html>