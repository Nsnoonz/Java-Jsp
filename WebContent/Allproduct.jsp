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

<% String keyword = "";
if(request.getParameter("txtKeyword") != null) {
keyword = request.getParameter("txtKeyword");
}
%>
<center>

ค้นหาสินค้าเพื่อสั่งซื้อ

<br>    
<br>
<div class="w-50" style="padding-left:150px;">
 <form class="form-inline my-2 my-lg-0 "  method="get" action="Allproduct.jsp">
      <input class="form-control mr-sm-2 " type="search" placeholder="Search" aria-label="Search"
       name="txtKeyword" type="text" id="txtKeyword" value="<%=keyword%>">
        <br>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
</div>

<%


try {
	database.db();
	
	database.s = database.connect.createStatement();
	String sql = "SELECT * FROM  product,category WHERE product.categoryID = category.categoryID AND  productName  like '%" +  keyword + "%' " +"  ORDER BY productID ASC";
	ResultSet rec = database.s.executeQuery(sql);
	%>
<br><br>
<table class =" table table-bordered w-75 " >
		  <tr class="text-center">
		    <td  > รหัสสินค้า </td>
		    <td > ชื่อสินค้า </td>
		    <td >รายละเอียดสินค้า </td>
		    <td > แบรนด์ </td>
		    <td > สั่งซื้อ </td>
		  </tr>
		  <%while((rec!=null) && (rec.next())) { %>
		  <tr>
		     <td class="text-center"><%=rec.getString("productID")%></td>
		    <td><%=rec.getString("productName")%></td>
		     <td><%=rec.getString("productDetails")%></td>
		      <td class="text-center"><%=rec.getString("categoryName")%></td>
		 <td class="text-center">
		 <a href="productDetail.jsp?productID=<%=rec.getString("productID")%>" class="btn btn-primary" >Buy</a>
		 </td>
		  </tr>	
		   	<%}%>
	  	</table>  


 <%	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(database.s!=null){
				database.s.close();
				database.connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
	</center>
<!-- end container -->
</div>

<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>