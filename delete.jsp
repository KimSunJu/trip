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
</head>
<body>
<%
Connection con = null;
PreparedStatement pre = null;

String num = request.getParameter("num");
int n = 0;
try{
	con = DBConnection.getCon();
	String sql = "delete from shoptbl where num=?";
	pre = con.prepareStatement(sql);
	pre.setString(1, num);
	
	n=pre.executeUpdate();
}catch(SQLException se){
	System.out.println(se.getMessage());
}finally{
	if(pre!=null)pre.close();
	if(con!=null)con.close();
}
%>
<script type="text/javascript">
if(<%=n%> > 0){
	alert("장바구니에서 삭제되었습니다.");
	location.href="mypage.jsp";
}else{
	alert("삭제실패");
	history.go(-1);
}
</script>
</body>
</html>