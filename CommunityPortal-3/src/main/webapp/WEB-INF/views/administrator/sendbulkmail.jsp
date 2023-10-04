<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="../resources/css/zephyr.css">
</head>
<body>
	<jsp:include page="../header2.jsp">
		<jsp:param value="Admin Dashboard" name="HTMLtitle" />
	</jsp:include>

	<div class="container">
		<form:form action="send-bulk" method="post" modelAttribute="sendBulk">
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="subject"
					name="emailSubject"> <label for="subject">Subject</label>
			</div>
			<div class="form-floating mb-3">
				<textarea class="form-control" id="body" name="emailBody"></textarea>
				<label for="body">Body</label>
			</div>
			<button type="submit" class="btn btn-primary">Send Message
				to All</button>
		</form:form>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>