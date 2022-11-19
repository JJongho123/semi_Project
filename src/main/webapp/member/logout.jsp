<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>

<%
session.invalidate();
response.sendRedirect("./main.kr");
System.out.println("로그아웃 완료~");
	%>
</body>
</html>