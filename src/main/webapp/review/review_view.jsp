<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

</head>
<body>

	<div class="mt-5" align="center">
		<h4 class="fw-bolder text-center text-success fs-1">REVIEW</h4>
	</div>
	<div class="mt-5" align="center">
		<h6 class="text-secondary">리뷰 상세보기</h6>
	</div>

	<table class="table	table-borderless mx-auto mt-5" style="width: 50%; font-size: 10pt">
		<tr>
			<td width="10%" class = "table-success border-bottom" align="center">닉네임</td>
			<td class="border-top" align="left" ><%=board.getREVIEW_ID()%></td>
		</tr>
		<tr class = "border-bottom">
			<td class = "table-success" align="center">제목</td>
			<td align="left"><%=board.getREVIEW_SUBJECT()%></td>
		</tr>
	<!-- </table> -->
	<!-- <table class="table mx-auto" style="width: 60%;font-size: 10pt"> -->
	
		<tr class = "border-bottom">
		<td>
		</td>
			<td style="font-size: 12pt;" >
				<img style = "margin-bottom: 1cm; margin-top: 1cm" width="580" height="420" onerror="this.style.display='none'"
				 src="${path}/reviewupload/<%=board.getREVIEW_IMAGE()%>" alt="none">
				  <br> <%=board.getREVIEW_CONTENT()%>
			</td>
		</tr>	
			
		<tr class = "border-bottom">
			<td  class = "table-success " align="center" style=" font-size: 10pt">
				첨부 파일
			</td>
			<td style="font-family: 돋움; font-size: 12">
				<%if (!(board.getREVIEW_IMAGE() == null)) {%>
				<a href="./reviewupload/<%=board.getREVIEW_IMAGE()%>"> <%=board.getREVIEW_IMAGE()%></a> 
				<%} %>
			</td>
		</tr>
	
		<tr align="center" valign="middle">
			<td colspan="5"><font size="2"> 
				<a class="btn btn-secondary btn-sm" href="./ReviewModify.rv?num=<%=board.getREVIEW_NUM()%>" role="button">[수정]</a>
			<a class="btn btn-secondary btn-sm" href="./ReviewDeleteAction.rv?num=<%=board.getREVIEW_NUM()%>">[삭제]</a>
			<a class="btn btn-secondary btn-sm" href="./ReviewBoard.rv" role="button">[목록]</a>
			</font></td>
		</tr>
	</table>
	
	<!-- 게시판 수정 -->
</body>
</html>