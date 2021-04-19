
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.database"%>

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
			try{
					
				database.db();
				database.s = database.connect.createStatement();
				String sql = "UPDATE member " +
						"SET memName = '"+ memName + "' " +
						", memSur = '"+ memSur + "' " +
						", Phone = '"+ phone + "' " +
						", Address = '"+ address + "' " +
						" WHERE memberID = '" + session.getAttribute("memberID") + "' ";		
				ResultSet rec = database.s.executeQuery(sql);
				response.sendRedirect("profileMem.jsp");
			}catch (Exception e) {				
				out.print("Register Faild");
			}
			
			database.close();

		%>
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>