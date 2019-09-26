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
<title>타이페이쇼핑</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String name=request.getParameter("name");
String place=request.getParameter("place");
String account_1=request.getParameter("amount");
int amount = Integer.parseInt(account_1);
int price=0;

if(name.equals("일반티켓")){
	price=24000;
}else if(name.equals("우대티켓")){
	price=21600;
}else if(name.equals("익스프레스티켓")){
	price=48000;
}else if(name.equals("스카이라인460티켓")){
	price=108000;
}

Connection con = null;
PreparedStatement pre = null;
String sql="insert into shoptbl(id,name,price,amount,place) values(?,?,?,?,?)";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, id);
	pre.setString(2, name);
	pre.setInt(3, price);
	pre.setInt(4, amount);
	pre.setString(5, place);
	n=pre.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
}finally{
try{
	if(pre!=null)pre.close();
	if(con!=null)con.close();
}catch(SQLException se){
	System.out.println(se.getMessage());
}
}
%>

<script type="text/javascript">
if(<%=n%> > 0){
	alert("장바구니에 담음.");
	location.href="mypage.jsp";
}else{
	alert("실패");
	history.go(-1);
}
</script>
</body>
</html>