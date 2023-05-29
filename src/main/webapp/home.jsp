<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@page import="org.jsp.college.dao.Course_dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap"
	rel="stylesheet">
<style>
:root {
	--primary-color: #6200EE;
	--secondary-color: #03DAC6;
	--background-color: #121212;
	--surface-color: #1F1B24;
	--on-primary: #FFFFFF;
	--on-secondary: #000000;
	--on-background: #FFFFFF;
	--on-surface: #FFFFFF;
}

body {
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	background-color: var(--background-color);
	color: var(--on-background);
	width: 100%;
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	animation: fade-in 1s ease-out;
}

@
keyframes fade-in { 0% {
	opacity: 0;
}

100
%
{
opacity
:
1;
}
}
header {
	width: 100%;
	background-color: var(--primary-color);
	color: var(--on-primary);
	padding: 20px 0;
	text-align: center;
	clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
	animation: slide-down 0.5s ease-out;
}

@
keyframes slide-down { 0% {
	transform: translateY(-100%);
}

100
%
{
transform
:
translateY(
0
);
}
}
button {
	background-color: var(--secondary-color);
	border: none;
	color: var(--on-secondary);
	padding: 15px 25px;
	margin: 10px;
	cursor: pointer;
	font-size: 1em;
	border-radius: 5px;
	transition: transform 0.2s, box-shadow 0.2s;
	box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px
		rgba(0, 0, 0, .08);
}

button:hover {
	transform: scale(1.05);
	box-shadow: 0 6px 10px rgba(50, 50, 93, .20), 0 3px 6px
		rgba(0, 0, 0, .1);
}

button:disabled {
	background-color: #555;
	cursor: not-allowed;
}

footer {
	background-color: var(--surface-color);
	color: var(--on-surface);
	padding: 20px;
	width: 100%;
	text-align: center;
	position: fixed;
	bottom: 0;
	animation: slide-up 0.5s ease-out;
}

@
keyframes slide-up { 0% {
	transform: translateY(100%);
}

100
%
{
transform
:
translateY(
0
);
}
}
.main-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 50px 0;
}

.button-group {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.button-group button {
	margin: 10px;
}

.advanced-graphic {
	width: 200px;
	height: 200px;
	background-image: url("path/to/your/image.jpg");
	background-size: cover;
	background-position: center;
	border-radius: 50%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	margin: 20px;
	animation: rotate 2s linear infinite;
}

@
keyframes rotate { 0% {
	transform: rotate(0deg);
}
100
%
{
transform
:
rotate(
360deg
);
}
}
</style>
</head>
<body>

	<header>
		<h1>Welcome to home page</h1>
		<h1>College Management System</h1>
	</header>
	<h1 style="color: green">${success}</h1>
	<h1 style="color: red">${fail}</h1>
	<%
	if (session.getAttribute("admin") == null) {
	%>
	<main class="main-content">
		<a href="/admin_login.jsp"><button>Click here to login as Admin</button></a> <br>
		<a href="/studentlogin.jsp"><button >Click here to login as Student</button></a><br>
		<a href="/facultylogin.jsp"><button >Click here to login as Faculty</button></a><br>
		<a href="/non_staff_login.jsp"><button >Click here to login as non_staff login</button></a>
		
		<div class="advanced-graphic"></div>
	</main>
	<%
	} else {
	%>
	<%
	if (session.getAttribute("message") != null) {
	%>
	<p class="msg">${message}</p>
	<%
	session.removeAttribute("message");
	}
	%>
	<a href="/Add_course.jsp"><button>add course</button></a>
	<a href="/admin/stream"><button>add stream</button></a>
	<a href="/admin/update"><button>Update fee for course</button></a>
	<a href="/logout"><button>Logout</button></a>
	
	<%
	}
	%>
	<footer>
		<p>&copy; 2023 College Management</p>
	</footer>
</body>
</html>
