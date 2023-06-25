<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<meta name="author" content="TemplateMo">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<title>JSP Institute of Technology</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<!--



-->
</head>

<body>

	<!-- Sub Header -->


	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">

						<!-- ***** Logo Start ***** -->
						<a href="/home.jsp" class="logo"> JSP INstitute of Technology
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
							<li><a href="/admin_login.jsp">Admin </a></li>
							<li class="scroll-to-section"><a href="#apply">Student</a></li>
							<li><a href="/FacultyLogin.jsp">Faculty</a></li>
							<li><a href="/StaffLogin.jsp">Non-staff</a></li>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->

	<!-- ***** Main Banner Area Start ***** -->
	<section class="section main-banner" id="top" data-section="section1">
		<video autoplay muted loop id="bg-video">
			<source src="assets/images/course-video.mp4" type="video/mp4" />
		</video>

		<div class="video-overlay header-text">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="caption">
							<h6>Hello Students</h6>
							<h2>Welcome to Education</h2>
							<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit.
								Voluptatibus magni qui debitis minus, ad, et fugiat dolore hic
								officiis a aut odit eos deserunt quas exercitationem, doloremque
								laboriosam nesciunt neque?</p>
							<div class="main-button-red"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ***** Main Banner Area End ***** -->

	<section class="services">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="owl-service-item owl-carousel">

						<div class="item">
							<div class="icon">
								<img src="assets/images/service-icon-01.png" alt="">
							</div>
							<div class="down-content">
								<h4>Best Education</h4>
								<p>Suspendisse tempor mauris a sem elementum bibendum.
									Praesent facilisis massa non vestibulum.</p>
							</div>
						</div>

						<div class="item">
							<div class="icon">
								<img src="assets/images/service-icon-02.png" alt="">
							</div>
							<div class="down-content">
								<h4>Best Teachers</h4>
								<p>Suspendisse tempor mauris a sem elementum bibendum.
									Praesent facilisis massa non vestibulum.</p>
							</div>
						</div>

						<div class="item">
							<div class="icon">
								<img src="assets/images/service-icon-03.png" alt="">
							</div>
							<div class="down-content">
								<h4>Best Students</h4>
								<p>Suspendisse tempor mauris a sem elementum bibendum.
									Praesent facilisis massa non vestibulum.</p>
							</div>
						</div>

						<div class="item">
							<div class="icon">
								<img src="assets/images/service-icon-02.png" alt="">
							</div>
							<div class="down-content">
								<h4>Online Meeting</h4>
								<p>Suspendisse tempor mauris a sem elementum bibendum.
									Praesent facilisis massa non vestibulum.</p>
							</div>
						</div>

						<div class="item">
							<div class="icon">
								<img src="assets/images/service-icon-03.png" alt="">
							</div>
							<div class="down-content">
								<h4>Best Networking</h4>
								<p>Suspendisse tempor mauris a sem elementum bibendum.
									Praesent facilisis massa non vestibulum.</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>



	<section class="apply-now" id="apply">
		<div class="row justify-content-center">
			<div class="col-lg-6 align-self-center text-center">
				<div class="main-button-red" style="margin-top: 0px;">
					<!--Add inline CSS to move the button down-->
						<a href="/studentlogin.jsp">Join Us Now!</a>
				</div>
			</div>
		</div>
	</section>



	<section class="our-facts">
		<div class="container">
			<div class="row justify-content-center">
				<!--Add this class to center the content-->
				<div class="col-lg-6 align-self-center text-center">
					<!--Add text-center class to center the video-->
					<div class="video">
						<a href="https://youtu.be/YVkUvmDQ3HY" target="_blank"><img
							src="assets/images/play-icon.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/lightbox.js"></script>
	<script src="assets/js/tabs.js"></script>
	<script src="assets/js/video.js"></script>
	<script src="assets/js/slick-slider.js"></script>
	<script src="assets/js/custom.js"></script>
	<script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .responsive-menu, .scroll-to-section').on('click', 'a', function (e) {
          e.preventDefault();
          showSection($(this).attr('href'), tru5e);
        });

        $(window).scroll(function () {
          checkSection();
        });
        
    </script>
	<footer>
		<div class="sub-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-sm-8"></div>
					<div class="col-lg-4 col-sm-4">
						<div class="right-icons">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-behance"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
<h1 id="successMessage" style="color:green">${success}</h1>
<h1 id="failMessage" style="color:red">${fail}</h1>
</body>	
<script>
    // Get the success and fail message elements
    var successMessage = document.getElementById("successMessage");
    var failMessage = document.getElementById("failMessage");

    // Check if the success message exists and display it as a pop-up alert
    if (successMessage.innerText !== "") {
        window.alert(successMessage.innerText);
        successMessage.style.display = "none"; // Hide the success message element
    }

    // Check if the fail message exists and display it as a pop-up alert
    if (failMessage.innerText !== "") {
        window.alert(failMessage.innerText);
        failMessage.style.display = "none"; // Hide the fail message element
    }
</script>

</html>