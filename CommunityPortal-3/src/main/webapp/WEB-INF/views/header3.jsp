<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%--     <%@ page import="com.Assignment3.be --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>ABC Jobs | <%= request.getParameter("HTMLtitle") !=null ? request.getParameter("HTMLtitle")
          : "Assignment 2" %>
      </title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <style>
    	.nav-link-header2{
    	color:#2D77CE;
    	}
    	
    	.navbar-header2{
    box-shadow: 0px -1px 5px rgba(0, 0, 0, 0.2);
}
/* .nav-item{
    color:#112D4E;
    display: flex;
    flex-direction: columns;
    text-align: center;
} */
.nav-link-header2{
    color:#2D77CE;
    margin-left: 50px;
}
.bi-header2{
    font-size: 24px;
}
.dropdowm-menu{
	display: block
}
    	
    </style>

</head>
<body>
 <nav class="navbar navbar-expand-sm navbar-header2" style="background-color:#fffff;">
        <div class="container navcont">
            <a class="navbar-brand <%= request.getServletPath().equals("/WEB-INF/views/landing.jsp")%>">
				<img src="/resources/images/smalllogo2.png">
            </a>
    
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="mx-ato"></div>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link nav-link-header2 <%= request.getServletPath().equals("/WEB-INF/views/search/search.jsp") ? "text-primary"
                  		: "text-black" %>" href="search" style="color:#2D77CE"><i class="bi bi-search bi-header2"></i></a>
                  		
                  		
                    </li>
                    <li class="nav-item">
                        <a href="/homepage" class="nav-link nav-link-header2" style="color:#2D77CE">
                            <i class="bi bi-house-door-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/jobs" class="nav-link nav-link-header2" style="color:#2D77CE">
                            <i class="bi bi-briefcase-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link nav-link-header2" style="color:#2D77CE">
                            <i class="bi bi-envelope-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/applied-jobs" class="nav-link nav-link-header2" style="color:#2D77CE">
                            <i class="bi bi-bell-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/profile-page" class="nav-link nav-link-header2" style="color:#2D77CE">
                            <i class="bi bi-person-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
               	      <% if( (Boolean) session.getAttribute("isLogin") != null) { %>
						<a href="<%= request.getContextPath() %>/logout"
							class="btn nav-link nav-link-header2 px-3 logoutbtninHeader">Log out</a>
						<% } else { %>
						<a href="<%= request.getContextPath() %>/login"
							class="btn btn-outline-primary nav-link-header2" style="margin-top: 8px; border-radius: 20px;" <%= request.getServletPath().equals("/WEB-INF/views/dashboard/dashboard.jsp") ? "d-none" : "" %>>Log in</a>
						<a href="<%= request.getContextPath() %>/register"
							class="btn btn-primary ms-auto <%= request.getServletPath().equals("/WEB-INF/views/landing.jsp") ? "d-none" : "" %>" style="margin-top: 6px; border-radius: 20px;">Register</a>
						<% } %>
				                
	                </li>
                     <% if((Boolean) session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("1")) { %>
				        <li class="nav-item">
				          <a class="nav-link fw-semibold nav-link-header2<%= request.getServletPath().equals("/WEB-INF/views/administrator/adminlanding.jsp") ? "text-primary border-bottom border-3 border-primary" : request.getServletPath().equals("/WEB-INF/views/landing.jsp") ? "text-white" : "text-dark border-bottom border-3  border-white" %>" href="<%= request.getContextPath() %>/admin" style="margin-top: 6px">Admin</a>
				        </li>
				      <% } %>
	          </ul>
            </div>
        </div> 
        </nav>
</body>
</html>