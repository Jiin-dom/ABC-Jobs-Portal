<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header2.jsp">
    <jsp:param value="All users" name="HTMLtitle" />
    <jsp:param value="../resources/css/zephyr.css" name="isNested" />
</jsp:include>

<div class="container">
	<table class="table table-hover my-3">
	    <thead>
	      <tr>
	        <th scope="col">#</th>
	        <th scope="col">Full Name</th>
	        <th scope="col">Email</th>
	        <th scope="col">Title</th>
	        <th scope="col">Action</th>
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
		          <a href="profile/${user.getUserId()}">Edit</a>
		          <a href="" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</a>
		          <a href="" data-bs-toggle="modal" data-bs-target="#detailModal${user.getUserId()}">Detail</a>
		        </td>
		      </tr>
		      
		      <!-- delete confirmation -->
				<div class="modal fade" id="deleteModal" style="z-index: 2000;">
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
				            <p>${user.geHeadline()}</p>
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
				            <a href="">${user.getCity()}</a>
				          </li>
				          <li class="list-group-item">
				            <h4>Country</h4>
				            <a href="">${user.getCountry()}</a>
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
</body>
</html>