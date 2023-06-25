<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<title>Admin Home</title>
</head>
<body>
	<%String email =(String) session.getAttribute("admin"); 
if(email==null){
	request.setAttribute("fail", "Please Login Again");
	request.getRequestDispatcher("admin_login.jsp").include(request, response);
}else{	
%>
	<h1>Admin Home Page</h1>
	<a href="/Add_course.jsp"><button>Add Course</button></a>
	<a href="/admin/stream"><button>Add Stream</button></a>
	<a href="/admin/admission"><button>Approve Admission</button></a>
	<a href="/admin/update_stream"><button>Update Fee</button></a>
	<a href="/Staff/fetchall"><button>Approve Staff</button></a>
	<a href="/faculty/fetchall"><button>Approve Faculty</button></a>
	<a href="/logout"><button>Logout</button></a>
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