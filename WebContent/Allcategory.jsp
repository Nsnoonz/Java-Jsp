<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="DB.database"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="fonts.css">
<link rel="stylesheet" href="css/webstyle.css">
<link rel="shortcut icon" href="img/logo0.png">
<title>Bugket Hat Hat</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container ct-bg thai"><div style="height: 40px;"></div>
<p style="font-size: 24px;"class="text-center"> สินค้าทั้งหมด  </p>
<center>
<div class="table-responsive table-borderless">
<%	database.db();
	Connection connect = null;
	Statement s = null;
	try{
		database.s = database.connect.createStatement();
		String sql = "SELECT * FROM category ORDER BY categoryID ASC";
		ResultSet rec = database.s.executeQuery(sql);
%>
		<table class="table w-50 ">
    	<tr>
		<th scope="col">Category</th>
    	</tr>
    	<%while((rec!=null) && (rec.next())) { %>
    	<tr>
    	<td><a href="category.jsp?categoryID=<%=rec.getString("categoryID")%>"><%=rec.getString("categoryName")%></a></td>
   		</tr>
   		<%}%>
		</table>
		
		</div>



</center>
 <%	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</body>
</html>