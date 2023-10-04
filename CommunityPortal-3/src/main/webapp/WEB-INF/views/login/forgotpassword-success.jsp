<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<jsp:include page="../header2.jsp">
    	<jsp:param value="Verified" name="HTMLtitle" />
	</jsp:include>
	
	<div class="successCont">
        <img src="/resources/images/smalllogo (1).png"><br>
        <img src="/resources/images/fpsuccess.png"  class="resetLogo">
        <h2 class="headlineReset">Reset Successful</h2>
        <p class="fpdesc">You can now use your new password to log in to<br>
            your account 🙌</p>
        <a href="login"><button type="button" class="btn btn-primary btn4">Login</button></a>
    </div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>