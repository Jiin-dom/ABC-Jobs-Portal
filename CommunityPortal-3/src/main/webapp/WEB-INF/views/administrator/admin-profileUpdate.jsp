<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href=".../resources/css/style.css">
                    <% if((Boolean) session.getAttribute("isLogin") != null && session.getAttribute("roleId").toString().equals("1")) { %>
					 <link rel="stylesheet" href="/resources/css/style.css">
				<% } else { %>
					 <link rel="stylesheet" href="resources/css/style.css">
				<% } %>
				
	<style>
.navbar{
    box-shadow: 0px -1px 5px rgba(0, 0, 0, 0.2);
}
/* .nav-item{
    color:#112D4E;
    display: flex;
    flex-direction: columns;
    text-align: center;
} */
.nav-link{
    color:#2D77CE;
    margin-left: 50px;
}
.bi-footer{
    font-size: 12px;
}
.cont1{
    padding: 30px 0px 50px 0px;
}

.btn-landing, .btn-landing-secondary{
    border-radius: 40px;
    width: 475px;
    padding: 15px 0px;
    font-size: large;
}
.btn-landing{
    background-color: var(--primary);
}

.btn-landing-secondary{
    border: 1px solid var(--sub-head);
    color: var(--sub-head)

}
.btn-landing-secondary:hover{
    border: 1px solid var(--primary);
    background-color: var(--primary);
    color: #fefefe;
}

.text, .text-email{
    font-size: 70px;
    font-weight: 600;
    color: var(--secondary);
    margin-bottom: 0;
}

.sub{
    font-size: xx-large;
    font-weight: 400;
}
.desc{
    color: var(--sub-head);
    font-weight: 200;
}

.row2 {
    background-color: #2D77CE;
    color:#fefefe;
    padding: 40px 0px;
} 

.bot-head{
    font-weight: 300;
    font-size: 40px;
}
.bot-head2 {
    font-weight: 300;
    font-size: 50px;
}

.bot-desc{
    font-weight: 200;
    font-size: 14px;
}
.bot-col1 {
    margin-left: 7%;
    margin-right: 2%;
}

.card {
    border: none;
    align-items: center;
    border-radius: 20px;
 /* height: 175px;
  width: 350px; */
}
.imgs{
margin-top:15px;
margin-bottom: -40px;
}

.imgdesc {
    margin-top: 45px;
    color: #fefefe;
    font-weight: 200;
    font-size: 14px;
    text-align: center;
}

.row3{
padding-bottom: 40px;
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
footer {
    background-color: var(--secondary);
}
.footerlogo{
    margin-left: 30px;
}
ul{

    list-style: none;
}

.last{
    text-decoration: none;
/*     color: #fefefe; */
    font-weight: 200;
    font-size: 12px;
}
.helpcenter {
    color: #fefefe;
    font-weight: 200;
    font-size: 10px;
}

.editfield{
    margin-top: 50px;
    margin-bottom: 50px;
    width: 700px;
    background-color: #ffff;
    box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    padding: 25px 35px;
    border-radius: 20px;
    /* height: 600px; */
    overflow: hidden;
    /* overflow-y: scroll; */
    /* padding: 0px 20px 0px 0px; */


}
/* .forms{


} */
.toppart{
    display: flex;
    justify-content: space-between;
    position: sticky;
}
.editheadline{
    font-weight: 500;
    font-size: 30px;
}
.form-label-updateprofile{
    font-weight: 400;
    font-size: 16px;
}
.group-label{
    font-weight: 500;
    font-size: 20px;
}
.group{
    margin-bottom: 40px;
}
.form-group{
    margin-bottom: 20px;
}
.form-control-updateprofile{
    border: 1px solid #797979;
}
.form-control-updateprofile:focus{
    border: 1px solid #797979;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.0), 0 0 8px rgba(0, 0, 0, 0);
}
.btn-updateprofile{
    background-color: #112D4E;
    color: #fefefe;
    font-weight: 500;
    margin-top: 20px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 20px;
    margin-left: 88%;
}
.bottomOf-profile{
    margin-bottom: 50px;
    background-color: #ffff;
}
.bottomOf-profile{
	padding: 20px 40px;
	border: 1px solid #D7D7D7;
	border-radius: 20px;
	 box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.2);
}
.addopt{
	text-align: center;
	display: flex;
	text-align: center;
	justify-content: center;
	color: var(--sub-head);
	margin: 0px;
	padding: 0px;
	
}
.p-bottom{
	margin-bottom: 0px;
}
	</style>
