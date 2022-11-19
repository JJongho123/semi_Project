<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.qna.vo.*"%>
<%@ page import="net.qna.dao.*"%>
<%
	//String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>공 지 사 항</title>

<%@ include file="../include/header.jsp"%>
	<script>
	function addboard(){
		boardform.submit();
	}
	</script>

</head>
<body>
	<div id="page">
		<%@ include file="../include/menu.jsp"%>
	<div id="wrap">
		<div class="container">


<!-- 게시판 등록 -->
<form action="./QnaAddAction.um" method="post" enctype="multipart/form-data" name="boardform">
<input type="hidden" name="QNA_ID" value="<%=id %>">
<table>
	<tr align="center" valign="middle">
		<td colspan="5">공 지 사 항 write</td>
	</tr>
	<tr>
		<td style="font-family:돋움; font-size:12" height="16">
			<div align="center">작성자</div>
		</td>
		<td>
			<%=id %>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋움; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="QNA_SUBJECT" type="text" size="50" maxlength="100" value=""/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋움; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="QNA_CONTENT" cols="67" rows="15"></textarea>
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋움; fontsize:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			<input name="QNA_FILE" type="file"/>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<a href="javascript:addboard()">[등록]</a> &nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
		
	
</table>
</form>
<!--  게시판 등록 -->


</div>
</div>
</div>
</body>
</html>
























