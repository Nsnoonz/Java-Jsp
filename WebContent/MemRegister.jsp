<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="fonts.css">
<link rel="stylesheet" href="css/webstyle.css">
<link rel="shortcut icon" href="img/logo0.png">
<title>Bugket Hat Hat</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<script type="text/javascript">

</script>
<div class="container ct-bg " >

<div style="height:40px;"></div>

<center>
<p >Please Sign-up</p>
<form action="MemAddRegister.jsp"class=" text-left w-50" method="post" >
<div class="form-group ">
    <label>Email</label>
    <input name="Email" type="email" class="form-control"placeholder="Enter email" required="required">
     <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label>Password</label>
    <input name="password" type="password" class="form-control"  placeholder="Enter Password" required="required">
  </div>
  <div class="form-group ">
    <label>First name</label>
    <input type="text" name="memName" class="form-control" placeholder="Please input Firstname"required="required">
  </div>
 
 <div class="form-group ">
    <label>Last name</label>
     <input type="text" name="memSur"  class="form-control"placeholder="Please input Lastname"required="required">
  </div>
   <div class="form-group ">
    <label>Phone</label>
  <input type="number" name="phone" class="form-control"placeholder=" 08-xxxxxxxxxx  "required="required">
	</div>
  <div class="form-group ">
    <label>Address</label>
    
     <input type="text" name="Address"  class="form-control"placeholder="Please input Address"required="required">
  </div>
  <br>
   
  <button type="submit" class="btn btn-primary" >Submit</button>
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