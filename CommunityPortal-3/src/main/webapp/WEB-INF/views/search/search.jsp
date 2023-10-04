<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
<body>
	<jsp:include page="../header2.jsp">
    	<jsp:param value="Search" name="HTMLtitle" />
	</jsp:include>
    <div class="container" id="cont1">
        <div class="innerCont">
            <h1 class="hdln">Find</h1>
            <p class="hdln2">your people<br>
                your community
            </p>
        </div>
        <img src="resources/images/search.png" class="searchImg">
        
    </div>
    <div class="container" id="cont2">
        <form action="" method="get" class="box">
            <i class="bi bi-search"></i>
            <input type="text" name="q" class=" form-control searchbox" name="searchfield" placeholder="Search"
            value="<%= request.getParameter("q") != null ? request.getParameter("q") : "" %>">
        </form>
    </div>
    
    <div class="container">
    	<h1 class="text-center mt-5" >${notFound == true ? "Not Found" : ""}</h1>
	   	<c:forEach var="s" items="${selected}">
	       <div class="d-flex align-items-center border mb-3 shadow-sm" style="padding: 20px 50px; border-radius: 20px; box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.2); background-color: #F2F6FF;">
	           <div>
	           	<h2>${s.getFirstName()} ${s.getLastName()}</h2>
	           	<p class="mb-0">${s.getHeadline()}</p>
	           </div>
	           <form action="result" method="post" class="ms-auto">
	                <input type="hidden" name="uId" value="${s.getUserId()}">
		           	<button type="submit" class="btn border-0 btn-primary ms-auto" style="background-color: #112D4E; color: #fefefe; font-weight: 500; border-radius: 20px;">View</button>
			   </form>
	       </div>
     	</c:forEach>
    </div>
    

    </div>
    <div class="row row3 row3-search">
        <div class="col-md-3" style=" margin-left: 7%">
            <div class="card card1 card-search searchcard" style="background-color: #E7F6F2;">
            <img src="resources/images/15.png" class="w-75 imgs imgs-search">
            </div>
            <p class="imgdesc-search">Find peers who share the same interests, values, goals.
                Find your people, your community.</p>

        </div>
        <div class="col-md-3">
            <div class="card card3 card-search searchcard" style="background-color: #DBE2EF;">
                <img src="resources/images/16.png" class="w-75 imgs imgs-search">
            </div>
            <p class="imgdesc-search">Collaborate with people. Work together towards the same
                goal and strengthen bonds.</p>
        </div>
        <div class="col-md-3" style=" margin-right: 7%">
            <div class="card card-search searchcard" style="background-color: #BBE1FA;">
                <img src="resources/images/17.png" class="w-75 imgs imgs-search">
            </div>
            <p class="imgdesc-search">Find life changing opportunities in just one click, Doors are 
                open here and you hold the key.</p>
        </div>

    </div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>