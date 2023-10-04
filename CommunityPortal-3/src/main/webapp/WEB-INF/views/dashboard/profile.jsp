<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body style="background-color: #F9F7F7;">
    <jsp:include page="../header2.jsp">
        <jsp:param value="Profile" name="HTMLtitle" />
    </jsp:include>

	
    <div class="container" >
    	<form action="profile" class="forms" method="post" modelAttribute="profile" style="display: flex; margin-top: 50px;"  enctype="multipart/form-data">
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
	                    <input type="file" class="form-control  form-control-updateprofile" name="imageFile" id="photos" value="${profilePicPath}" accept="image/*">
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


