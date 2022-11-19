<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.login.db.*" %>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
<%@ include file="../include/menu.jsp"%>
<h1>회원정보 수정</h1>
<hr>
<form action="./UserUpdateAction.kr" method="post">
    아이디 : <input type="text" name="USER_ID" value="${id.USER_ID}" readonly="readonly"><br/>
    비밀번호 : <input type="text" name="USER_PW" value="${id.USER_PW}"><br/>
    번호1 : <input type="text" name="USER_PHONE1" value="${id.USER_PHONE1}"><br/>
    번호2 : <input type="text" name="USER_PHONE2" value="${id.USER_PHONE2}"><br/>
    우편번호 : <input type="text" name="USER_ZIP_CODE" value="${id.USER_ZIP_CODE}"><br/>
    주소 : <input type="text" name="USER_ADDR" value="${id.USER_ADDR}"><br/>
    이메일1 : <input type="text" name="USER_EMAIL_F" value="${id.USER_EMAIL_F}"><br/>
    이메일2 : <input type="text" name="USER_EMAIL_B" value="${id.USER_EMAIL_B}"><br/>
    이메일3 : <input type="text" name="USER_EMAIL_S" value="${id.USER_EMAIL_S}"><br/>
    <input type="submit" value="수정">&nbsp;<input type="reset" value="취소">
</form>
</body>
</html>