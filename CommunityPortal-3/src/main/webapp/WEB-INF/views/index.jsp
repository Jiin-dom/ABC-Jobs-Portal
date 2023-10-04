<jsp:include page="header2.jsp"></jsp:include>
<div class="d-flex align-items-center position-relative" style="height: 90vh; overflow: hidden;">
  	<video autoplay muted loop class="position-absolute" style="z-index: -1; min-width: 100%">
  		<source src="video/earth.mp4" type="video/mp4">
	</video>
  <div class="d-flex flex-column justify-content-center container">
    <h1 class="text-white" style="font-size: 3.4em; font-weight: 700;">Together we can build great things</h1>
    <p class="fs-3 text-white">A place where developers from all over the world, you and your capability make the world more great </p>
    <div class="d-flex align-items-start gap-4">
      <form action="registration" method="GET" class="input-group pe-4 border-end w-50">
        <input type="email" class="form-control" placeholder="Email Address" name="email">
        <button type="submit" class="btn btn-primary input-group-text">Sign up for ABC Jobs</button>
      </form>
      <a href="login" class="btn btn-outline-primary w-25 text-white fw-bold">I have an account</a>
    </div>
  </div>
</div>

<div class="container my-4 snap-container">
   <div class="d-flex flex-column justify-content-center mb-5" style="height: 25vh;">
    <small class="fs-3">Developer from all companies and organizations</small>
    <div class="d-flex justify-content-center align-items-center gap-5 mt-3" style="filter: grayscale(1);">
      <img src="images/google.png" alt="Google" height="60px"></img>
      <img src="images/github.jpg" alt="Github" height="100px"></img>
      <img src="images/stripe.png" alt="Stripe" height="90px"></img>
      <img src="images/meta.jpg" alt="Meta" height="120px"></img>
    </div>
  </div>

  <div class="d-flex align-items-center gap-4 my-5 snap-child">
    <div class="align-self-stretch position-relative border">
      <span class="position-absolute bg-white py-2" style="top: 50%; left: 50%; transform: translate(-50%, -50%);">
      	<i class='bx bx-lock-alt fs-4'></i>
      </span>
    </div>
    <div>
      <p class="fs-3 fw-semibold">Keep it private</p>
      <h2 class="fs-1 fw-bold">Create private chats that only you know</h2>
    </div>
    <img src="images/chat.svg" width="450px" class="ms-auto">
  </div>

  <div class="d-flex align-items-center gap-4 my-5 snap-child">
    <div class="align-self-stretch position-relative border">
      <span class="position-absolute bg-white py-2" style="top: 50%; left: 50%; transform: translate(-50%, -50%);">
      	<i class='bx bx-git-repo-forked fs-4'></i>
      </span>
    </div>
    <div>
      <p class="fs-3 fw-semibold">Connect</p>
      <h2 class="fs-1 fw-bold">Where connection is easy</h2>
    </div>
    <img src="images/connect.svg" width="450px" class="ms-auto">
  </div>

  <div class="d-flex align-items-center gap-4 my-5 snap-child">
    <div class="align-self-stretch position-relative border">
      <span class="position-absolute bg-white py-2" style="top: 50%; left: 50%; transform: translate(-50%, -50%);">
      	<i class='bx bx-group fs-4'></i>
      </span>
    </div>
    <div>
      <p class="fs-3 fw-semibold">Reputation</p>
      <h2 class="fs-1 fw-bold">From unknown to known</h2>
    </div>
    <img src="images/famous.svg" width="450px" class="ms-auto">
  </div>
</div>

<div class="d-flex flex-column align-items-center py-5 mt-5">
  <h2>Ready to start your journey?</h2>
  <a href="registration" class="btn btn-primary">Sign up now</a>
</div>

<jsp:include page="footer.jsp"></jsp:include>