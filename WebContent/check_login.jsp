<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.database"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="fonts.css">
<link rel="shortcut icon" href="img/logo0.png">
<title>Bugket-Hat-Hat</title>
</head>
<body>
	<jsp:include page="navbar.jsp"/>
<div class="container ct-bg" >

	<div style="height: 40px;"></div>
	
	<%
		String Email = request.getParameter("Email");
		String Password = request.getParameter("Password");

		try {
			database.db();
			database.s = database.connect.createStatement();
			String sql = "SELECT * FROM member WHERE Email ='" + Email + "' AND password = '" + Password + "' ";
			ResultSet rec = database.s.executeQuery(sql);

			if (rec.next()) {
				session.setAttribute("memberID",rec.getString("memberID"));
				session.setAttribute("name",rec.getString("memName"));
				response.sendRedirect("index.jsp");
			} 
			else if(!rec.next()) {
				
			database.db();
			database.s = database.connect.createStatement();
			String sql1 = "SELECT * FROM Admin WHERE Email ='" + Email + "' AND Password = '" + Password + "' ";
			ResultSet rec1 = database.s.executeQuery(sql1);

			if (rec1.next()) {
				session.setAttribute("id",rec1.getString("AdminID"));
				session.setAttribute("name",rec1.getString("Name"));
				session.setAttribute("status",rec1.getString("status"));
				response.sendRedirect("index.jsp");
				
			} else {
				%>
				<div class ="text-center"  >
				<div style="color:red;">
				<%out.print("Username OR Password incorrect !");
				%>
				<br><br>
				</div>
				<p style="" >Please Login again</p>
				<br>
				<a href="login.jsp">
				<button type="submit" class="btn btn-primary" >Login</button>				
				</a>
				</div>
</div>
<jsp:include page="footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
</body>
</html>				
				<%
			}
				
			}
			
		} catch (Exception e) {
			
			

		}
	%>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>

