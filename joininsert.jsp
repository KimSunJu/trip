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
<title>회원가입</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String password=request.getParameter("password");
String name=request.getParameter("name");
String country=request.getParameter("country");

Connection con = null;
PreparedStatement pre = null;
String sql="insert into membertbl values(?,?,?,?)";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, id);
	pre.setString(2, password);
	pre.setString(3, name);
	pre.setString(4, country);
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
	alert("회원가입 완료");
	location.href="login.jsp";
}else{
	alert("회원가입실패");
	history.go(-1);
}
</script>
</body>
</html>