<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Signup</title>
<style>
body {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 0px 15px 5px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    animation: colorchange 2s infinite;
}

label {
    display: block;
    margin-bottom: 8px;
}

.gender {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
}

input[type="text"], input[type="email"], input[type="password"], input[type="date"], input[type="radio"] {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    transition: border-color 0.3s ease;
}

input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="date"]:focus {
    border-color: #4CAF50;
}

button[type="reset"], button {
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

button[type="reset"]:hover, button:hover {
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
<div class="container">
<h1>${success}</h1>
<h1>${fail}</h1>
<form action="/student/signup" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name"> 
    <label for="email">Email:</label>
    <input type="email" id="email" name="email">
    <label for="mobile">Mobile:</label>
    <input type="text" id="mobile" name="mobile">
    <label>Gender:</label>
    <div class="gender">
        <input type="radio" id="male" name="gender" value="male"><label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female"><label for="female">Female</label>
    </div>
    <label for="date">Date of Birth:</label>
    <input type="date" id="date" name="date">
    <label for="password">Password:</label>
    <input type="password" id="password" name="password">
    <button type="reset">Cancel</button>
    <button type="submit">Signup</button>
</form>
<br>
<a href="/studentlogin.jsp"><button>Back</button></a>
</div>
</body>
</html>
