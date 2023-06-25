<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP Login</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
</head>
<body>
	<div class="container">
		<h2 class="title">OTP Login</h2>
		<form action="/student/login_verify" method="post">
			<div class="form-group">
				<label for="mobile">Mobile Number:</label> <input name="mobile"
					id="mobile" type="text" placeholder="Enter your mobile number"
					required="required">
			</div>
			<div class="form-group">
				<button type="submit">Send OTP</button>
			</div>
		</form>
		<a href="/"><button>Back to Login</button></a>
	</div>
	<h1 id="successMessage" style="color: green">${success}</h1>
	<h1 id="failMessage" style="color: red">${fail}</h1>
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
