<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="/resources/css/form.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div>
		<img src="/resources/images/logo (1).png" class="logo">
	</div>
	<h1 class="headline">Find your people, your community</h1>
	<div class="container">
		<form id="form" action="register" method="post" class="regform1" modelAttribute="register">
			<div class="user-details">
				<div class="input-box">
					<span class="details">First name</span> <input id="fname"
						type="text" name="fname" placeholder="Enter your first name"
						onkeyup="validatename()" required> <span id="fname-error"
						class="error">helo</span>
				</div>
				<div class="input-box">
					<span class="details">Last name</span> <input id="lname"
						type="text" name="lname" placeholder="Enter your last name">
					<span class="error"></span>
				</div>
				<div class="input-box">
					<span class="details">Email</span> <input id="email" type="text"
						name="email" placeholder="Enter your email"
						onkeyup="validateemail()" required> <span id="email-error"
						class="error">helo</span>
				</div>
				<div class="input-box">
					<span class="details">Phone</span> <input id="phone" type="text"
						name="phone" placeholder="Enter your phone number"
						onkeyup="validatecontact()" required> <span
						id="phone-error" class="error">helo</span>
				</div>
				<div class="input-box">
					<span class="details">Password</span> <input id="password1"
						type="password" name="password"
						placeholder="Minimum of 6 characters" onkeyup="validatepw1()"
						required> <span id="password1-error" class="error">helo</span>
				</div>

				<div class="input-box">
					<span class="details">Confirm Password</span> <input id="password2"
						type="password" name="confpassword"
						placeholder="Confirm your password" onkeyup="validatepw2()"
						required> <span id="password2-error" class="error">helo</span>
				</div>
			</div>
			<div class=button>
				<button class="button" id="btnSubmit" type="submit"
					value="Agree & Join">Agree & Join</button>
			</div>
			<div class="agreeNjoin">
				<p class="desc">
					By clicking, you agree to the ABC Jobs' <a href="#"> User
						Agreement,</a> <a href="#">Privacy Policy</a>, sand <a href="#">Cookie
						Policy</a>
				</p>
			</div>
			<div class="bottom">
				<p class="account">
					Already have an account? <a href="login">Log in</a>
				</p>
			</div>
		</form>
	</div>
	<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>

	<script>
		var nameError = document.getElementById('fname-error');
		var emailError = document.getElementById('email-error');
		var phoneError = document.getElementById('phone-error');
		var password1Error = document.getElementById('password1-error');
		var password2Error = document.getElementById('password2-error');

		//NAME VALIDATION
		function validatename() {
			var name1 = document.getElementById('fname').value;

			if (name1.length == 0) {
				nameError.innerHTML = 'First name is required';
				nameError.style.color = '#F84F31';
				return false;
			}

			nameError.innerHTML = 'Valid';
			nameError.style.color = '#23C552';
			return true;
		}

		//EMAIL VALIDATION
		function validateemail() {
			var email1 = document.getElementById('email').value;
			if (email1.length == 0) {
				emailError.innerHTML = 'Email is required';
				emailError.style.color = '#F84F31';
				return false;
			}

			if (!email1.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)) {
				emailError.innerHTML = 'Enter valid email';
				emailError.style.color = '#F84F31';
				return false;
			}
			emailError.innerHTML = 'Valid';
			emailError.style.color = '#23C552';
			return true;
		}

		//CONTACT  VALIDATION

		function validatecontact() {
			var contact1 = document.getElementById('phone').value;
			if (contact1 === "") {
				phoneError.style.color = '#F84F31';
				phoneError.innerHTML = 'Phone no. is required';
				return false;
			}

			if (contact1.length < 11) {
				phoneError.style.color = '#F84F31';
				phoneError.innerHTML = 'Phone no. should have 11 digits';
				return false;
			}

			if (!contact1.match(/^[0-9]{11}$/)) {
				phoneError.style.color = '#F84F31';
				phoneError.innerHTML = 'Only digits please';
				return false;
			}
			phoneError.innerHTML = 'Valid';
			phoneError.style.color = '#23C552';
			return true;
		}

		function validatepw1() {
			var pw1 = document.getElementById('password1').value;
			if (pw1 === "") {
				password1Error.style.color = '#F84F31';
				password1Error.innerHTML = 'Password is required';
				return false;
			}
			if (pw1.length < 6) {
				password1Error.style.color = '#F84F31';
				password1Error.innerHTML = 'Must atleast have 6 characters';
				return false;
			}
			if (pw1.length >= 6) {
				password1Error.style.color = '#23C552';
				password1Error.innerHTML = 'Valid';
				return true;
			}
			password1Error.style.color = '#23C552';
			password1Error.innerHTML = 'Valid';
			return true;
		}

		function validatepw2() {
			var pw2 = document.getElementById('password2').value;
			var pw1 = document.getElementById('password1').value;
			if (pw1 != "") {
				if (pw2 == pw1) {
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