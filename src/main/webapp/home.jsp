<%@page import="org.jsp.college.dto.Course"%>
<%@page import="java.util.List"%>
<%@page import="org.jsp.college.dao.Course_dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    background-color: #f2f2f2;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
}

header {
    background-color: #333;
    color: white;
    padding: 20px;
    text-align: center;
    position: relative;
    animation: fadein 2s;
    width: 100%;
    max-width: 600px;
    border-radius: 10px;
    margin-bottom: 20px;
}

@keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

.main-content {
    margin: 20px;
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    animation: slidein 2s;
    width: 100%;
    max-width: 600px;
}

@keyframes slidein {
    from { transform: translateX(-50%); opacity: 0; }
    to   { transform: translateX(0); opacity: 1; }
}

button {
    background-color: #008CBA;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    transition-duration: 0.4s;
    cursor: pointer;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    animation: buttonfade 1s;
}

@keyframes buttonfade {
    from { opacity: 0; }
    to   { opacity: 1; }
}

button:hover {
    background-color: white; 
    color: black; 
}

.news {
    margin: 20px;
    animation: newsfade 2s;
    background: #333;
    color: white;
    padding: 20px;
    border-radius: 10px;
    width: 100%;
    max-width: 600px;
}

@keyframes newsfade {
    from { transform: translateY(30px); opacity: 0; }
    to   { transform: translateY(0); opacity: 1; }
}

.contact {
    margin: 20px;
    animation: contactfade 3s;
    background: #333;
    color: white;
    padding: 20px;
    border-radius: 10px;
    width: 100%;
    max-width: 600px;
}

@keyframes contactfade {
    from { transform: translateY(-30px); opacity: 0; }
    to   { transform: translateY(0); opacity: 1; }
}

footer {
    background-color: #333;
    color: white;
    padding: 20px;
    text-align: center;
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    animation: footerslide 2s;
}

@keyframes footerslide {
    from { bottom: -50px; }
    to { bottom: 0; }
}

</style>
</head>
<body>
<div class="container">
<header>
  <h1>Welcome to home page</h1>
  <h1>College Management System</h1>
</header>

<h1 style="color: green">${success}</h1>
<h1 style="color: red">${fail}</h1>

<%
if (session.getAttribute("admin") == null) {
%>
<main class="main-content">
  <a href="/admin_login.jsp"><button>Click here to login as Admin</button></a> <br>
  <a href="/studentlogin.jsp"><button>Click here to login as Student</button></a><br>
  <a href="/FacultyLogin.jsp"><button>Click here to login as Faculty</button></a><br>
  <a href="/non_staff_login.jsp"><button>Click here to login as non_staff login</button></a>
  <div class="advanced-graphic"></div>
</main>

<div class="news">
    <h2>Latest News</h2>
    <p>Stay updated with our latest news here.</p>
</div>

<div class="contact">
    <h2>Contact Us</h2>
    <p>Email: college@email.com</p>
    <p>Phone: 123-456-7890</p>
</div>

<%
} else {
%>
<%
if (session.getAttribute("message") != null) {
%>
<p class="msg">${message}</p>
<%
session.removeAttribute("message");
}
%>
<a href="/Add_course.jsp"><button>add course</button></a>
<a href="/admin/stream"><button>add stream</button></a>
<a href="/admin/update"><button>Update fee for course</button></a>
<a href="/logout"><button>Logout</button></a>

<%
}
%>

<footer>
  <p>&copy; 2023 College Management</p>
</footer>

<script>
document.querySelectorAll('button').forEach(item => {
  item.addEventListener('mouseover', event => {
    event.target.style.transform = 'scale(1.2)';
  })
  item.addEventListener('mouseout', event => {
    event.target.style.transform = 'scale(1.0)';
  })
})
</script>
</div>
</body>
</html>
