<%@page import="org.jsp.college.dto.Student"%>
<%@page import="org.jsp.college.dto.Stream_dto"%>
<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<title>Enroll Course</title>

<!-- including Bootstrap for better UI -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">

<!-- including animate.css for animations -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<!-- additional styles -->
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 50px;
}

form {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

button {
	margin-top: 20px;
}

/* modal (pop-up) styles */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 300px;
}
</style>

<script>
function updateStreams() {
    var courseDropdown = document.getElementById('courseDropdown');
    var streamDropdown = document.getElementById('streamDropdown');
    var selectedCourse = courseDropdown.value;

    streamDropdown.innerHTML = '';

    var defaultOption = document.createElement('option');
    defaultOption.textContent = "Select a Stream";
    streamDropdown.appendChild(defaultOption);

    var streams = [];

    <%List<Course> list = (List<Course>) request.getAttribute("list");
for (Course course : list) {%>
        if (selectedCourse === '<%=course.getName()%>') {
            <%for (Stream_dto stream : course.getStream()) {%>
                streams.push('<%=stream.getName()%>
	');
<%}%>
	}
<%}%>
	if (streams.length == 0) {
			showModal("No streams available for the selected course");
		} else {
			streams.forEach(function(stream) {
				var option = document.createElement('option');
				option.value = stream;
				option.textContent = stream;
				streamDropdown.appendChild(option);
			});
		}
	}

	function validateForm() {
		var courseDropdown = document.getElementById('courseDropdown');
		var streamDropdown = document.getElementById('streamDropdown');

		if (courseDropdown.value === "Select One Course") {
			showModal("Please select a course");
			return false;
		}
		if (streamDropdown.value === "Select a Stream") {
			showModal("Please select a stream");
			return false;
		}
		return true;
	}

	function showModal(message) {
		var modal = document.getElementById('myModal');
		var modalContent = document.getElementById('modalContent');

		modalContent.innerHTML = message;
		modal.style.display = "block";
		modalContent.className = 'animate__animated animate__flipInY modal-content'; // changed animation to flipInY

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	}
</script>
</head>
<body>
	<%
	Student student = (Student) session.getAttribute("student");
	if (student == null) {
		request.setAttribute("fail", "Please Login Again");
		request.getRequestDispatcher("studentlogin.jsp").include(request, response);
	} else {
	%>
	<form action="/student/enroll" method="post"
		onsubmit="return validateForm()">
		<h1 class="text-center">Select Course and Stream</h1>
		<select id="courseDropdown" onchange="updateStreams()" name="course"
			class="form-control">
			<option>Select One Course</option>
			<%
			for (Course course : list) {
			%>
			<option><%=course.getName()%></option>
			<%
			}
			%>
		</select> <br> <select id="streamDropdown" name="stream"
			class="form-control">
			<option>Select a Stream</option>
		</select> <br>
		<button class="btn btn-primary btn-block">Enroll</button>
		<button type="reset" class="btn btn-light btn-block">Cancel</button>
		<a href="/StudentHome.jsp"><button type="button"
				class="btn btn-light btn-block">Back</button></a>

	</form>

	<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div id="modalContent" class="modal-content">
			<p></p>
		</div>
	</div>
	<%
	}
	%>
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
