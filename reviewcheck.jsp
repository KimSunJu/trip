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
<title>리뷰작성</title>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String content=request.getParameter("content");
String place=request.getParameter("place");
String star=request.getParameter("star");

Connection con = null;
PreparedStatement pre = null;
String sql="insert into reviewtbl values(?,?,?,?)";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, id);
	pre.setString(2, content);
	pre.setString(3, place);
	pre.setString(4, star);
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
	alert("작성 완료");
	location.href="main.jsp";
}else{
	alert("작성 실패");
	history.go(-1);
}
</script>
</body>
</html>