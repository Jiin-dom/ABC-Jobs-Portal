<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>
	 <nav class="navbar navbar-light navbar-expand-sm bg-light">
        <div class="container">
            <a href="/" class="navbar-brand <%= request.getServletPath().equals("/WEB-INF/views/landing.jsp")%>">
                <img class="d-inline-block align-top" src="/resources/images/smalllogo2.png">
            </a>
    
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="mx-ato"></div>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <!-- <a href="search" class="nav-link">Search</a> -->
                        <a class="nav-link <%= request.getServletPath().equals("/WEB-INF/views/search/search.jsp") ? "text-primary"
                  : "text-black" %>" href="search">Search</a>
                    </li>
                    <li class="nav-item ms-4">
                        <a href="register" class="nav-link <%= request.getServletPath().equals("/WEB-INF/views/search/search.jsp") ? "text-primary"
                  : "text-black" %>">
                            Sign up
                        </a>
                    </li>
                </ul>
    
            </div>
        </div>
            
        </nav>
</body>
</html>