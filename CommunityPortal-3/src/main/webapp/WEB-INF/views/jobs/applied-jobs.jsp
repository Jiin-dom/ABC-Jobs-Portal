<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/job.css">
</head>
<body>
    <%-- <c:forEach items="${appliedJobs}" var="jobApplication">
        <p>Job Title: ${jobApplication.job.jobTitle}</p>
        <p>Application Date: ${jobApplication.applicationDate}</p>
        <!-- Add other job details here -->
        <a href="" data-bs-toggle="modal" data-bs-target="#deleteModal${jobApplication.applicationId}" class="actionbtn" style="color: #d9534f">Delete</a>
        <hr>
        
         <!-- delete confirmation -->
				<div class="modal fade" id="deleteModal${jobApplication.applicationId}" style="z-index: 2000;">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete ${jobApplication.job.jobTitle}</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        You want to really delete this application?
				      </div>
				      <div class="modal-footer">
				        <a href="applied-jobs/${jobApplication.applicationId}" class="btn btn-outline-danger">Delete</a>
				      </div>
				    </div>
				  </div>
				</div>
    </c:forEach> --%>
    
<c:forEach var="application" items="${appliedJobs}">
    <tr>
        <td>${application.job.jobTitle}</td>
        <td>${application.job.jobCompany}</td>
        <td>${application.job.jobLocation}</td>
        <td>
            <form action="/deleteApplication" method="post">
                <input type="hidden" name="jobId" value="${application.job.jobId}">
                <input type="hidden" name="userId" value="${user.userId}">
                <button type="submit">Delete</button>
            </form>
        </td>
    </tr>
</c:forEach>

</body>
</html>