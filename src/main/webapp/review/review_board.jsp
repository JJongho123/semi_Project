<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="net.review.db.*" %>
    
    <%
    	
		List reviewList = (List)request.getAttribute("reviewList");
		
		int listcount = ((Integer)request.getAttribute("listcount")).intValue();
		int nowpage = ((Integer)request.getAttribute("page")).intValue();
		int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
		int startpage = ((Integer)request.getAttribute("startpage")).intValue();
		int endpage = ((Integer)request.getAttribute("endpage")).intValue();
    %>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
<meta charset="UTF-8">
		<%@ include file="../include/menu.jsp"%>

<title>MVC 게시판</title>
</head>
<body>
<!-- 게시판 리스트 -->
<table align = "center" style = "border: 1px;">
	<tr align="center" valign="middle" bgcolor="#cccc66">
		<td colspan="3">리뷰 게시판</td>
		<td colspan="2" align="center">
			<font size="2">글 개수 : ${listcount}</font>
		</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family: Tahoma; font-size: 10pt;" width="8%" height="26">
			<div align="center">번호</div>
		</td>
		
		<td style="font-family: Tahoma; font-size: 10pt;" width="50%">
			<div align="center">제목</div>
		</td>
		
		
		<td style="font-family: Tahoma; font-size: 10pt;" width="14%">
			<div align="center">작성자</div>
		</td>
		
		
		<td style="font-family: Tahoma; font-size: 10pt;" width="17%">
			<div align="center">날짜</div>
		</td>
		
		
		<td style="font-family: Tahoma; font-size: 10pt;" width="11%">
			<div align="center">조회수</div>
		</td>
	</tr>
	<%
		for(int i=0; i<reviewList.size(); i++){
			ReviewBean bl =(ReviewBean)reviewList.get(i);
	%>
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='#a8Ffa8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family: Tahoma; font-size: 10pt">
			<%=bl.getREVIEW_NUM() %>
		</td>
		
		<td style="font-family: Tahoma;font-size: 10pt;">
			<div align="left">
				<a href="./ReviewDetailAction.rv?num=<%=bl.getREVIEW_NUM()%>">
				<%=bl.getREVIEW_SUBJECT() %>
				</a>
			</div>
		
		</td>
		
		<td style="font-family: Tahoma;font-size: 10pt;">
			<div align="center"><%=bl.getREVIEW_ID() %></div>
		</td>		
		<td style="font-family: Tahoma;font-size: 10pt;">
			<div align="center"><%=bl.getREVIEW_DATE() %></div>
		</td>		
		<td style="font-family: Tahoma;font-size: 10pt;">
			<div align="center"><%=bl.getREADCOUNT() %></div>
		</td>		
		
	</tr>
	<%} %>
	<tr align="center" height="20">
		<td colspan="7" style="font-family: tahoma;font-size: 10pt;">
			<%if(nowpage <= 1){%>
			[이전]&nbsp;
			<%}else{ %>
			<a href="./ReviewBoard.rv?num=<%=nowpage-1%>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a = startpage; a <= endpage; a++){
				if(a == nowpage) {%>
				[<%=a %>]
				<%}else{ %>
				<a href="./ReviewBoard.rv?page=<%=a%>">[<%=a %>]</a>
				&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowpage>=maxpage){ %>
			[다음]
			<%}else{ %>
			<a href="./ReviewBoard.rv?page=<%=nowpage+1 %>">[다음]</a>
			<%} %>
		</td>
	</tr>
	<tr align="right">
		<td colspan="5">
				<a href="./ReviewWrite.rv">[글쓰기]</a>
		</td>
	</tr>
</table>
</body>
</html>