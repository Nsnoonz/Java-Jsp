<%@page import="java.sql.ResultSet"%>
<%@page import="DB.database"%>
<%@page import="DB.customer"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta name="viewport"content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="fonts.css">
<link rel="shortcut icon" href="img/logo0.png">
<title>Bugket-Hat-Hat</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<div class="container ct-bg thai">
	<div style="height: 40px;"></div>
	
<% 
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
response.setCharacterEncoding("UTF-8");
%>
		<%
			String memName = request.getParameter("memName");
			String memSur = request.getParameter("memSur");
			String phone = request.getParameter("phone");
			String address = request.getParameter("Address");
			String email = request.getParameter("Email");
			String password = request.getParameter("password");
			
			database.db();
			int check = customer.add(memName, memSur, phone, address, email, password);
			database.close();
			
			if(check == 1){
				out.print("คุณได้สมัครสมาชิกเรียบร้อยแล้วค่ะ");
				response.sendRedirect("profileMem.jsp");
			}else{
				out.print("กรุณาลองใหม่อีกครั้ง");
			}
				%>
			
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>