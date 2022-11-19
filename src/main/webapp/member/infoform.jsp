<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.login.db.*" %>


<%@ include file="../include/header.jsp" %>

<%
UserBean userdata = (UserBean) request.getAttribute("userdata");
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function usermodify() {
		modifyform.submit();
	}
</script>
<head>
<meta charset="UTF-8">
<title>fresh 유저 정보 조회</title>
<%@ include file="../include/menu.jsp" %>
</head>
<body>
<!-- 회원 수정   수정 예정@@@@@@-->
<form action="UserUpdateAction.kr" method="post" name="modifyform">
<input type="hidden" name="USER_ID" value="<%=id%>">
	<table>
		<tr align="center" valign="middle">
			<td colspan="5">회원수정 페이지</td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">이름</div>
			</td>
			<td><input name="USER_NAME" size="50" maxlength="100"
					value="<%=userdata.getUSER_NAME()%>"></td>
		</tr>
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">비밀번호</div>
			</td>
			<td><input name="USER_PW" size="50" maxlength="100"
					value="<%=userdata.getUSER_PW()%>"></td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">번호1</div>
			</td>
			<td><input name="USER_PHONE1" size="50" maxlength="100"
					value="<%=userdata.getUSER_PHONE1()%>"></td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">번호2</div>
			</td>
			<td><input name="USER_PHONE2" size="50" maxlength="100"
					value="<%=userdata.getUSER_PHONE2()%>"></td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">우편번호</div>
			</td>
			<td><input name="USER_ZIP_CODE" size="50" maxlength="100"
					value="<%=userdata.getUSER_ZIP_CODE()%>"></td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">주소</div>
			</td>
			<td><input name="USER_ADDR" size="50" maxlength="100"
					value="<%=userdata.getUSER_ADDR()%>"></td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">이메일1</div>
			</td>
			<td><input name="USER_EMAIL_F" size="50" maxlength="100"
					value="<%=userdata.getUSER_EMAIL_F()%>"></td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">이메일2</div>
			</td>
			<td><input name="USER_EMAIL_B" size="50" maxlength="100"
					value="<%=userdata.getUSER_EMAIL_B()%>"></td>
		</tr>
		
		<tr>
			<td height="16" style="font-family: 돋움; font-size: 12">
				<div align="center">이메일3</div>
			</td>
			<td><input name="USER_EMAIL_S" size="50" maxlength="100"
					value="<%=userdata.getUSER_EMAIL_S()%>"></td>
		</tr>
		
			<tr bgcolor="#cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><font size=2>
					<a href="javascript:usermodify()">[수정]</a>&nbsp;&nbsp; 
					<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</font></td>
			</tr>
		</table>
	</form>
</body>
</html>