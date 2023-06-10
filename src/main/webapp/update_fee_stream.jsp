<%@page import="org.jsp.college.dto.Stream_dto"%>
<%@page import="org.jsp.college.dao.Course_dao"%>
<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Fee For Course</title>
</head>
<body>
	<h1 style="color: green">${success}</h1>
	<h1 style="color: red">${fail}</h1>
	<h1>Stream Fee Update</h1>
	<%
	List<Stream_dto> streamlist = (List<Stream_dto>) session.getAttribute("streamlist");
	List<Course> courselist = (List<Course>) session.getAttribute("courselist");
	%>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Course Name</th>
			<th>Stream Name</th>
			<th>Fee</th>
			<th>Duration</th>
			<th>Edit</th>
		</tr>
		<%
		for (Course c : courselist) {
		%>
		<%
		for (Stream_dto s : c.getStream()) {
		%>
		<form action="/admin/updateFeestream/<%=s.getId()%>" method="post">
			<tr>
				<th><%=s.getId()%></th>
				<th><%=c.getName()%></th>
				<th><%=s.getName()%></th>
				<th><%=s.getFee()%></th>
				<th><input type="number" name="fee" required></th>
				<th><button type="submit">Edit Fee</button></th>
			</tr>
		</form>
		<%
		}
		%>
		<%
		}
		%>
	</table>
	<a href="/Admin_Home.jsp"><button>Back</button></a>
</body>
</html>
