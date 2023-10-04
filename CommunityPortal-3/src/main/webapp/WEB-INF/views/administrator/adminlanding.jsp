<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/style.css">
<style>
#all-usersbanner {
	background-color: #F2F6FF;
	display: flex;
	padding: 20px 0px;
	border-radius: 40px;
	margin-top: 20px;
	margin-bottom: 30px;
	box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.2);
}

.innerCont {
	display: flex;
	align-items: center;
	/*     padding: 40px 0px; */
}

.hdln {
	font-size: 90px;
	color: #112D4E;
	font-weight: 500;
	margin-left: 13%;
	margin-right: 5px;
}

.hdln2 {
	margin-top: 25px;
	font-size: 32px;
	font-weight: 400;
	line-height: 110%;
}

.searchImg {
	margin-left: 30px;
}

.body-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0px;
	flex-direction: column;
	padding: 50px 0px;
	margin-bottom: 100px;
}
</style>
</head>
<body>
	<jsp:include page="../header2.jsp">
		<jsp:param value="Admin Dashboard" name="HTMLtitle" />
	</jsp:include>

	<div class="alert alert-danger alert-dismissible fade show my-3 opacity-50 ${ message == null ? " d-none" : "d-block" }" role="alert">
		${ errMsg }
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>


	<div class="container" id="all-usersbanner">
		<div class="innerCont">
			<h1 class="hdln">Administer</h1>
			<p class="hdln2">
				people<br> data
			</p>
		</div>
		<img src="/resources/images/adminbanner.png" class="searchImg">

	</div>

	<div class="container body-container">
		<h1>Welcome back, ${adminName}</h1>
		<div style="margin-top: 20px;">
			<a href="admin/send-bulk" class="btn btn-outline-primary">Send
				bulk email</a>
			<!-- 	  <a href="admin/send-bulk" class="btn btn-outline-primary">Send bulk email</a> -->
			<a href="admin/all-users" class="btn btn-outline-primary">Show
				all users</a>
			<a href="/admin/all-jobs" class="btn btn-outline-primary">Job Postings</a>
			<a href="/admin/post-job" class="btn btn-outline-primary">Post Job</a>
			<a href="/admin/jobApplications" class="btn btn-outline-primary">Applications</a>
		</div>

	</div>


	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>