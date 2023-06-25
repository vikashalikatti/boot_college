<%@page import="org.jsp.college.dto.Stream_dto"%>
<%@page import="org.jsp.college.dao.Course_dao"%>
<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Update Fee For Course</title>
</head>
<body>
	<%String email =(String) session.getAttribute("admin"); 
if(email==null){
	request.setAttribute("fail", "Please Login Again");
	request.getRequestDispatcher("admin_login.jsp").include(request, response);
}else{	
%>
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
	<h1 id="successMessage" style="color: green">${success}</h1>
	<h1 id="failMessage" style="color: red">${fail}</h1>
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
<%} %>
</html>
