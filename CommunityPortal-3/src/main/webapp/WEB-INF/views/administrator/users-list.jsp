<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ABC Jobs | Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resources/css/style.css">
    
    <style>
 #all-usersbanner{
     background-color: #F2F6FF;
    display: flex;
	padding: 20px 0px;
    border-radius: 40px;
    margin-top: 20px;
    margin-bottom: 30px;
        box-shadow: 0px 1px 5px rgba(0, 0, 0, 0.2);
 }
 .innerCont{
        display: flex;
    align-items: center;
/*     padding: 40px 0px; */
}
.hdln{
    font-size: 90px;
    color: #112D4E;
    font-weight: 500;
    margin-left: 13%;
    margin-right: 5px;
}
.hdln2{
	margin-top: 25px;
    font-size: 32px;
    font-weight: 400 ;
    line-height:110%;
}
.searchImg{
    margin-left: 30px;
}

.table-container{
	margin-bottom: 120px;
}

.actionbtn{
/* padding: 10px 20px;
background-color:#2D77CE; 
color: #ffff; */
text-decoration: none;
font-size: 16px;
font-weight: 500;
margin-right: 30px;
/* border-radius: 20px; */
}

th, td {
  padding: 15px;
}

table{
padding: none;
width: 100%
}
    </style>
</head>
<body>
<jsp:include page="../header2.jsp">
    <jsp:param value="User list" name="HTMLtitle" />
</jsp:include>
    <div class="container" id="all-usersbanner">
        <div class="innerCont">
            <h1 class="hdln">Administer</h1>
            <p class="hdln2">people<br>
                data
            </p>
        </div>
        <img src="../resources/images/adminbanner.png" class="searchImg">
        
    </div>
<div class="container table-container">
	<table class="table table-hover">
<!-- 	<table class="table table-hover my-3"> -->
	    <thead>
	      <tr style="background-color: #112D4E; color: #ffff; border-top-left-radius: 10px; border-top-right-radius: 10px; ">
	        <th scope="col">#</th>
	        <th scope="col">Full Name</th>
	        <th scope="col">Email</th>
	        <th scope="col">Title</th>
	        <th scope="col" style="width: 20%">Action</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<% int i = 1; %>
		   	<c:forEach var="user" items="${users}">
	   		  <tr>
		        <th scope="row"><%= i++ %></th>
		        <td>${user.getFirstName()} ${user.getLastName()}</td>
		        <td>${user.getUser().getEmail()}</td>
		        <td>${user.getHeadline() == null ? "-" : user.getHeadline()}</td>
		        <td>
		          <a href="profile/${user.getUserId()}" class="actionbtn" style="color: #2D77CE">Edit</a>
		          <%-- <a href="" data-bs-toggle="modal" data-bs-target="#deleteModal${user.getUserId()}" class="actionbtn" style="color: #d9534f">Delete</a> --%>
		          <a href="" data-bs-toggle="modal" data-bs-target="#deleteModal${user.getUserId()}" class="actionbtn" style="color: #d9534f">Delete</a>
		          <a href="" data-bs-toggle="modal" data-bs-target="#detailModal${user.getUserId()}" class="actionbtn" style="color: #f0ad4e">Details</a>
		        </td>
		      </tr>
		      
		      <!-- delete confirmation -->
				<div class="modal fade" id="deleteModal${user.getUserId()}" style="z-index: 2000;">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete ${user.getFirstName()}</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        You want to really delete this user?
				      </div>
				      <div class="modal-footer">
				        <a href="delete/${user.getUserId()}" class="btn btn-outline-danger">Delete</a>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- detail -->
				 <div class="modal fade" id="detailModal${user.getUserId()}" style="z-index: 2000;">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Detail</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <ul class="list-group list-group-flush">
				          <li class="list-group-item">
				            <h4>First Name</h4>
				            <p>${user.getFirstName()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Last Name</h4>
				            <p>${user.getLastName()}</p>
				          </li>
<%-- 				          <li class="list-group-item">
				            <h4>City</h4>
				            <c:forEach var="c" items="${cities}">
		            			<p>
		            				${user.getCityId().equals(c.getCityId().toString()) ? c.getCountry().getCountryName() : "" }
	            			 	</p>
				            </c:forEach>
				            <c:forEach var="c" items="${cities}">
		            			<p>
		            				${user.getCity().equals(c.getCity().toString()) ? c.getCountry().getCountry() : "" }
	            			 	</p>
				            </c:forEach>
				          </li> --%>
				          <li class="list-group-item">
				            <h4>Headline</h4>
				            <p>${user.getHeadline()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>About</h4>
				            <p>${user.getAbout()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Phone</h4>
				            <p>${user.getPhone()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Company</h4>
				            <p>${user.getCompany()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>City</h4>
				            <p>${user.getCity()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Country</h4>
				            <p>${user.getCountry()}</p>
				          </li>
				        </ul>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
			  	</div>
			   </div>
		   	</c:forEach>
	    </tbody>
	  </table>
</div>

	      <jsp:include page="../footer.jsp">
	      	<jsp:param value="../resources/css/style.css" name="isNested" />
	      </jsp:include>
</body>
</html>