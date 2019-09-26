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
<title>리뷰작성</title>
<style>
h1{
font-family: 'Turret Road', cursive;
}
</style>
</head>
<body>
<% 
String id = (String)session.getAttribute("id");
if (id==null) { %>
<script>alert('권한이 없어요!'); location.href = "main.jsp"; </script>
<% } %>
<br><br><br><br>
<form action="reviewcheck.jsp" method="post">
<div class="form-group col-md-3"  style="float:none; margin:0 auto">
<label>작성자 </label><%=id%><input type="hidden" name="id" value="<%=id%>"/>
<br>
<label>장소</label>
<select class="mdb-select md-form" name="place">
  <option value="타이베이101">타이베이101</option>
  <option value="먹거리시장">먹거리시장</option>
  <option value="예스진지">예스진지</option>
</select>
<br>
<label>내용</label> <textarea class="form-control rounded-0" name="content" rows="10"></textarea>
<br>
<label>별점</label>
<select class="mdb-select md-form" name="star">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
</select>
<br>
<input type="submit" value="작성" class="btn btn-light mb-2">
<input type="reset" value="취소" class="btn btn-light mb-2">
</div>
</form>
</body>
</html>