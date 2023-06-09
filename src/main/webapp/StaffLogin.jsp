<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Login</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
</head>
<body>
<h1 id="successMessage" style="color:green">${success}</h1>
<h1 id="failMessage" style="color:red">${fail}</h1>
<form action="/Staff/login" method="post">
Email:<input type="text" name="email" placeholder="Enter email" required="required">
Password:<input type="text" name="password" placeholder="Enter password" required="required">
<button>Login</button><button type="reset">Cancel</button>
</form>
<a href="/StaffSignup.jsp"><button>New? Click here to Create an Account</button></a>
<a href="/"><button>Home</button></a>
</body>
<script>
    var successMessage = document.getElementById("successMessage");
    var failMessage = document.getElementById("failMessage");
    if (successMessage.innerText !== "") {
        window.alert(successMessage.innerText);
        successMessage.style.display = "none";
    }
    if (failMessage.innerText !== "") {
        window.alert(failMessage.innerText);
        failMessage.style.display = "none"; 
    }
</script>
</html>