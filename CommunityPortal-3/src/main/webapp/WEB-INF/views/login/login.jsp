<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body style="background-color: #F9F7F7;">
	<jsp:include page="../header1.jsp">
    	<jsp:param value="Login" name="HTMLtitle" />
	</jsp:include>
	
	

	<div class="middle">
		<div class="login">
	        <img src="/resources/images/smalllogo (1).png" class="logo-login">
	        
	        <div class="group">
	            <h1 class="header">Welcome back!</h1>
	            
	               	<div class="alert alert-danger alert-dismissible fade show my-3 opacity-50 ${ message == null ? "d-none" : "d-block" }" role="alert">
				  		${message}
				  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
					
					<div class="alert alert-success alert-dismissible fade show my-3 opacity-50 ${ scMessage == null ? "d-none" : "d-block" }" role="alert">
				  		${ scMessage }
				  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
					
						 <script>
						       console.log("User ID: ${userId}");
						 </script>
					
			<form action="/login" method="post">
				<div class="form-group">
	                <label for="emailinput" class="form-label">Email address</label>
	                <input type="email" class="form-control form-control-login" id="emailinput" name="email" placeholder="user@example.com">
<!-- 	                <span class="error" style="color: #FFFFFF;">error</span> -->
	            </div>
	    
	            <div class="form-group">
	                <label for="passwordinput" class="form-label">Password</label>
	                <input type="password" class="form-control form-control-login" id="passwordinput" name="password" placeholder="Enter password">
	<!--                 <span class="error" style="color: #FFFFFF;">error</span> -->
	            </div>
	            <a href="forgotpassword" class="fp">Forgot password?</a>
<!-- 	             <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
            	<label class="form-check-label" for="rememberMe">Remember Me</label> -->
	            <br>
	            <button type="submit" class="btn btn-primary loginbtn">Login</button>
	            <p class="account">Already have an account? <a href="register" class="register">Sign up</a></p>
	        
			</form>
	    </div>
	        
	    </div>
	</div>
	
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>