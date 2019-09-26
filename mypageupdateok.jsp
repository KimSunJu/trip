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
<title>수정 완료</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String name = request.getParameter("name");
String price = request.getParameter("price");
String amount = request.getParameter("amount");
String place = request.getParameter("place");
String num = request.getParameter("num");

Connection con = null;
PreparedStatement pre = null;
String sql = "update shoptbl set name=?,price=?,amount=?,place=? where id=? and num=?";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, name);
	pre.setString(2, price);
	pre.setString(3, amount);
	pre.setString(4, place);
	pre.setString(5, id);
	pre.setString(6, num);
	n=pre.executeUpdate();
}catch(SQLException se){
	System.out.println(se.getMessage());
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
	alert("수정되었습니다.");
	location.href="mypage.jsp";
}else{
	alert("수정실패");
	history.go(-1);
}
</script>
</body>
</html>