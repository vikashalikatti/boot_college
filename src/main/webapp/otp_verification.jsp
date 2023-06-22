<%@page import="org.jsp.college.dao.Student_dao"%>
<%@page import="org.jsp.college.dto.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP Validation</title>
</head>
<body>
<%Student_dao dao = new Student_dao(); %>
<% String email = (String) request.getAttribute("email"); %>

<h2>OTP Validation for <%= email %></h2>
<form action="validotp" method="post">
        <label for="email">Email:</label><br> <input type="text"
                id="email" name="email" value="<%= email %>" readonly><br>
	<label for="otp">Enter OTP:</label><br> <input type="number"
		id="otp" name="otp" required><br>
	<br> <input type="submit" value="Validate">
</form>

<%
	if (request.getAttribute("success") != null) {
	%>
	<p style="color: green;"><%=request.getAttribute("success")%></p>
	<%
	}
	%>

	<%
	if (request.getAttribute("fail") != null) {
	%>
	<p style="color: red;"><%=request.getAttribute("fail")%></p>
	<%
	}
	%>
</body>
</html>
