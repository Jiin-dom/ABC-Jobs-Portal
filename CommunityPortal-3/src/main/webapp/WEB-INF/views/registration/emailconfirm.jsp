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
<body style="background-color: #F9F7F7;">
<jsp:include page="../header1.jsp">
    <jsp:param value="Verification" name="HTMLtitle" />
</jsp:include>
	 <!-- <img src="images/biglogo2.png" class="logo"> -->
	 <div class="middle-emailconf">
	 <h1 class="conf-headline">Sign-up completed</h1>
    
        <div class="inner">
            <img src="/resources/images/conficon.png" class="img-emailcof">
            <p class="confirm">Thank you for choosing ABC Jobs. We've sent
                you<br>code in your email to verify your account.</p>
            <input type="password" class="form-control form-control-emailconf" id="codefield" placeholder="Enter code"><br>
            <a href="thankyou"><button type="button"class="btn-primary btn-emailconf">Continue</button></a>
        </div>
    
	 </div>
	 
 
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>