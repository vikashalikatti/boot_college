<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Course</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<style>
body {
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
}

h1 {
    text-align: center;
    animation: colorchange 2s infinite;
}

input[type="text"], input[type="number"] {
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
<h1>Enter Course Details</h1>
<form action="/admin/course" method="post">
    <label for="name">Course Name:</label><br>
    <input type="text" id="name" name="name"> <br> 
    <label for="fee">Course Fee:</label><br>
    <input type="text" id="fee" name="fee"> <br> 
    <label for="duration">Course Duration:</label><br>
    <input type="number" id="duration" name="duration"> <br>
    <button type="reset">Cancel</button>
    <button type="submit">Add</button>
</form>
<br>
<a href="/"><button>Home</button></a>
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
<%}%>
</html>
