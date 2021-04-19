<%@page import="DB.database"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="fonts.css">
<link rel="stylesheet" href="css/webstyle.css">
<link rel="shortcut icon" href="img/logo0.png">
<title>Bugket Hat Hat</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<script type="text/javascript">
	</script>
	<div class="container ct-bg ">
		<div style="height: 40px;"></div>
		<center>
		<%
		try {
			database.db();
			database.s = database.connect.createStatement();
			String sql = "SELECT * FROM  member WHERE memberID = '" + session.getAttribute("memberID") + "' ";
			ResultSet rec = database.s.executeQuery(sql);
			if(rec != null) {
				rec.next();
			%>
			<p >แก้ไขข้อมูลส่วนตัว</p>
<form action="profileMemUpdate.jsp?memberID=<%=rec.getString("memberID")%>" class=" text-left w-50" method="post" >
  <div class="form-group ">
    <label>First name</label>
    <input type="text" name="memName" class="form-control" placeholder="Please input Firstname"value="<%=rec.getString("memName")%>">
  </div>
 
 <div class="form-group ">
    <label>Last name</label>
     <input type="text" name="memSur"  class="form-control"placeholder="Please input Lastname"value="<%=rec.getString("memSur")%>">
  </div>
   <div class="form-group ">
    <label>Phone</label>
  <input type="number" name="phone" class="form-control"placeholder=" 08-xxxxxxxxxx  "value="<%=rec.getString("phone")%>">
	</div>
  <div class="form-group ">
    <label>Address</label>
     <input type="text" name="Address"  class="form-control"placeholder="Please input Address"value="<%=rec.getString("Address")%>">
  </div>
  <br>
   
  <button type="submit" class="btn btn-primary" >Submit</button>
  <button type="reset" class="btn btn-secondary">Clear</button>
</form> 
		    <%
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				out.println(e.getMessage());
				e.printStackTrace();
			}
		%>

</center>
	</div>

	<jsp:include page="footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>