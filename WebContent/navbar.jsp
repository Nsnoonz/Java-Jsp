<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="fonts.css">
<link rel="stylesheet" href="css/webstyle.css">
<link rel="shortcut icon" href="img/logo0.png">

</head>
<nav class="navbar navbar-expand-lg navbar-dark thai "style="background-color:#333;">
  <a   href="index.jsp"  >  
  <img src="img/logo2.png"width="50" height="30" style="margin-top:-5px;" >
  </a>
  <span style="font-size:24px;font-family:'Sriracha'; color:#FC0; margin-left:5px;margin-right: 10px; ">
  Bucket Hat Hat
  </span>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto ">
    
    <!-- ส่วนของ คนทั่วไป -->
     <%  if (session.getAttribute("memberID")==null && session.getAttribute("id")==null ){    %>
      <li class="nav-item ">
        <a class="nav-link" href="index.jsp">หน้าหลัก </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="Allcategory.jsp"> สินค้าทั้งหมด </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="Contact.jsp"> ติดต่อเรา </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="MemRegister.jsp">สมัครสมาชิก </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="login.jsp">เข้าสู่ระบบ </a>
      </li>
      <%} %>
      
      
       <!-- ส่วนของ สมาชิก -->
     <%  if (session.getAttribute("memberID")!=null) {    %>
      <li class="nav-item ">
        <a class="nav-link" href="index.jsp">หน้าหลัก </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="Allcategory.jsp"> สินค้าทั้งหมด </a>
      </li>
       <li class="nav-item">
        <a class="nav-link " href="Allproduct.jsp">สั่งซื้อสินค้า </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="Contact.jsp"> ติดต่อเรา </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="logout.jsp">ออกจากระบบ </a>
      </li>
      <%} %>
      
      
         <!-- ส่วนของ admin --> 
         
		 <%  if (session.getAttribute("id")!=null){    %>
	<li class="nav-item ">
        <a class="nav-link" href="index.jsp">หน้าหลัก </a>
    </li>
    <li class="nav-item">
        <a class="nav-link " href="Allcategory.jsp"> สินค้าทั้งหมด </a>
    </li>
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  		Manage
        </a>
        
        <div class="dropdown-menu"  aria-labelledby="navbarDropdown">
          <a class="dropdown-item"  href="#">Product<span class="sr-only"></span></a>
           <a class="dropdown-item" href="#">Suppliers</a>
          
        <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Amoung Product</a>
        </div>
        
      </li>
       <li class="nav-item">
        <a class="nav-link " href="logout.jsp">ออกจากระบบ </a>
      </li>

     <%} %>
     
    </ul>
  </div>
  <span style="color: #FFF;">
  	<!-- member -->

		<%
			if (session.getAttribute("memberID") != null) {
		%>
		สวัสดีคุณ :  <%out.print(session.getAttribute("name"));
		%> <a style="color: #feeddd;"
			href="profileMem.jsp?MemberId=<%=session.getAttribute("memberID")%>">
			ข้อมูลส่วนตัว </a>

		<%
			}
		%>
		&emsp;

		<!--  Admin -->

		<%
			if (session.getAttribute("id") != null) {
		%>
		สวัสดี คุณ :
		<%
			out.print(session.getAttribute("name"));
		%>
		&emsp; สถานะ :
		<%
			out.print(session.getAttribute("status"));
			}
		%>
  </span>
</nav>

</html>

