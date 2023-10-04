<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
	<jsp:include page="../header2.jsp">
		<jsp:param value="Admin Dashboard" name="HTMLtitle" />
	</jsp:include>
	
	<div class="formcontainerDiv">
		<div class="container formcontainerDivInner2">
			<div class="postjob1Cont2">
				<form id="form" action="post-job2" method="post" class="postjobform" modelAttribute="jobDetails">
					<div class="user-details">
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Description</span> 
							<textarea class="form-control" id="jobDesc" name="jobDesc" placeholder="Job description"></textarea> 
						</div>
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Responsibilities</span> 
							<textarea class="form-control" id="jobDos" name="jobDos" placeholder="Enter employee responsibilities" required></textarea>
						</div>
						<div class="input-box inputbxPOstJB1">
							<span class="details detailsPOstJB1">Qualities</span> 
							<textarea class="form-control" id="jobQual" name="jobQual" placeholder="Enter employee qualites" required></textarea>
						</div>
					</div>
					
					<input type="hidden" name="jobId" value="${jobDetails.jobId}">
					
					<div class=button>

						<button class="button btnPOstJB2"
							value="Previous">Previous</button>
						<button class="button btnPOstJB1" type="submit"
							value="Continue">Continue</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	

</body>
</html>