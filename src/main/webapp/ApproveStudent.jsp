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
<%String email =(String) session.getAttribute("admin"); 
if(email==null){
	request.setAttribute("fail", "Please Login Again");
	request.getRequestDispatcher("admin_login.jsp").include(request, response);
}else{	
%>
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