<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/job.css" rel="preload">
</head>
<body>
<jsp:include page="../header2.jsp">
    <jsp:param value="Job Postings" name="HTMLtitle" />
</jsp:include>

	<div>
		<div class="container pendingContainer">
		<h5 class="jobTableLabels">Job Postings</h5>
			<div class="tabledivApplications card tabledivApplicationsTable">
				<div class="card-body">
					<table class="table tabledivApplicationsTable">
					  <thead>
					    <tr>
					    	<th scope="col">Job Title</th>
				            <th scope="col">Company</th>
				            <th scope="col">Location</th>
				            <th scope="col">Type</th>
				            <th scope="col">Work Setting</th>
				            <th scope="col">Action</th>
					    </tr>
					  </thead>
					  <tbody>
					 		<c:forEach items="${jobs}" var="job">
						        <tr class="applicantsRow">
						        	<td class="applicantsData">${job.jobTitle}</td>
					                <td class="applicantsData">${job.jobCompany}</td>
						            <td class="applicantsData">${job.jobLocation}</td>
					                <td class="applicantsData">${job.jobType}</td>
					                <td class="applicantsData">${job.workSetting}</td>
						            <td class="applicantsData">
										<a href="" data-bs-toggle="modal" data-bs-target="#deleteModal${job.jobId}" class="actionbtn" style="color: #d9534f">Delete</a>
						                <a href="" data-bs-toggle="modal" data-bs-target="#detailModal${job.jobId}" class="actionbtn" style="color: #f0ad4e">Details</a>
				
						                
						            </td>
						        </tr>
						        
						        <!-- delete confirmation -->
								<div class="modal fade" id="deleteModal${job.jobId}" style="z-index: 2000;">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete ${job.jobTitle}</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        You want to really delete this job?
								      </div>
								      <div class="modal-footer">
								        <form action="/admin/delete-job/${job.jobId}" method="post">
					                        <button type="submit" class="btn btn-outline-danger">Delete</button>
					                    </form>
								      </div>
								    </div>
								  </div>
								</div>
								
								
								<!-- detail -->
								 <div class="modal fade" id="detailModal${job.jobId}" style="z-index: 2000;">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel">Job Details</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								      
								        <p class="card-text jobDetailsDesc">${job.jobDetails.jobDesc}</p>
								        <hr>
								         <p class="card-text resLabel">Responsibilities:</p>
								        <ul>
								            <c:forEach items="${job.jobDetails.jobDosAsList}" var="responsibility">
								                <li class="jobDetailsDosNQualList">${responsibility}</li>
								            </c:forEach>
								        </ul>
								        
								        <p class="card-text resLabel">Qualities:</p>
								        <ul>
								            <c:forEach items="${job.jobDetails.jobQualAsList}" var="quality">
								                <li class="jobDetailsDosNQualList">${quality}</li>
								            </c:forEach>
								        </ul>

								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								      </div>
								    </div>
							  	</div>
							   </div>
							</c:forEach>
					  </tbody>
					</table>
				</div>
				
			</div>
			
		</div>
	</div>


</body>
</html>