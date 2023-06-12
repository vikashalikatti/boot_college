<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Signup</title>
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<script>
    function validateFileSize(input) {
        if (input.files[0].size > 200 * 1024) {
            alert('File size should be less than 200KB');
            input.value = '';
        }
    }
</script>
</head>
<body>
<h1 style="color: green">${success}</h1>
	<h1 style="color: red">${fail}</h1>
	<form action="/Staff/signup" method="post" enctype="multipart/form-data" >
		Name:<input type="text" name="name"><br> 
		Email:<input type="email" name="email"><br>
		Mobile:<input type="text" name="mobile"><br> 
		Gender:<input type="radio" name="gender" value="male">Male
		 <input type="radio" name="gender" value="female">Female<br>
		  Date of Birth: <input
			type="date" name="date"><br> Password:<input
			type="password" name="password"><br>
			Designation:<input type="text" name="designation"><br>
			 Photo:<input type="file" id="photo" name="photo" accept="image/*" onchange="validateFileSize(this);" required><br>
		<button type="submit">Signup</button>
		<button type="reset">Cancel</button>
		<a href="/StaffLogin.jsp"><button type="button">Back</button></a>
	</form>
	<br>
</body>
</html>
	