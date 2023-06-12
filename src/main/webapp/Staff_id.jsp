<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Base64"%>
<%@page import="com.google.zxing.*"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="org.jsp.college.dto.Staff"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="assets/images/JSP.ico" type="image/x-icon">
<title>Staff ID</title>
<style>
body {
	background-color: #d7d6d3;
	font-family: 'verdana';
}

.id-card-holder {
	width: 300px;
	padding: 4px;
	margin: 0 auto;
	background-color: #1f1f1f;
	border-radius: 5px;
	position: relative;
}

.id-card {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	text-align: center;
	box-shadow: 0 0 1.5px 0px #b9b9b9;
}

.id-card img {
	margin: 0 auto;
}

.header img {
	width: 100px;
	margin-top: 15px;
}

.photo img {
	width: 80px;
	margin-top: 15px;
}

h2 {
	font-size: 15px;
	margin: 5px 0;
}

h3 {
	font-size: 12px;
	margin: 2.5px 0;
	font-weight: 300;
}

.qr-code img {
	width: 100px;
}

p {
	font-size: 10px;
	margin: 2px;
}

.button {
	background-color: #008CBA; /* Blue */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
</head>
<body>
	<%
	if (session.getAttribute("staff") != null) {
		Staff staff = (Staff) session.getAttribute("staff");

		// Generate barcode using name and DOB
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrCodeWriter.encode(staff.getName() + staff.getDob(), BarcodeFormat.QR_CODE, 200, 200);

		ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
		MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
		byte[] pngData = pngOutputStream.toByteArray();
		String qrCodeBase64 = Base64.getEncoder().encodeToString(pngData);
	%>
	<div class="id-card-holder">
		<div class="id-card">
			<div class="header">
				<img src="https://jspiders.com/_nuxt/img/logo_jspiders.3b552d0.png">
			</div>
			<div class="photo">
				<img
					src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(staff.getPicture())%>">
			</div>
			<h2><%=staff.getName()%></h2>
			<h3><%=staff.getDob()%></h3>
			<h3><%=staff.getDesignation()%></h3>
			<div class="qr-code">
				<img src="data:image/png;base64,<%=qrCodeBase64%>">
			</div>
			<hr>
			<p>
				<strong>Office</strong> Dr. Rajkumar Road, 
			<p>
			<p>
				Rajajinagar 3rd block, Bengaluru, India <strong>560001</strong>
			</p>
			<p>Ph:9738574069 | E-mail:jsp.info@gmail.com</p>
		</div>
	</div>
	<%
	} else {
	%>
	<h1>No staff details found.</h1>
	<%
	}
	%>
	<center>
	<a href="StaffHome.jsp"><button class="button">Back</button></a>
	</center>
</body>
</html>
