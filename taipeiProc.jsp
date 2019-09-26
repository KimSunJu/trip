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
<title>타이베이101</title>
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
String id = (String)session.getAttribute("id");
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
<img src="img/t.jpg" class="img-thumbnail" alt="Cinque Terre" width="700" height="450"> 
</div>
<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select avg(star) from reviewtbl where place = '타이베이101' group by place";
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
  <h4>티켓정보</h4>           
  <table class="table table-hover">
<thead>
<tr>
<th align = "center">티켓</th>
<th align = "center">가격</th>
<th align = "center"></th>
</tr>
</thead>
<%
 con = null;
 pre = null;
 rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select way, price, etc from attractiontbl";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String way = rs.getString("way");
		String price = rs.getString("price");
		String etc = rs.getString("etc");
%>

<tr>
<td align = "center"><%=way%></td>
<td align = "center"><%=price%></td>
<td align = "center"><%=etc%></td>
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
<form id="ShopForm" action="taipeishop.jsp" method="post">
<input type="hidden" name="place" value="타이베이101"/>
<input type="hidden" name="id" value="<%=id%>"/>
<br>
<label>티켓종류</label>
<select class="mdb-select md-form" name="name">
  <option value="일반티켓">일반티켓</option>
  <option value="우대티켓">우대티켓</option>
  <option value="익스프레스티켓">익스프레스티켓</option>
  <option value="스카이라인460티켓">스카이라인460티켓</option>
</select>
<br>
<label>수량</label><input type="text" name="amount"/>
<br><br>
<input type="button" value="장바구니" onclick="shopcheck()" class="btn btn-light mb-2">
<input type="reset" value="취소" class="btn btn-light mb-2">
</form>

<br><br><br><br><br><br>
<div class="col-lg-6" style="float:none; margin:0 auto">
<h4>타이베이101 층수 용도</h4>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>층수</th>
        <th>용도</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>101층</td>
        <td>서밋101</td>
        <td>VIP클럽</td>
      </tr>
      <tr>
        <td>92~100층</td>
        <td>커뮤니케이션 홀</td>
        <td></td>
      </tr>
      <tr>
        <td>91층</td>
        <td>실외전망대</td>
        <td>스카이460티켓 구매 후 이용가능</td>
      </tr>
       <tr>
        <td>90층</td>
        <td>기계실</td>
        <td>스태프만 이용가능</td>
      </tr>
       <tr>
        <td>88~89층</td>
        <td>실내전망대</td>
        <td></td>
      </tr>
            <tr>
        <td>87층</td>
       <td>기계실</td>
        <td>스태프만 이용가능</td>
      </tr>
      <tr>
        <td>85~86층</td>
       <td>전망 레스토랑</td>
        <td></td>
      </tr>
      <tr>
        <td>59~84층</td>
       <td>고층부 오피스</td>
        <td></td>
      </tr>   
      <tr>
        <td>59~60층</td>
       <td>스카이로비</td>
        <td></td>
      </tr>
      <tr>   
        <td>37~58층</td>
       <td>중층부 오피스</td>
        <td></td>
      </tr>
      <tr>
     <td>35~36층</td>
       <td>스카이로비</td>
        <td></td>
      </tr>                   
      <tr>
     <td>35층</td>
       <td>생활편의시설</td>
        <td></td>
      </tr>  
      <tr>
        <td>9~34층</td>
       <td>저층부 오피스</td>
        <td></td>
      </tr>
       <tr>
        <td>6~8층</td>
       <td>기계실</td>
        <td></td>
      </tr>
      <tr>
        <td>1~5층</td>
       <td>타이베이101몰</td>
        <td></td>
      </tr>
     <tr>
        <td>지하5~1층</td>
       <td>푸드코트/지하주차장</td>
        <td></td>
      </tr>                    
    </tbody>
  </table>
</div>

<br><br><br><br>

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
	String sql = "select id, content from reviewtbl where place = '타이베이101'";
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