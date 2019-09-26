<%@page import="test.db.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>로그인</title>
<style>
h1{
font-family: 'Turret Road', cursive;
}
</style>
</head>
<body><br><br><br><br><br><br><br><br><br><br><br>
<form action="logincheck.jsp" method="post">
<div class="form-group col-md-3" style="float:none; margin:0 auto">
<label>아이디</label><input type="text" class="form-control" name="id">
<label>비밀번호</label><input type="password" class="form-control" name="password">
<br>
<input type="submit" value="로그인" class="btn btn-light mb-2">
<input type="reset" value="취소" class="btn btn-light mb-2">
</div>
</form>
</body>
</html>