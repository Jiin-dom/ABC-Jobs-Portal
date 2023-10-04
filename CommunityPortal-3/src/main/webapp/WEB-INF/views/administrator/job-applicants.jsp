<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="/resources/css/job.css" rel="preload">
</head>
<body style="background-color: #F9F7F7">

<jsp:include page="../header2.jsp">
    <jsp:param value="Job Applications" name="HTMLtitle" />
</jsp:include>

	<div style="background-color: #F9F7F7;">
		<div class="container pendingContainer">
		<h5 class="jobTableLabels">Pending Applications</h5>
			<div class="tabledivApplications card tabledivApplicationsTable">
				<div class="card-body table-responsive">
					<table class="table tabledivApplicationsTable">
					  <thead>
					    <tr>
					    	<th scope="col" class="tableAdminApplicationsHeader">First Name</th>
				            <th scope="col"  class="tableAdminApplicationsHeader">Last Name</th>
				            <th scope="col" class="tableAdminApplicationsHeader">Email</th>
				            <th scope="col" class="tableAdminApplicationsHeader">Job Title</th>
				            <th scope="col" class="tableAdminApplicationsHeader">Company</th>
				            <th scope="col" class="tableAdminApplicationsHeader">Application Date</th>
				            <th scope="col" class="tableAdminApplicationsHeader">Action</th>
					    </tr>
					  </thead>
					  <tbody>
					 		<c:forEach items="${jobApplications}" var="jobApplication">
							    <c:if test="${not empty jobApplication and not jobApplication.approved}">
							        <tr class="applicantsRow">
							        	<td class="applicantsData">${jobApplication.userId.userDetails.firstName}</td>
						                <td class="applicantsData">${jobApplication.userId.userDetails.lastName}</td>
							            <td class="applicantsData">${jobApplication.userId.email}</td>
						                <td class="applicantsData">${jobApplication.job.jobTitle}</td>
						                <td class="applicantsData">${jobApplication.job.jobCompany}</td>
						                <td class="applicantsData">${jobApplication.applicationDate}</td>
							            <td class="applicantsData  applicantsDataAction">
							                <form action="/admin/approve" method="post">
							                	<input type="hidden" name="applicationId" value="${jobApplication.applicationId}" />
							                    <input type="hidden" name="userId" value="${jobApplication.userId.userId}" />
							                    <input type="hidden" name="jobTitle" value="${jobApplication.job.jobTitle}" />
							                    <button class="approveApplicationBtn" type="submit" value="Approve">Approve</button>
							                    
							                </form>
							                <a href="" data-bs-toggle="modal" data-bs-target="#deleteModal${jobApplication.applicationId}"><button class="deleteApplicationBtn" type="button" value="Cancel">Cancel</button></a>
							                
							            </td>
							        </tr>
							        
							         <!-- delete confirmation -->
									<div class="modal fade" id="deleteModal${jobApplication.applicationId}" style="z-index: 2000;">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete application?</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        You want to really delete this job application of ${jobApplication.userId.userDetails.firstName} ${jobApplication.userId.userDetails.lastName} for ${jobApplication.job.jobTitle} position in ${jobApplication.job.jobCompany}?
									      </div>
									      <div class="modal-footer">
									        <form action="/admin/delete-job-application/${jobApplication.applicationId}" method="post">
						                        <button type="submit" class="btn btn-outline-danger">Delete</button>
						                    </form>
									      </div>
									    </div>
									  </div>
									</div>
							    </c:if>
							</c:forEach>
					  </tbody>
					</table>
				</div>
				
			</div>
			
		</div>
		
		<div class="container approvedContainer">
			<h5>Approved Applications</h5>
			<div class="row tableDivApprovedRow">
				<div class="col col-9 " id="tableDivApprovedCol">
					<div class="tableDivApproved card">
						<div class="card-body table-responsive">
							<table class="table tableDivApprovedTable">
							  <thead>
							    <tr>
							    	<th scope="col" class="tableAdminApplicationsHeader">Name</th>
						            <th scope="col" class="tableAdminApplicationsHeader">User Email</th>
						            <th scope="col" class="tableAdminApplicationsHeader">Job Title</th>
						            <th scope="col" class="tableAdminApplicationsHeader">Company</th>
						            <th scope="col" class="tableAdminApplicationsHeader">Application Date</th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:forEach items="${jobApplications}" var="jobApplication">
						            <c:if test="${jobApplication.approved}">
						                <tr>
						                	<td class="applicantsData">${jobApplication.userId.userDetails.firstName} ${jobApplication.userId.userDetails.lastName}</td>
						                    <td class="applicantsData">${jobApplication.userId.email}</td>			                 
						                    <td class="applicantsData">${jobApplication.job.jobTitle}</td>
						                    <td class="applicantsData">${jobApplication.job.jobCompany}</td>
						                    <td class="applicantsData">${jobApplication.applicationDate}</td>
						                </tr>
						            </c:if>
						        </c:forEach>
							  </tbody>
							</table>
						</div>
						
						
					</div>	
				</div>
				
				<!-- </div> -->
				<div class="col col-3">
					<div class="totalApplicationNApprovedDiv">
						<div class="card totalPendingCard">
							<div class="cardBody">
								<h4>Total Approved</h4>
								<p>Numberr</p>
							</div>
						</div>
						<div class="card totalApprovedCard">
							<div class="cardBody">
								<h4>Total Approved</h4>
								<p>Numberr</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		
		
	</div>
	</div>

 
 
 
 
</body>
</html>