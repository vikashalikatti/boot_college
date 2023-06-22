<%@page import="org.jsp.college.dto.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<title>Approve Student</title>
</head>
<body>
	<%
	List<Student> list = (List<Student>) request.getAttribute("students");
	%>
	<table border="1">
		<tr>
			<th>Student Id</th>
			<th>Student Name</th>
			<th>Student Mobile</th>
			<th>Student Course</th>
			<th>Student Stream</th>
			<th>Student quota</th>
			<th>Approve</th>
		</tr>
		<%
		for (Student student : list) {
		%>
		<tr>
			<th><%=student.getId()%></th>
			<th><%=student.getName()%></th>
			<th><%=student.getMobile()%></th>
			<th><%=student.getCourse().getName()%></th>
			<th><%=student.getStream().getName()%></th>
			<th><%=student.getQuota()%></th>
			<th><a href="/student/approve/<%=student.getId()%>"><button>Approve</button></a></th>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>