<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="net.review.db.*"%>
 <%@ include file="../include/header.jsp"%>
	<%@ include file="../include/menu.jsp"%>
<%
ReviewBean board = (ReviewBean) request.getAttribute("reviewdata");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review게시판</title>
<style type="text/css">#none.onerror{
display : none;
}</style>
</head>
<body>
	<!-- 게시판 수정  -->
	<table class = "border" width = "500">
		<tr align="center" valign="middle">
			<td colspan="5" class = "border" ><%=board.getREVIEW_ID() %>님의 리뷰</td>
		</tr>
		
		<tr>
			<td  class = "border" style="font-family: 돋움; font-size: 12" height="16">
				<div align="center">제 목&nbsp;&nbsp;</div>
			</td>
			<td style="font-family: 돋움; font-size: 12"><%=board.getREVIEW_SUBJECT()%>
			</td>
		</tr>

		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px;"></td>
		</tr>

		<tr>
			<td class = "border" style="font-family: 돋움; font-size: 12;">
				<div align="center">내 용 : </div>
			</td>
			<td style="font-family: 돋움; font-size: 12">
				<table style="table-layout: fixed;">
					<tr>
						<td valign="top" style="font-family: 돋움; font-size: 12">
						<img width="180" height="240" id = "none" src="${path}/reviewupload/<%=board.getREVIEW_IMAGE()%>" alt = "none">
						<br>
						<%=board.getREVIEW_CONTENT()%>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class = "border" style="font-family: 돋움; font-size: 12">
				<div align="center">첨부 파일</div>
			</td>
			<td style="font-family: 돋움; font-size: 12">
				<%
				if (!(board.getREVIEW_IMAGE() == null)) {
				%> <a href="./reviewupload/<%=board.getREVIEW_IMAGE()%>"> <%=board.getREVIEW_IMAGE()%>
			</a> <%
 }
 %>
			</td>
		</tr>
		<tr bgcolor="#cccccc">
			<td colspan="2" style="height: 1px"></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="5"><font size="2">
					<a href="./ReviewModify.rv?num=<%=board.getREVIEW_NUM()%>"> [수정]</a>&nbsp;&nbsp;
					<a href="./ReviewDeleteAction.rv?num=<%=board.getREVIEW_NUM()%>">[삭제] </a>&nbsp;&nbsp; 
					<a href="./ReviewBoard.rv">[목록]</a>&nbsp;&nbsp;
			</font></td>
		</tr>
	</table>
	<!-- 게시판 수정 -->
</body>
</html>