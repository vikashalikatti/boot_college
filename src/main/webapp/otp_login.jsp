<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP Login</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<style>
<!-- your styles here -->
</style>
</head>
<body>
    <div class="container">
        <h2 class="title">OTP Login</h2>
        <form action="/student/login_verify" method="post">
            <div class="form-group">
                <label for="mobile">Mobile Number:</label>
                <input name="mobile" id="mobile" type="text"
                        placeholder="Enter your mobile number" required="required">
            </div>
            <div class="form-group">
                <button type="submit">Send OTP</button>
            </div>
        </form>
        <a href="/"><button>Back to Login</button></a>
    </div>
</body>
</html>
