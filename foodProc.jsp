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
<title>음식</title>
<style>
h1{
font-family: 'Turret Road', cursive;
}
</style>
</head>
<body>
<div class="col-lg-6" style="float:none; margin:0 auto">
<center><h4>먹거리정보보기</h4></center><br><br>   
<table class="table table-hover">
<thead>
<tr>
<th align = "center">음식</th>
<th align = "center">위치</th>
<th align = "center">가격</th>
</tr>
</thead>
<%
request.setCharacterEncoding("utf-8");
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select name, place, price from foodtbl order by name asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String name = rs.getString("name");
		String place = rs.getString("place");
		String price = rs.getString("price");
%>

<tr>
<td align = "center"><%=name%></td>
<td align = "center"><%=place%></td>
<td align = "center"><%=price%></td>
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
<br><br><br>
</body>
</html>