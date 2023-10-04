<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--       <%@page import="com.Assignment3.bean --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="../header2.jsp">
		<jsp:param value="Result" name="HTMLtitle" />
	</jsp:include>

	<div class="container dashboard-container">
		<div
			class="alert alert-success alert-dismissible fade show ${message == null ? "
			d-none" : "d-flex" }"
                role="alert">
			${message}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>

		<div class="container container-dashboard">
			<img src="images/profheader.png" class="headerimg">
			<div class="row border mb-4 row-no-margin"
				style="margin: 0px 0px 24px;">

				<%-- <div
					class="col-2 rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white profileshape">
					<span>${f}</span> <span>${l}</span>
				</div> --%>
				<c:choose>
				    <c:when test="${empty profilePicPath}">
				        <div class="col-2 rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white profileshape">
				            <span>${f}</span> <span>${l}</span>
				        </div>
				    </c:when>
				    <c:otherwise>
				        <div class="col-2">
				            <img src="${profilePicPath}" alt="${profilePic}" class="circular-image" />
				        </div>
				    </c:otherwise>
				</c:choose>
				<div class="col-7 p-5">
					<h2>${firstName}${lastName}</h2>
					<%-- <h2>${fullName}</h2> --%>
					<p class="profile-p profile-p-1">${headline}</p>
					<c:if test="${not empty city}">
						<p class="profile-p profile-p-2">${city},${country}</p>
					</c:if>
					

					<!-- <p class="contacts nav-links profile-p" onclick="openPopup()">Contact info</p> -->

				</div>
				<div class="col-2 align-self-center">
					<button class="btn btn-outline-primary" id="follow">Follow</button>
				</div>
			</div>
		</div>


		<div class="row" style="margin: 0px 0px 24px;">
			<div class="col-9">
				<div class="mb-3 bottomOf-profile">
					<h3>About Me</h3>
					<hr>
					<p>${about}</p>


				</div>

				<div class=" mb-3 bottomOf-profile ">
					<h3>Education</h3>
					<hr>
					<c:forEach var="e" items="${ed}">
						<div class="d-flex align-items-center">
							<i class='bx bx-book fs-2'></i>
							<div class="p-3">
								<h4>${e.getEducationName()}
									(${e.getStartDate().split("-")[0]} -
									${e.getEndDate().split("-")[0]})</h4>
								<small>${e.getIntitutionName()}</small>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="mb-3 bottomOf-profile  educ-last">
					<h3>Experience</h3>
					<hr>
					<c:forEach var="e" items="${ex}">
						<div class="d-flex align-items-center">
							<i class='bx bx-map-pin fs-2'></i>
							<div class="p-3">
								<h4>${e.getPosition()}(${e.getStartDate().split("-")[0]} -
									${e.getEndDate().split("-")[0]})</h4>
								<small>${e.getCompany()}</small>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-3">
				<div>
					<div class="d-flex align-items-center">
						<i class='bx bx-building fs-2'></i>
						<div class="p-2">
							<h4>Company</h4>
							<small>${company}</small>
						</div>
					</div>
					<div class="d-flex align-items-center">
						<i class='bx bx-envelope fs-2'></i>
						<div class="p-2">
							<h4>Email</h4>
							<small>${email}</small>
						</div>
					</div>
					<div class="d-flex align-items-center">
						<i class='bx bx-globe fs-2'></i>
						<div class="p-2">
							<h4>Website</h4>
							<small>${website}</small>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<jsp:include page="../footer.jsp"></jsp:include>

	<script>
	const followBtn = document.querySelector("#follow");
	followBtn.addEventListener("click", () => {
		if(followBtn.innerHTML == "Follow") {
			followBtn.classList.remove("btn-success");
			followBtn.classList.add("btn-outline-success");
			followBtn.innerHTML = "Unfollow";
		} else {
			followBtn.classList.add("btn-success");
			followBtn.classList.remove("btn-outline-success");
			followBtn.innerHTML = "Follow";
		}
	});
</script>



</body>
</html>