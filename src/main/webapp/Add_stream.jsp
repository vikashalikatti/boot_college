<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Stream</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<style>
body {
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 0px 15px 5px rgba(0, 0, 0, 0.1);
    width: 400px;
}

h1 {
    text-align: center;
    animation: colorchange 2s infinite;
}

label, input[type="text"], input[type="number"], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
}

button[type="submit"], button[type="reset"], button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition-duration: 0.4s;
    width: 100%;
}

button[type="submit"]:hover, button[type="reset"]:hover, button:hover {
    background-color: #45a049;
}

@keyframes colorchange {
    0%   {color: blue;}
    25%  {color: green;}
    50%  {color: red;}
    100% {color: yellow;}
}
</style>
</head>
<body>
<%String email =(String) session.getAttribute("admin"); 
if(email==null){
	request.setAttribute("fail", "Please Login Again");
	request.getRequestDispatcher("admin_login.jsp").include(request, response);
}else{	
%>
<div class="container">

<h1>Enter Stream Details</h1>
<form action="/admin/stream" method="post">
    <label for="name">Stream Name:</label><br>
    <input type="text" id="name" name="name"> <br> 
    <label for="fee">Stream Fee:</label><br>
    <input type="number" id="fee" name="fee"> <br> 
    <label for="seat">Seats:</label><br>
    <input type="number" id="seat" name="seat"> <br> 
    <label for="coursename">Select course:</label><br>
    <select id="coursename" name="coursename">
        <%
        List<Course> list = (List<Course>) request.getAttribute("list");
        for (Course course : list) {
        %>
        <option><%=course.getName()%></option>
        <%
        }
        %>
    </select>
    <button type="reset">Cancel</button>
    <button type="submit">Add</button>
</form>
<br>
<a href="/"><button>Home</button></a>
</div>
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
