 <link rel="stylesheet" href="../resources/css/header1.css">
 
 <nav class="navbar navbar-expand-sm navbar-header2">
 
 
        <div class="container navcont">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/homepage">
				<img src="/resources/images/smalllogo2.png">
            </a>
    
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="mx-ato"></div>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link nav-link-header2 <%= request.getServletPath().equals("/WEB-INF/views/search/search.jsp") ? "text-primary"
                  		: "text-black" %>" href="search"><i class="bi bi-search bi-header2"></i></a>
                  		
                  		
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/homepage" class="nav-link nav-link-header2">
                            <i class="bi bi-house-door-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/jobs" class="nav-link nav-link-header2">
                            <i class="bi bi-briefcase-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link nav-link-header2">
                            <i class="bi bi-envelope-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/applied-jobs" class="nav-link nav-link-header2">
                            <i class="bi bi-bell-fill bi-header2"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/profile-page" class="nav-link nav-link-header2">
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