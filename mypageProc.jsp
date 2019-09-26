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
<title>마이페이지</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");

if (id==null) { %>
<script>alert('로그인 후 이용하세요.'); location.href = "login.jsp"; </script>
<% } %>

<div class="col-lg-6" style="float:none; margin:0 auto">        
<table class="table table-hover">
<thead>
<tr>
<th>수단</th>
<th>가격</th>
<th>수량</th>
<th>명소</th>
<th align = "center"><a href="alldelete.jsp?id=<%=id%>">장바구니비우기</a></th>
</tr>
</thead>
<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select name, price, amount, place,num from shoptbl where id=?";
	pre = con.prepareStatement(sql);
	pre.setString(1, id);
	rs = pre.executeQuery();
	
	while(rs.next()){
			String name = rs.getString("name");
			String price = rs.getString("price");
			String amount = rs.getString("amount");
			String place = rs.getString("place");
			String num = rs.getString("num");
%>
<form method="post" action="mypageupdateok.jsp">
<input type="hidden" name="num" value="<%=num%>"/>
<tr>
<td align = "center"><%=name%><input type="hidden" name="name" value="<%=name%>"/></td>
<td align = "center"><%=price%><input type="hidden" name="price" value="<%=price%>"/></td>
<td align = "center"><input type="text" name="amount" value="<%=amount%>"/><button type="submit" value="수정">수정</button></td>
<td align = "center"><%=place%><input type="hidden" name="place" value="<%=place%>"/></td>
<td align = "center"><a href="delete.jsp?num=<%=num%>">삭제</a></td>
</tr>
</form>
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
     
<table class="table">
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select sum(price*amount) as total from shoptbl where id=?";
	pre = con.prepareStatement(sql);
	pre.setString(1, id);
	rs = pre.executeQuery();
	
	while(rs.next()){
			String total = rs.getString("total");
%>
<tr>
<td>총가격</td>
<td><%=total%></td>
</tr>
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

</body>
</html>