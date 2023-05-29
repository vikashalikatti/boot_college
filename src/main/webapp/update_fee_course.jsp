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
	<%
	List<Course> courses =(List<Course>) request.getAttribute("courses");
	%>
	<table border="1">
	<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Fee</th>
	<th>Duration</th>
	<th>Edit</th>
	</tr>
	<%for (Course c:courses) {%>
	<tr>
	<th><%=c.getId() %></th>
	<th><%=c.getName() %></th>
	<th><%=c.getFee() %></th>
	<th><%=c.getDuration() %></th>
	<th><a href="/admin/<%=c.getId()%>/updateFee"><button>Edit Fee</button></a></th>
	</tr>
	<% }%>
	</table>
</body>
</html>
