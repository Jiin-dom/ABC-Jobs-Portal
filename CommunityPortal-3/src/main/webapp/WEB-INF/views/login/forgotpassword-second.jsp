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
	    <jsp:param value="Reset" name="HTMLtitle" />
	</jsp:include>
	<div class="fpMainCont">
		<form action="forgotpassword-second" class="fpcontainer" method="post">	
        <img src="/resources/images/smalllogo (1).png" class="fp2-logo">
        <div class="group">
            <h1 class="header">Reset password</h1>
            <div class="form-group">
                <label for="pw1input" class="form-label">New password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Minimum of 6 characters" onkeyup="validatepw1()" required>
                <span class="error" id="password1-error" style="color: #FFFFFF;">error</span>
            </div>
    
            <div class="form-group">
                <label for="pw2input" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="password2" placeholder="Re-enter password" onkeyup="validatepw2()" required>
                <span class="error" id="password2-error" style="color: #FFFFFF;">error</span>
            </div>
            <div class="form-group button">
                <button type="submit" class="btn btn-primary btn3">Reset</button>
            </div>
        </div>
    </form>
	</div>
	
    <jsp:include page="../footer.jsp"></jsp:include>
    
    <script>
		var password1Error = document.getElementById('password1-error');
		var password2Error = document.getElementById('password2-error');
		
		function validatepw1() {
			var pw1 = document.getElementById('password').value;
			if(pw1 === "") {
				password1Error.style.color = '#F84F31';
				password1Error.innerHTML = 'Password is required';
				return false;
			} 
			if (pw1.length < 6) {
				password1Error.style.color = '#F84F31';
				password1Error.innerHTML = 'Must atleast have 6 characters';
				return false;
			} 
			
			if (pw1.length >= 6){
				password1Error.style.color = '#23C552';
			password1Error.innerHTML='Valid';
			return true;
			}

			password1Error.style.color = '#23C552';
			password1Error.innerHTML='Valid';
			return true;
		}
		
		function validatepw2() {
			var pw2 = document.getElementById('password2').value;
			var pw1 = document.getElementById('password').value;
			if(pw1 !="") {
				if(pw2 == pw1) {
					password2Error.style.color = '#23C552';
					password2Error.innerHTML = 'Passwords match';
					return true;
				} else {
					password2Error.style.color = '#F84F31';
					password2Error.innerHTML = 'Passwords do not match';
					return false;
				}
			}
			if (pw2 === "") {
				password2Error.style.color = '#F84F31';
				password2Error.innerHTML = 'Please confirm your password';
				return false;
			}
			
		}
</script>


</body>
</html>