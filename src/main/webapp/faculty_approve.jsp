<%@page import="org.jsp.college.dto.Faculty"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve Faculty</title>
</head>
<body>
	<%
	List<Faculty> list = (List<Faculty>) request.getAttribute("list");
	%>
	<table border="1">
		<tr>
			<th>Faculty Id</th>
			<th>Faculty Name</th>
			<th>Faculty Mobile</th>
			<th>Subject</th>
			<th>Age</th>
			<th>Education</th>
			<th>Experience</th>
			<th>Status</th>
			<th>Change Status</th>
		</tr>
		<%
		for (Faculty faculty : list) {
		%>
		<tr>
			<th><%=faculty.getId()%></th>
			<th><%=faculty.getName()%></th>
			<th><%=faculty.getMobile()%></th>
			<th><%=faculty.getSubject()%></th>
			<th><%=faculty.getAge()%></th>
			<th><%=faculty.getEducation()%></th>
			<th><%=faculty.getExperience()%></th>
			<th><%=faculty.isStatus()%></th>
			<form method="post" action="/faculty/change/<%=faculty.getId()%>">
			<th><button>Change</button></th>
			</form>
		</tr>
		<%
		}
		%>
	</table>
	<a href="/Admin_Home.jsp"><button type="button">Back</button></a>
</body>
</html>