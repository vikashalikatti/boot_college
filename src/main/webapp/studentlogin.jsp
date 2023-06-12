<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<style>
:root {
	--primary-color: #6200EE;
	--secondary-color: #03DAC6;
	--background-color: #f8f8f8;
	--text-color: #333333;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: linear-gradient(to right, #FA709A, #Fee140);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.container {
	width: 400px;
	padding: 20px;
	background-color: #FFFFFF;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.title {
	text-align: center;
	font-size: 24px;
	color: var(--primary-color);
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

.form-group input {
	width: 100%;
	padding: 10px;
	border: 1px solid #CCCCCC;
	border-radius: 5px;
	font-size: 16px;
}

.form-group button {
	background-color: var(--secondary-color);
	border: none;
	color: #FFFFFF;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
}

.form-group button[type="reset"] {
	background-color: #CCCCCC;
	margin-right: 10px;
}

.form-group button:hover {
	background-color: #02B3A4;
}

.msg {
	text-align: center;
	color: var(--primary-color);
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container">

		<p class="msg"><h1 style="color: green">${success}</h1>
		<h1 style="color:red">${fail}</h1>
	</p>
		
	<h2 class="title">Student Login</h2>
	<form action="/student/login" method="post">
		<div class="form-group">
			<label for="email">Email:</label>
			<input name="email" id="email" type="text"
					placeholder="Enter your email" required="required">
		</div>
		<div class="form-group">
			<label for="password">Password:</label>
			<input name="password" id="password" type="password"
					placeholder="Enter your password" required="required">
		</div>
		<div class="form-group">
			
			<button type="submit">Submit</button>
				<br><br>
			<button type="reset">Cancel</button>

		</div>
	</form>
	<br>
	<a href="/student_signup.jsp">New? click here to create an account</a>
	<div class="form-group">
	<a href="/"><button>Home</button></a>
	</div>
	
</div>
</body>
</html>
