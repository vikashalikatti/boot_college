<%@page import="org.jsp.college.dto.Stream_dto"%>
<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enroll Course</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%
	List<Course> list = (List<Course>) request.getAttribute("list");
	%>
	<h1>Select Course and Stream</h1>
	<select id="courseDropdown" name="course">
		<option value="">Select a course</option>
		<%
		for (Course course : list) {
		%>
		<option value="<%=course.getId()%>"><%=course.getName()%></option>
		<%
		}
		%>
	</select>
	<select id="streamDropdown" name="stream" disabled>
	</select>

	<script>
	$(document).ready(function() {
	    $('#courseDropdown').change(function() {
	        var courseId = $(this).val();
	        if(courseId != '') {
	            $.get("/student/getStreams/" + courseId, function(data) {
	                var streams = data;
	                var streamDropdown = $('#streamDropdown');
	                streamDropdown.empty();

	                if(streams.length > 0) {
	                    streamDropdown.prop('disabled', false);
	                    for(var i=0; i<streams.length; i++) {
	                        streamDropdown.append('<option value="' + streams[i].id + '">' + streams[i].name + '</option>');
	                    }
	                } else {
	                    alert('No streams available for the selected course.');
	                    streamDropdown.prop('disabled', true);
	                }
	            });
	        } else {
	            $('#streamDropdown').prop('disabled', true);
	        }
	    });
	});
	</script>
</body>
</html>
