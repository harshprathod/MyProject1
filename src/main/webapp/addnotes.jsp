<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="alljs_css.jsp"%>
<title>Add Notes</title>
</head>
<body>
<div class="container"><%@include file="navbar.jsp"%>
<h1>Add New Note</h1>
<!--  -->
<form action="SaveNoteServlet" method="post">
  <div class="form-group">
    <label for="title">Note Title</label>
    <input required type="text" class="form-control" name ="title" id="title" aria-describedby="emailHelp" placeholder="Title" >
    
  </div>
  
  <div class="form-group">
    <label for="content">Note Content</label>
   	<textarea required id="content" placeholder="Start Typing Here..." name ="content" class="form-control" style="height: 300px;"></textarea>
  </div>
  <div class="form-group form-check">
  
  </div>
  <button id="smtbtn" type="submit" class="btn btn-primary"> Add </button>
</form>
</div>

</body>
</html>