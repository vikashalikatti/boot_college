<%@page import="org.jsp.college.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Admission</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
</head>
<body>
	<%
	Student student1 = (Student) session.getAttribute("student");
	if (student1 == null) {
		response.getWriter().print("Please login Again");
		request.getRequestDispatcher("studentlogin").include(request, response);
	} else {
	%>

	<h1>Hello ${name}</h1>
	<br>
	<h1>You have opted for ${course} course in ${stream} stream</h1>
	<h1>You are eligible for ${quota} quota</h1>
	<br>
	<h1>Your fee will be ${fee}&#8377</h1>
	<br>
	<a href="/student/accept"><button>Accept</button></a>
	<a href="/student/reject"><button>Reject</button></a>
	<%
	}
	%>
</body>
</html>