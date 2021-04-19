<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="DB.database"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
		
		<%
            session.getAttribute("memberID");
            String productID = "";
            if (request.getParameter("productID") != null) {
            	productID = request.getParameter("productID");
                int amount = Integer.valueOf(request.getParameter("txtQTY"));
            }
            int price = 0;
            int sum = 0;
            int total_sum = 0;
            int maxID = 0;

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
            	String strQTY = request.getParameter("txtQTY");
            	database.db();
                
                database.s = database.connect.createStatement();
                
                String sql_receiptMaxID = "SELECT MAX(receiptID) AS maxID FROM `receipt`";
                database.s.execute(sql_receiptMaxID);
                ResultSet rec_receiptMaxID = database.s.executeQuery(sql_receiptMaxID);
                if (rec_receiptMaxID != null) {
                	rec_receiptMaxID.next();
                    maxID = rec_receiptMaxID.getInt("maxID") + 1;
                }
        %>
<center>
        <img class="card-img-top" style="height: 14rem; width: 14rem;" src="img/images.png" >
        <br>
        <label class="text-right">วันเวลาที่สั่งซื้อ</label> 
        
                            <%  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                                out.println(sdf.format(timestamp));
                                database.s = database.connect.createStatement();
                                String sql_Good = "SELECT * FROM product WHERE productID = " + productID + " ORDER BY productID ASC";
                                ResultSet rec_Good = database.s.executeQuery(sql_Good);
                            %>
                            
          <table  class="table w-75 table-borderless">
          					<tr style="font-size: 20px;">
          					<td>การสั่งซื้อสินค้าของ </td>
          					<td> MemberID : <%out.print(session.getAttribute("memberID")); %></td>
          					<td>Name : <%out.print(session.getAttribute("name")); %></td>
          				 
          					</tr>
                            <tr>
                                <th width="50"><div align="center"> ลำดับ </div> </th>
                                <th width="98"> ชื่อสินค้า </th>
                                <th width="97"> จำนวน</ </th>
                                <th width="97"> ราคา </th>
                            </tr>	
                            <%
                                while ((rec_Good != null) && (rec_Good.next())) {
                                	database.s = database.connect.createStatement();
                                    sum = rec_Good.getInt("unitprice") * Integer.valueOf(request.getParameter("txtQTY"));
                            %>
  <tr>
                                <td><div align="center">1</div></td>
                                <td><%=rec_Good.getString("productName")%></td>
                                <td><%=strQTY%> </td>
                                <td><%=rec_Good.getString("unitprice")%></td>
                            </tr>
                            <tr>
                               
                                <th> <div align="center"></div></th>
                                <th> <div align="center"></div></th>
                                 <th> ยอดสุทธิ </th>
                                <th><%=strQTY%> ชิ้น </th>
                            </tr>
                            <tr>
                                
                                <th> <div align="center"></div></th>
                                <th> <div align="center"></div></th>
                                <th> ราคารวม</div></th>
                                <th> <%= sum%> บาท</div></th>
                            </tr>
                            <tr>
                            <td></td>
                            <td></td>
                            <td width="50" >
                            <div align="center"><a href="Allproduct.jsp" class="btn btn-outline-success btn-block">ซื้อสินค้าเพิ่ม</a></div> </td></tr>
                        </table> 
                        </center>
              
        <%
                total_sum = total_sum + sum;

                String sql_receipt_DetAdd = "INSERT INTO `receiptdetails` (`receiptDetails`, `receiptID`, `productID`, `Quantity`, `Amount`) VALUES (NULL, '" + maxID + "', '" + productID + "', '" + strQTY + "', '" + sum + "')";
               database.s.execute(sql_receipt_DetAdd);
            }
           		 String sql_receiptAdd = "INSERT INTO `receipt` (`receiptID`, `memberID`, `Date`, `Total`, `total_price`) VALUES (NULL, '" +   session.getAttribute("memberID").toString() + "', CURRENT_TIMESTAMP, '" + strQTY + "', '" + total_sum + "')";
           	  database. s.execute(sql_receiptAdd);

        %>

        <%            } catch (Exception e) {
                // TODO Auto-generated catch block
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
	</div>

	
</body>
</html>