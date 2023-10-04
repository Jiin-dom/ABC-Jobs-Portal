<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
<body style="background-color: #F9F7F7;">
	<jsp:include page="../header1.jsp">
	    <jsp:param value="Forgot Password" name="HTMLtitle" />
	</jsp:include>
	<div class="forgotpassword-form">
		<form action="forgotpassword" class="forgotpass1" method="post">
	        <div class="left">
	            <div class="group">
	                <div class="textgroup">
	                    <h2 class="header-email">Enter email address</h2>
	                    <p class="text-email">Your email will be used to check if you have an<br>
	                        existing account and will be sent a code.</p>
	                </div>
	                    <input type="text" class="form-control form-control-email" id="emailinput" name="email" placeholder="Enter email used to register" required>
	                    <!-- <span class="error" style="color: #FFFFFF;">error</span> <br> -->
	                    <div class="alert alert-danger ${message == null ? "d-none" : "d-block"}" role="alert">
					  		${message}
						</div>
	                <button type="submit" class="btn btn-primary btn-email">Confirm</button>
	            </div>
	        </div>
	        <div class="right">
	            <img src="/resources/images/fpimg1.png">
	        </div>
	    </form>
	</div>    
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>