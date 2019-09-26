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
<title>로그인</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select id, password from membertbl where id=?";
	pre = con.prepareStatement(sql);
    pre.setString(1, id);
    rs = pre.executeQuery();
    if(rs.next()){
    String dbPass=rs.getString("password");
    if(password.equals(dbPass)){
    session.setAttribute("id", id);
    session.setAttribute("password", password);
   %>
   <script type="text/javascript">
   location.href="main.jsp";
   </script>
   <%
  }else{
   %>
   <script type="text/javascript">
   alert("로그인실패");
   history.back();
   </script><%
  }
 }else{
  %>
  <script type="text/javascript">
  alert("로그인실패");
  history.back();
  </script><%
 }
}catch (Exception e) {
 e.printStackTrace();
}finally{
 if(rs!=null)try{rs.close();}catch(SQLException ex){}
 if(pre!=null)try{pre.close();}catch(SQLException ex){}
 if(con!=null)try{con.close();}catch(SQLException ex){}
}
%>
</body>
</html>