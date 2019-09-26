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
<style>
h1{
font-family: 'Turret Road', cursive;
}
</style>
</head>
<body>
<br>
<% 
String id = (String)session.getAttribute("id");

 if(id!=null){%>
     <%=id%>님 로그인중 <a href="logout.jsp">로그아웃</a>
    <% }%>
<center><h1>Let's travel to Taiwan</h1></center>
<br>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main.jsp">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="join.jsp">회원가입</a></li>
      <li><a href="login.jsp">로그인</a></li>
      <li><a href="mypage.jsp">마이페이지</a></li>
      <li><a href="taipei.jsp">타이베이101</a></li>
      <li><a href="yesjinji.jsp">예스진지투어</a></li>
      <li><a href="food.jsp">먹거리</a></li>
      <li><a href="review.jsp">리뷰</a></li>
    </ul>
  </div>
</nav>
</body>
</html>