</head>
<body style="background-color: #F9F7F7;">

<jsp:include page="../header2.jsp">
    <jsp:param value="User Profile" name="HTMLtitle" />

</jsp:include>
<div class="container" >
    	<form action="profile" class="forms" method="post" modelAttribute="profile" style="display: flex; margin-top: 50px;">
    	<input type="hidden" name="userDetailsId" value="${id}">
	        <div class="left editfield" style="width: 700px; margin-top: 0;">
	            <div class="toppart">
	                <h1 class="editheadline">Edit details</h1>
	                <a href="profile"><i class="bi bi-x-lg bi-editwndw-close"></i></a>
	            </div>
	            <hr>
	    
	            <!-- <form action="profile" class="forms" method="post" modelAttribute="profile"> -->
	            <div class="images group">
	                <h3 class="group-label">Images</h3>
	                <div class="form-group">
	                    <label for="header" class="form-label form-label-updateprofile">Header</label>
	                    <input type="file" id="header" class="form-control form-control-updateprofile">
	                </div>
	                <div class="form-group">
	                    <label for="profile" class="form-label form-label-updateprofile">Profile picture</label>
	                    <input type="file" id="profile" class="form-control form-control-updateprofile">
	                </div>
	            </div>
        
                <div class="primary group">
                    <h3 class="group-label">Primary details</h3>
                    <div class="form-group">
                        <label for="fname" class="form-label form-label-updateprofile">First name</label>
                        <input type="text" id="firstName" name="firstName" class="form-control form-control-updateprofile" value="${firstName}" required>
                    </div>
                    <div class="form-group">
                        <label for="profile" class="form-label form-label-updateprofile">Last name</label>
                        <input type="text" id="lastName" name="lastName" class="form-control form-control-updateprofile" value="${lastName}">
                    </div>
                    <div class="form-group">
                        <label for="headline" class="form-label form-label-updateprofile">Headline/Job</label>
                        <input type="text" id="headline" name="headline" class="form-control form-control-updateprofile" value="${headline}">
                    </div>
                </div>
                <div class="locations group">
                    <h3 class="group-label">Location</h3>
                    <div class="form-group">
                        <label for="country" class="form-label form-label-updateprofile">Country</label>
                        <input type="text" id="country" name="country" class="form-control form-control-updateprofile" value="${country}">
                    </div>
                    <div class="form-group">
                        <label for="city" class="form-label form-label-updateprofile">City</label>
                        <input type="text" id="city" name="city" class="form-control form-control-updateprofile" value="${city}">
                    </div>
                </div>
                <div class="contact group">
                    <h3 class="group-label">Contact Info</h3>
                    <div class="form-group">
                        <label for="email" class="form-label form-label-updateprofile">Email</label>
                        <input type="text" id="email" name="email" class="form-control form-control-updateprofile" value="${email}" required>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="form-label form-label-updateprofile">Phone number</label>
                        <input type="text" id="phone" name="phone" class="form-control form-control-updateprofile" value="${phone}">
                    </div>
                </div>
                <div class="save">
                    <button type="submit" class="btn btn-primary btn-updateprofile" style="border: none;">Save</button>
                </div>
            
            </div> 


         <div class="right" style="margin-left: 50px;">
            <div class="mb-4 bottomOf-profile"  style="width: 500px;">
                <h3>About</h3>
                
                <p>${about}</p>
                <hr>
                <div class="add-about addopt" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="bi bi-plus-square"></i><p class="p-bottom"> Add about</p>
                </div>
            </div>
            
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">About</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <textarea class="form-control" name="about" id="about" placeholder="Type here"></textarea>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-primary">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
			
            <div class=" mb-4 bottomOf-profile " style="width: 500px;">
                <h3>Education</h3>
                <c:forEach var="e" items="${ed}">
                    <div class="d-flex align-items-center">
                        <i class='bx bx-book fs-2'></i>
                        <div class="p-3">
                            <h4>${e.getEducationName()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
                            <small>${e.getIntitutionName()}</small>
                        </div>
                    </div>
                </c:forEach>
                <hr>
                <!-- <div class="add-educ addopt" data-bs-toggle="modal" data-bs-target="#educations"> -->
                <div class="add-educ addopt" data-bs-toggle="modal" data-bs-target="#educations">
                    <i class="bi bi-plus-square"></i><p class="p-bottom"> Add education</p>
                </div>                 
            </div>
            
            <div>
             <div class="d-flex">
<!--                  <h3>Education</h3>
                 <button type="button" class="btn btn-primary ms-auto" data-bs-toggle="modal"
                     data-bs-target="#educations">
                     Add Education
                 </button> -->
                 <!-- <form action="educ" method="post"> -->
                 <div class="modal fade" id="educations" tabindex="-1" aria-labelledby="educationsLabel"
                     aria-hidden="true">
                     <div class="modal-dialog">
                         <div class="modal-content">
                             <div class="modal-header">
                                 <h1 class="modal-title fs-5" id="educationsLabel">Add Education</h1>
                                 <button type="button" class="btn-close" data-bs-dismiss="modal"
                                     aria-label="Close"></button>
                             </div>
                             <div class="modal-body">
                                 <div class="form-floating mb-3">
                                     <input type="text" class="form-control" id="intitutionName"
                                         name="intitutionName">
                                     <label for="intitutionName">Institution Name</label>
                                 </div>
                                 <div class="form-floating mb-3">
                                     <input type="date" class="form-control" id="startDateED"
                                         name="startDateED">
                                     <label for="startDateED">Start Date</label>
                                 </div>
                                 <div class="form-floating mb-3">
                                     <input type="date" class="form-control" id="endDateED" name="endDateED">
                                     <label for="endDateED">End Date</label>
                                 </div>
                                 <div class="form-floating mb-3">
                                     <input type="text" class="form-control" id="educationName"
                                         name="educationName">
                                     <label for="educationName">Education Name</label>
                                 </div>
                             </div>
                             <div class="modal-footer">
                                 <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                     id="edBtn">Add</button>
                             </div>
                         </div>
                     </div>
                    
                 </div>
				<!-- </form> -->
             </div>
             
             <!-- <div id="educationsMD"></div>
             <c:forEach var="e" items="${ed}">
                 <div class="d-flex align-items-center">
                     <i class='bx bx-map-pin fs-2'></i>
                     <div class="p-3">
                         <h4>${e.getEducationName()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
                         <small>${e.getIntitutionName()}</small>
                     </div>
                 </div>
             </c:forEach> -->
         </div>

            <div class="mb-4 bottomOf-profile  educ-last" style="width: 500px">
                <h3>Experience</h3>
                
                <div id="experiencesMD"></div>
                        <% int i = 0; %>
                        <c:forEach var="e" items="${ex}">
                        	<% i = i + 1; %>
                            <div class="c-ibc d-flex align-items-center border position-relative border mb-3 rounded-3 px-2">
                                <i class='bx bx-map-pin fs-2'></i>
                                <div class="p-3">
                                    <h4>${e.getPosition()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
                                    <small>${e.getCompany()}</small>
                                </div>
                                <div class="interactive-bc">
								  	<button type="button" class="button-card-hover text-primary" data-bs-toggle="modal" data-bs-target="#ex<%= i %>"><i class='bx bx-pencil'></i></button>
								  	<button type="button" class="button-card-hover text-danger"><i class='bx bx-trash'></i></button>
								</div>
                            </div>
                            
                            <!-- Edit -->
							<div class="modal fade" id="ex<%= i %>" tabindex="-1">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button type="button" class="btn btn-primary">Save changes</button>
							      </div>
							    </div>
							  </div>
							</div>
                            
                        </c:forEach>
                <hr>
                <div class="add-exp addopt" data-bs-toggle="modal"
                        data-bs-target="#experiences">
                    <i class="bi bi-plus-square" ></i><p class="p-bottom"> Add experience</p>
                </div>
            </div>
         </div>
         <div class="modal fade" id="experiences" tabindex="-1" aria-labelledby="experiencesLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="experiencesLabel">Add Experience</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="position" name="position">
                                                <label for="position">Position</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="startDateEX"
                                                    name="startDateEX">
                                                <label for="startDateEX">Start Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="endDateEX" name="endDateEX">
                                                <label for="endDateEX">End Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="companyNameEX"
                                                    name="companyNameEX">
                                                <label for="companyNameEX">Company Name</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal"
                                                id="exBtn">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
         </form>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>