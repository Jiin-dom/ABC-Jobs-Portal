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

	<jsp:include page="header1.jsp"></jsp:include>
	
	<section class="hero">
        <div class="container cont1">
            <div class="row" style="align-items: center;">
                <div class="col-md-5">
                    <h1 class="text">ABC JOBS</h1>
                    <h3 class="sub mb-3" style="font-size: xx-large;">your place, your community</h3>
                    <p class="desc">ABC Jobs is a comprehensive community jobs portal designed to connect job seekers with opportunities in their local area. 
                    </p>
                    <a href="login"><button type="button" class="btn btn-primary btn-landing">Sign in</button></a>
                    <hr style="width: 475px;">
                    <a href="register"><button type="button" class="btn btn-outline-secondary btn-landing-secondary"  >New to ABC Jobs? Create an account</button></a>

                </div>
                <div class="col-md-7">
                    <img src="/resources/images/hero.png" class="w-100">
                </div>
            </div>
        </div>
    </section>
    
    <div class="container row2" style="background-color: var(--secondary);">
        <div class="row">
            <div class="col-md-6 bot-col1">
                 <h3 class="bot-head">Why ABC Jobs?</h3>
                    <p class="bot-desc">ABC Jobs features a wide range of job categories, including health care, education, hospitality, construction, retail, and more. 
                    The portal also provides job seekers with valuable resources, such as interview tips, resume writing guidance, and career development advice.</p>
            </div>
            <div class="col-md-4 bot-col2">
                 <h2 class="bot-head2">#2</h2>
                        <p class="bot-desc"> ABC Jobs serves as a one-stop-shop for job seekers and employers alike, providing a streamlined process for connecting qualified candidates with top job opportunities in their local community.</p>                    
            </div>
        </div>
    </div>
    <div>
    <div class="container row3">
        <div class="row justify-content-between">
            <div class="col-md-4">
                <div class="card card1 landingcards" style="background-color: #E7F6F2;">
                    <img src="/resources/images/15.png" class="w-75 imgs">
                    </div>
                    <p class="imgdesc">Find peers who share the same interests, values, goals.
                        Find your people, your community.</p>
            </div>
            <div class="col-md-4">
                div class="card card3 landingcards" style="background-color: #DBE2EF;">
                        <img src="/resources/images/16.png" class="w-75 imgs">
                    </div>
                    <p class="imgdesc">Collaborate with people. Work together towards the same
                        goal and strengthen bonds.</p>
            </div>
            <div class="col-md-4">
                <div class="card landingcards" style="background-color: #BBE1FA;">
                        <img src="/resources/images/17.png" class="w-75 imgs">
                   </div>
                   <p class="imgdesc">Find life changing opportunities in just one click, Doors are 
                       open here and you hold the key.</p>
            </div>
        </div>
    </div>

            
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>