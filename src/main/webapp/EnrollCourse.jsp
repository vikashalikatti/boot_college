<%@page import="org.jsp.college.dto.Stream_dto"%>
<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enroll Course</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Animate CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<!-- Custom Styles -->
<style>
  body {
    padding-top: 20px;
    animation: fadeIn 2s;
    background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);
  }

  .card {
    box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
    animation: slideInUp 1s;
    border-radius: 25px;
    overflow: hidden;  /* Added to make card border-radius apply to children */
  }

  .card-body {
    background: #ffffff;
    box-shadow: 0 8px 20px -12px rgba(0,0,0,0.3);
    padding: 2rem;
    transition: transform .2s;
  }

  .card-body:hover {
    transform: scale(1.02); 
  }

  .form-control:focus {
    border-color: #4CAF50;
    box-shadow: none;
    animation: pulse 2s infinite;
  }

  .btn {
    border-radius: 50px;  /* Changed to give buttons a more pill-like shape */
    padding: .5rem 2rem;  /* Increase padding to match the larger border-radius */
    transition: all 0.5s ease-in-out;
  }

  .btn-success {
    background-color: #4CAF50;
  }

  .btn-success:hover, .btn-success:focus {
    background-color: #45a049;
    transform: scale(1.1);
  }

  .btn-warning {
    transition: all 0.5s ease-in-out;
  }

  .btn-warning:hover, .btn-warning:focus {
    background-color: #f0ad4e;
    transform: scale(1.1);
  }

  @keyframes fadeIn {
    0% { opacity: 0; }
    100% { opacity: 1; }
  }

  @keyframes slideInUp {
    0% { transform: translateY(30px); opacity: 0; }
    100% { transform: translateY(0); opacity: 1; }
  }

  @keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
  }
</style>
</head>
<body>
  <%
  List<Course> list = (List<Course>) request.getAttribute("list");
  %>
  <div class="container">
      <div class="row justify-content-center">
          <div class="col-md-6">
              <div class="card mt-5 animate__animated animate__fadeInDown">
                  <div class="card-body animate__animated animate__pulse">
                      <h1 class="card-title text-center animate__animated animate__rubberBand">Select Course and Stream</h1>
                      <form action="/student/enroll" method="post" class="animate__animated animate__zoomIn">
                          <div class="form-group">
                              <select id="courseDropdown" name="course" class="form-control animate__animated animate__fadeInLeft">
                                  <option value="">Select a course</option>
                                  <%
                                  for (Course course : list) {
                                  %>
                                  <option value="<%=course.getId()%>"><%=course.getName()%></option>
                                  <%
                                  }
                                  %>
                              </select>
                          </div>
                          <div class="form-group">
                              <select id="streamDropdown" name="stream" class="form-control animate__animated animate__fadeInRight" disabled style="display: none">
                                  <option value="">Select a Stream</option>
                              </select>
                          </div>
                          <div class="form-group">
                              <button type="reset" id="cancelBtn" class="btn btn-warning btn-block animate__animated animate__bounceIn">Cancel</button>
                              <button type="submit" id="enrollBtn" class="btn btn-success btn-block animate__animated animate__bounceIn">Enroll</button>
                              <a href="/StudentHome.jsp" class="btn btn-info btn-block animate__animated animate__bounceIn">Back</a>
                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>
  </div>
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
                      streamDropdown.addClass('animate__animated animate__flipInY').show();
                      for(var i=0; i<streams.length; i++) {
                          streamDropdown.append('<option value="' + streams[i].id + '">' + streams[i].name + '</option>');
                      }
                  } else {
                      alert('No streams available for the selected course.');
                      streamDropdown.prop('disabled', true);
                  }
              });
          } else {
              $('#streamDropdown').hide();
          }
      });

      $('#cancelBtn').click(function() {
          $('#streamDropdown').empty().prop('disabled', true);
          $(this).effect("shake");
      });

      $('#enrollBtn').click(function() {
          $(this).effect( "bounce", "slow" );
      });
  });
  </script>
</body>
</html>
