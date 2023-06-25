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
<% String email = (String) request.getAttribute("email"); %>

<h2>OTP Validation for <%= email %></h2>
<form action="/student/validotp" method="post">
        <label for="email">Email:</label><br> <input type="text"
                id="email" name="email" value="<%= email %>" readonly><br>
	<label for="otp">Enter OTP:</label><br> <input type="number"
		id="otp" name="otp" required><br>
	<br> <input type="submit" value="Validate">
	<a href="/student/resend/<%=email%>"><button type="button">Resend</button></a>
</form>

<h1 id="successMessage" style="color:green">${success}</h1>
<h1 id="failMessage" style="color:red">${fail}</h1>
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
