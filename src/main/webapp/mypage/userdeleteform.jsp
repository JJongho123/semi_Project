<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="java.util.*" %>
        <%@ page import="java.sql.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import = "net.mypage.db.*" %>
<%@ page import = "net.mypage.action.*" %>

    
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
ul {
	list-style: none;
	padding-left: 0px;
}
</style>

</head>
<%@ include file="../include/menu.jsp"%>
<body>



<form action="./MemberDeleteAction.or" name = "Deleteform" method="post">
<div align="center"><h3><span>회원탈퇴</span></h3></div>

<table  align = "center" border = "1" >
<tr align="left" >
	<td>탈퇴 사유 :</td>
	<td>
		<input type="checkbox" name="USER_DELETE" checked/>배송주문 불만족&nbsp;
		<input type="checkbox" name="USER_DELETE"  />사이트 이용 불편&nbsp;
		<input type="checkbox" name="USER_DELETE"  />상품 품질 불만족&nbsp;
		<input type="checkbox" name="USER_DELETE"  />서비스 불만족
	</td>
</tr>
	<tr>
		<td>
			<div align="center">그 외 사유 :</div>
		</td>
		<td>
			<textarea name="USER_DELET_CONTENT" rows="15" cols="100"></textarea>
		</td>
	</tr>
</table>
<br>
<div align="center">회원탈퇴 시 회원님의 주문내역, 쿠폰, 적립금, SNS로그인 등 정보가 즉시 삭제되어 복구가 불가능하며 <br>
* 회원님의 SNS계정(kakao) 정보가 쇼핑몰에서 삭제됩니다.<br><br>
<input type = "radio" >예, 정보삭제에 동의합니다.<br><br>

			<a type = "button" href="javascript:Deleteform.submit()">확인</a>&nbsp;&nbsp;
			<a type = "button" href="javascript:Deleteform.reset()">취소</a>
</div>
</form>
</body>
</html>