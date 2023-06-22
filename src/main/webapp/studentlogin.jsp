<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<style>
<!-- your styles here -->
</style>
</head>
<body>
    <div class="container">
        <p class="msg">
            <h1 style="color: green">${success}</h1>
            <h1 style="color:red">${fail}</h1>
        </p>

        <h2 class="title">Student Login</h2>
        <form action="/student/login" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input name="email" id="email" type="text"
                        placeholder="Enter your email" required="required">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input name="password" id="password" type="password"
                        placeholder="Enter your password" required="required">
            </div>
            <div class="form-group">
                <button type="submit">Submit</button>
                <br>
                <button type="reset">Cancel</button>
            </div>
        </form>
        <a href="/otp_login.jsp"><button>Login with OTP</button></a>
        <br>
        <a href="/student_signup.jsp"><button>New? click here to create an account</button></a>
        <div class="form-group">
            <a href="/"><button>Home</button></a>
        </div>
    </div>
</body>
</html>
