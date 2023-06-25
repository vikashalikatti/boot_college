<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Login</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<style>
body, html {
    height: 100%;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #009fff, #ec2f4b);
    animation: fadeIn 2s;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}



input[type="text"], input[type="password"] {
    width: 90%;
    padding: 10px;
    margin-bottom: 20px;
    border-radius: 4px;
    border: 1px solid #ddd;
}

button {
    width: 90%;
    padding: 10px;
    border: none;
    border-radius: 4px;
    color: white;
    font-size: 16px;
    margin-bottom: 20px;
    cursor: pointer;
    transition: transform .2s;
}

button:hover {
    transform: scale(1.1);
}

button[type="submit"] {
    background: #009fff;
}

button[type="reset"] {
    background: #ec2f4b;
}

a button {
    display: block;
    background: #333;
}

a button:hover {
    opacity: 0.7;
}

@keyframes fadeIn {
    0% {opacity: 0;}
    100% {opacity: 1;}
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

</style>
</head>
<body>
<form action="/faculty/login" method="post" id="loginForm">
    <h1 id="successMessage" style="color:green">${success}</h1>
<h1 id="failMessage" style="color:red">${fail}</h1>
    Email:<input type="text" name="email" placeholder="Enter email" required="required">
    Password:<input type="password" name="password" placeholder="Enter password" required="required">
    <button type="submit">Login</button>
    <button type="reset">Cancel</button>
    <a href="/FacultySignup.jsp"><button type="button">New? Click here to Create an Account</button></a>
    <a href="/"><button type="button">Home</button></a>
</form>
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


    
</body>
</html>
