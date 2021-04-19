<%@page import="DB.database"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="fonts.css">
<link rel="stylesheet" href="css/webstyle.css">
<link rel="shortcut icon" href="img/logo0.png">
<title>Bugket Hat Hat</title>
</head>
<jsp:include page="navbar.jsp"/>

<div class="container ct-bg thai">
		<div style="height:40px;"></div>
		
		<a href="profileMemEdit.jsp?MemberId=<%=session.getAttribute("memberID")  %>">แก้ไขข้อมูลส่วนตัว </a>

		<div style="height:10px;"></div>
	<%
	
	try {
		database.db();
		database.s = database.connect.createStatement();
		
		String sql = "SELECT * FROM  member WHERE memberID = '" + session.getAttribute("memberID") + "' ";
		ResultSet rec = database.s.executeQuery(sql);
		if(rec != null) {
			rec.next();
		%>
		
		<div >
		<table class =" table table-bordered w-50 " >
		  <tr>
		    <td  ><b> memberID</td>
		     <td><%=rec.getString("memberID")%></td>
		  </tr>
		  <tr>
		    <td ><b> Name </td>
		    <td><%=rec.getString("memName")%></td>
		  </tr>	
		  <tr>
		    <td ><b> Surname</td>
		      <td><%=rec.getString("memSur")%></td>
		   </tr>	  
		  <tr>
		    <td ><b> Phone</td>
			 <td><%=rec.getString("phone")%></td>
		  </tr>		
		  <tr>
		    <td ><b> Email</td>
			 <td><%=rec.getString("Email")%></td>
		  </tr>		
		  <tr>
		    <td ><b> Address</td>
			 <td><%=rec.getString("Address")%></td>
		  </tr>		
	       	<%}%>
	  	</table>  
	  	</div>   
	    <%	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		
		
	%>
	 </div>
</body>
</html>