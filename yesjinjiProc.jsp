<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="test.db.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>예스진지투어</title>
<script>
function checkBox() {
	var check_Box = document.getElementsByName("rdbtn"); //체크박스 name
	for (j = 0; j < check_Box.length; j++) {
	 var disign = document.getElementById([j+1]); // 보여질내용
	 if(check_Box[j].checked == true ){
	  disign.style.display = "block";
	 }else{
	  check_Box[j].checked = false;
	  disign.style.display = "none";
	 }
	 }
}
</script>
<style>
h1{
font-family: 'Turret Road', cursive;
}
</style>
</head>

<body>
<% 
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
int num=0;
%>
<script>
function shopcheck(){
	var id="<%=id%>";
	if(id==null){ 
	alert("로그인 후 구매 가능합니다.");
	location.href="login.jsp";
	}  
	else ShopForm.submit();
}
</script>
<br><br><br>
<div class="col-lg-6">
<img src="img/t2.jpg" class="img-thumbnail" alt="Cinque Terre" width="700" height="450"> 
</div>
<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select avg(star) from reviewtbl where place = '예스진지' group by place";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.print("평균별점 : " + rs.getString("avg(star)"));
	}
    }catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		try{
			if(rs!=null)rs.close();
			if(pre!=null)pre.close();
			if(con!=null)con.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
%>

<input type="radio" name="rdbtn" id="rdbtn1" value="1" onclick="checkBox()"/>후기보기
<br><br>
<div class="col-lg-6">
  <h4>가격정보</h4>           
<table class="table table-hover">
<thead>
<tr>
<th align = "center">교통수단</th>
<th align = "center">가격(1인당)</th>
<th align = "center">남은 수량</th>
</tr>
</thead>
<%
 con = null;
 pre = null;
 rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select name, price, 50-count(amount) as c_a from shoptbl where place='예스진지' group by name, price";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String way = rs.getString("name");
		String price = rs.getString("price");
		String c_a = rs.getString("c_a");
%>

<tr>
<td align = "center"><%=way%></td>
<td align = "center"><%=price%></td>
<td align = "center"><%=c_a%></td>
<%
	}
    }catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		try{
			if(rs!=null)rs.close();
			if(pre!=null)pre.close();
			if(con!=null)con.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
%>
</table>
</div>
<form id="ShopForm" action="yesjinjishop.jsp" method="post">
<input type="hidden" name="place" value="예스진지"/>
<input type="hidden" name="id" value="<%=id%>"/>
<input type="hidden" name="num" value="<%=num%>"/>
<br>
<label>티켓종류</label>
<select class="mdb-select md-form" name="name">
  <option value="버스">버스</option>
  <option value="택시">택시</option>
</select>
<br>
<label>수량</label>1<input type="hidden" name="amount" value="1"/>
<br><br>
<input type="button" value="장바구니" onclick="shopcheck()" class="btn btn-light mb-2">
<input type="reset" value="취소" class="btn btn-light mb-2">
</form>

<br><br><br><br><br><br><br><br><br><br><br>

<div id="1" style="display:none">
<center>
<div class="col-lg-6" style="float:none; margin:0 auto">
  <h4>후기</h4>           
  <table class="table table-hover">
<thead>
<tr>
<th align = "center">id</th>
<th align = "center">리뷰</th>
</tr>
</thead>
<%
 con = null;
 pre = null;
 rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select id, content from reviewtbl where place = '예스진지'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String rid = rs.getString("id");
		String content = rs.getString("content");
%>

<tr>
<td align = "center"><%=rid%></td>
<td align = "center"><%=content%></td>
<%
	}
    }catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		try{
			if(rs!=null)rs.close();
			if(pre!=null)pre.close();
			if(con!=null)con.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
%>
</table>
</div>
</div>

</body>
</html>