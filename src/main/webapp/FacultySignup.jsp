<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<title>Faculty Signup</title>
<script>
    function checkFileSize(input) {
        if (input.files[0].size > 200000) {
            alert("The file must be less than 200KB.");
            return false;
        }
        return true;
    }
</script>
</head>
<body>
  
    <form action="/faculty/signup" method="post" enctype="multipart/form-data" onsubmit="return checkFileSize(document.getElementById('photo'))">
        Name:<input type="text" name="name"><br> 
        Email:<input type="email" name="email"><br> 
        Mobile:<input type="text" name="mobile"><br> 
        Gender:<input type="radio" name="gender" value="male">Male 
        <input type="radio" name="gender" value="female">Female<br> 
        Date of Birth: <input type="date" name="date"><br> 
        Password:<input type="password" name="password"><br>
        Experience:<input type="text" name="experience"><br>
        Subject:<input type="text" name="subject"><br>
        Education:<input type="text" name="education"><br>
        Photo:<input type="file" id="photo" name="photo" accept="image/*" required><br>
        <button type="reset">Cancel</button>
        <button type="submit">Signup</button>
    </form>
    <br>
    <a href="/FacultyLogin.jsp"><button>Back</button></a>
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
