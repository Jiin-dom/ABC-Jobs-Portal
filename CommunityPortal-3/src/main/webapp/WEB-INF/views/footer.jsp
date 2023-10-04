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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="resources/css/style.css"">
    
                <% if((Boolean) session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("1")) { %>
					 <link rel="stylesheet" href="resources/css/style.css">
				<% } else { %>
					 <link rel="stylesheet" href="../resources/css/style.css">
				<% } %>
				
	<style>
	footer {
    background-color: #112D4E;
    padding: 40px 0px;

}
.footerlogo{
    margin-left: 30px;
}
ul{

    list-style: none;
}

a, .last{
    text-decoration: none;
    color: #fefefe;
    font-weight: 200;
    font-size: 12px;
}
.helpcenter {
    color: #fefefe;
    font-weight: 200;
    font-size: 10px;
}
	
	</style>
</head>
<body>
	<footer>
    <div class="container container3">
        <img src="/resources/images/footerlogo.png">
        <div class="row">
            <div class="col-lg-2 col-sm-4">
                <ul>
                    <li><a href="#" class="footerhp">About</a></li>
                    <li><a href="#" class="footerhp">Community Guidelines</a></li>
                    <li><a href="#" class="footerhp">Privacy Policy</a></li>
                    <li><a href="#" class="footerhp">Safety center</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-sm-4">
                <ul>
                    <li><a href="#" class="footerhp">Accessibility</a></li>
                    <li><a href="#" class="footerhp">Careers</a></li>
                    <li><a href="#" class="footerhp">Ad Choice</a></li>
                    <li><a href="#" class="footerhp">Mobile</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-sm-4">
                <ul>
                    <li><a href="#" class="footerhp">Talent Solution</a></li>
                    <li><a href="#" class="footerhp">Market Solutions</a></li>
                    <li><a href="#" class="footerhp">Advertising</a></li>
                    <li><a href="#" class="footerhp">Small business</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-sm-4">
                <ul>
                    <li><a href="#" class="footerhp"><i class="bi bi-facebook bi-footer"></i> Facebook</a></li>
                    <li><a href="#" class="footerhp"><i class="bi bi-instagram bi-footer"></i> Instagram</a></li>
                    <li><a href="#" class="footerhp"><i class="bi bi-twitter bi-footer"></i> Twitter</a></li>
                    <li><a href="#" class="footerhp"><img src="/resources/images/coppedlogo.png"> ABC Jobs</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-sm-4">
                <ul>
                    <li><a href="#" class="footerhp"><i class="bi bi-question-circle-fill bi-footer"></i> Questions?</a></li>
                    <p class="helpcenter footerhp">Visit our Help Center</p>
                    <li><a href="#" class="footerhp"><i class="bi bi-gear-fill bi-footer"></i> Manage your account and privacy</a></li>
                    <p class="helpcenter">Go to your settings</p>
                </ul>
            </div>
            <div class="col-lg-2 col-sm-4">
                <ul>
                    <li class="last">ABC Jobs Coorporation <i class="bi bi-c-circle"></i> 2022</li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</body>
</html>