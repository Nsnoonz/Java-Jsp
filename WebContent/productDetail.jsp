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
	<div class="container ct-bg thai">
		<div style="height: 40px;"></div>

		<%
			String productID = request.getParameter("productID");

			try {
				database.db();
				database.s = database.connect.createStatement();
				String sql = "SELECT * FROM  category,product WHERE product.categoryID=category.categoryID AND productID = '"
						+ productID + "'  ";
				ResultSet rec = database.s.executeQuery(sql);
				if (rec != null) {
					rec.next();
		%>
		<center>
<form action="receipt_det.jsp?productID=<%=rec.getString("productID")%>" method="post" >
 <table class=" table table-borderless w-50 ">
			<tr>
				<td> รหัสสินค้า </td>
				<td><%=rec.getString("productID")%></td>
			</tr>
			<tr>
				<td>ชื่อสินค้า </td>
				<td><%=rec.getString("productName")%></td>
			</tr>
			<tr>
				<td>รายละเอียดสินค้า </td>
				<td><%=rec.getString("productDetails")%></td>
			</tr>
			<tr>
				<td>แบรนด์ </td>
				<td><%=rec.getString("categoryName")%></td>
			</tr>
			<tr>
				<td>ราคา </td>
				<td><%=rec.getString("unitprice")%></td>
			</tr>
			<tr>
				<td>จำนวน </td>
				<td> <input type="text" class="col-md-2" name="txtQTY" value="1" size="2">&emsp; ชิ้น  </td>				
			</tr>
		</table>
  <button type="submit" class="btn btn-primary" >&emsp;Buy&emsp;</button>
</form> 
</center>




<!-- End container -->
	</div>
	<%}
		} catch (Exception e) {
			out.println(e.getMessage());
			e.printStackTrace();
		}

		try {
			if (database.s != null) {
				database.s.close();
				database.connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
</body>
</html>