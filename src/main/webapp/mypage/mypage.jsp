<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.io.*" %>
    
<%
   String id = null;
   if(session.getAttribute("id") != null){
	   id = (String)session.getAttribute("id");
   }
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
ul {
	list-style: none;
	padding-left: 0px;
}
</style>
</head>
<body>

	<div>
		<h2 style="">MY PAGE</h2>
		<br>
		<h3>나의 정보</h3>

		<ul>
			<li><a href="./UserInfoAction.kr?id=<%=id%>"class="btn btn-primary">회원 수정</a></li>
			<li><a href="./MemberDelete.or">회원 탈퇴</a></li>
		</ul>
		<br>

		<h3>나의 활동</h3>

		<ul>
			<li><a href="./############">1:1 문의</a></li>
			<li><a href="./ReviewBoard.rv">나의 후기</a></li>
		</ul>
	</div>
<hr>

</body>
</html>