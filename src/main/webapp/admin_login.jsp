<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

<style>
    /* Custom CSS */
    body, html {
        height: 100%;
        margin: 0;
        font-family: Arial, Helvetica, sans-serif;
        display: grid;
        justify-items: center;
        align-items: center;
        background: #9575cd;
    }

    .container {
        display: flex;
        justify-content: center;
        flex-direction: column;
        padding: 1em;
        background: white;
        border-radius: 8px;
        height: auto;
        text-align: center;
        max-width: 500px;
        animation: bounceInDown;
        animation-duration: 2s;
    }

    .form-group {
        margin-bottom: 1em;
    }

    .form-group input {
        animation: fadeIn;
        animation-duration: 2s;
    }

    .form-group button {
        width: 100%;
        padding: 0.6em;
        border: none;
        margin-top: 1em;
        background: #9575cd;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1.1em;
    }

    .form-group button:hover {
        opacity: 0.9;
    }

    .form-group button:active {
        opacity: 1;
    }

    .btn-secondary {
        width: 48%; // reduced to 48% to accommodate margin or padding
        margin-right: 1%; // added to separate buttons
    }

    .btn-group {
        display: flex;
        justify-content: space-between;
        animation: fadeIn;
        animation-duration: 2s;
    }
</style>
</head>
<body>
    <div class="container animated bounceInDown">
        
        
        <h2 class="title">Admin Login</h2>
        <form action="/admin/login" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input name="email" id="email" type="text" placeholder="Enter your email" required="required">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input name="password" id="password" type="password" placeholder="Enter your password" required="required">
            </div>
            <div class="form-group">
                <button type="submit" class="animated pulse infinite">Submit</button>
                <div class="btn-group">
                    <button type="reset" class="btn-secondary animated flip">Cancel</button>
                    <a href="/" ><button type="button" class="btn-secondary animated flip">Home</button></a>
                </div>
            </div>
        </form>
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
</html>
