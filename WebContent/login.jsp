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
<body>
<jsp:include page="navbar.jsp"/>


<div class="container ct-bg" >
<div style="height:40px;"></div>
<center>
<p >Please Login</p>

<form class=" text-left w-50" action="check_login.jsp" method="post">
  <div class="form-group ">
    <label>Email</label>
    <input name="Email" type="email" class="form-control"placeholder="Enter your email">
  </div>
  <div class="form-group">
    <label>Password</label>
    <input name="Password" type="password" class="form-control"  placeholder="Enter Password">
  </div>
   <button type="submit" class="btn btn-primary">Submit</button>
  <button type="reset" class="btn btn-secondary">Clear</button>
  </form>
</center>


</div>
<jsp:include page="footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
</body>
</html>