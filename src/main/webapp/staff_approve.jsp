<%@page import="org.jsp.college.dto.Staff"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approve Staff</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
</head>
<body>
	<%
	String email = (String) session.getAttribute("admin");
	if (email == null) {
		request.setAttribute("fail", "Please Login Again");
		request.getRequestDispatcher("admin_login.jsp").include(request, response);
	} else {
	%>
	<%
	List<Staff> list = (List<Staff>) request.getAttribute("list");
	%>
	<table border="1">
		<tr>
			<th>Staff Id</th>
			<th>Staff Name</th>
			<th>Staff Mobile</th>
			<th>Age</th>
			<th>Status</th>
			<th>Change Status</th>
		</tr>
		<%
		for (Staff staff : list) {
		%>
		<tr>
			<th><%=staff.getId()%></th>
			<th><%=staff.getName()%></th>
			<th><%=staff.getMobile()%></th>
			<th><%=staff.getAge()%></th>
			<th><%=staff.isStatus()%></th>
			<form method="post" action="/Staff/change/<%=staff.getId()%>">
				<th><button>Change</button></th>
			</form>
		</tr>
		<%
		}
		%>
	</table>
	<a href="/Admin_Home.jsp"><button type="button">Back</button></a>
	<%
	}
	%>
</body>
</html>