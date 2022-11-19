<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.qna.vo.*"%>
<%@ page import="net.qna.dao.*"%>
<%
	QNAVO qna = (QNAVO)request.getAttribute("qnadata");
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
</head>
<body>
	<div id="page">
		<%@ include file="../include/menu.jsp"%>
	<div id="wrap">
		<div class="container">
<!--  게시판 수정 -->
<table>
	<tr align="center" valign="middle">
		<td colspan="5">공 지 사 항</td>
	</tr>
	<tr>
		<td style="font-family:돋움; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋움; font-size:12">
		<%=qna.getQNA_SUBJECT() %>
		</td>
	</tr>
	
	<tr bgcolor="#828181">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋움;font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋움; font-size:12">
			<table style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋움; font-size:12">
					<%=qna.getQNA_CONTENT() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋움; font-size:12">
			<div align="center">첨부파일</div>
		</td>
		<td style="font-family:돋움; font-size:12">
		<%if(!(qna.getQNA_FILE()==null)){ %>
		<a href="./boardupload/<%=qna.getQNA_FILE() %>">
			<%= qna.getQNA_FILE() %>
		</a>
		<%} %>
		</td>
	</tr>
	<tr bgcolor="#828181">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size="3">
		<%-- 	<a href="./QnaReplyAction.um?num=<%=qna.getQNA_NUM() %>">
			[답변]
			</a>&nbsp;&nbsp;
		 --%>
		 
		 	<a href="./QnaModify.um?num=<%=qna.getQNA_NUM() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="./QnaDeleteAction.um?num=<%=qna.getQNA_NUM() %>">
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="./QnaList.um">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
	
</table>



</div>
</div>
</div>

</body>
</html>


















