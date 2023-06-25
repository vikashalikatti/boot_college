<%@page import="org.jsp.college.dto.Faculty"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<title>Approve Faculty</title>
</head>
<body>
<%String email =(String) session.getAttribute("admin"); 
if(email==null){
	request.setAttribute("fail", "Please Login Again");
	request.getRequestDispatcher("admin_login.jsp").include(request, response);
}else{	
%>
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
<%} %>
</html>