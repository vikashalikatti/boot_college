<%@page import="org.jsp.college.dto.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Home</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- Animate CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<!-- Custom Styles -->
<style>
  body {
    background: linear-gradient(to right, #ff9966, #ff5e62);
    font-family: Arial, sans-serif;
    padding: 2rem;
    animation: fadeIn 2s;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  h1 {
    text-align: center;
    margin-bottom: 2rem;
    color: #fff;
    animation: animate__animated animate__rubberBand;
  }

  .welcome {
    color: #fff;
    font-size: 2rem;
    margin-bottom: 1rem;
    animation: animate__animated animate__bounceInDown;
  }

  .btn {
    width: 200px;
    height: 50px;
    margin: 20px auto;
    background-color: #4CAF50;
    color: #FFFFFF;
    text-align: center;
    border-radius: 30px;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    line-height: 50px;
    animation: animate__animated animate__zoomIn;
    text-decoration: none;
  }

  .btn:hover {
    background-color: #45a049;
    box-shadow: 0 15px 20px rgba(46, 229, 157,.4);
    color: #fff;
    transform: translateY(-7px);
  }

  @keyframes fadeIn {
    0% { opacity: 0; }
    100% { opacity: 1; }
  }
</style>
</head>
<body>
  <h1>${success}</h1>
  <h1>${fail}</h1>
  <%
  Student student = (Student) session.getAttribute("student");
  if (student == null) {
    request.setAttribute("fail", "Invalid Session Login Again");
    request.getRequestDispatcher("studentlogin.jsp").forward(request, response);
  } else {
  %>
  <h2 class="welcome">Welcome, <%=student.getName()%>!</h2>
  <%if (!student.isStatus()) {
  %>

  <a href="/student/course" class="btn animate__animated animate__swing">Enroll For Course</a>
  <%
  }
  %>
  <a href="/logout" class="btn animate__animated animate__tada">Logout</a>
  <%
  }
  %>
</body>
</html>
