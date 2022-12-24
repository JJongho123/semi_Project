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

<!-- 게시판 리스트 -->
<div class = "mt-5" align="center">
<h4 class="text-secondary">후기 게시판</h4>
</div >

<table class="table mx-auto mt-5" style = "width: 65%;font-size: 10pt">
  <tr>
 	 	<th class = "text-secondary"  align="left" >
 			 글 개수 :  ${listcount}
 		 </th>
 	 
		<td align="right">
			<a class="btn btn-secondary btn-sm" href="./ReviewWrite.rv" role="button">[글쓰기]</a>
		</td>
	</tr>
</table>

<table class="table mx-auto table-hover" style = "width: 65%">
  <thead style="font-family: Tahoma;font-size: 11pt;">

    <tr class = "table-success text-secondary" align="center" valign="middle">
      <th scope="col"  width="5%">글 번호</th>
      <th scope="col"  width="50%">제목</th>
      <th scope="col"  width="5%">작성자</th>
      <th scope="col"  width="8%">등록일</th>
      <th scope="col"  width="5%">조회수</th>
    </tr>
  </thead>
  <tbody style="font-family: Tahoma;font-size: 11pt;">
  <%
		for(int i=0; i <reviewList.size(); i++){
			ReviewBean bl =(ReviewBean)reviewList.get(i);
	%>
    <tr align="center" valign="middle">
     <td><%=bl.getREVIEW_NUM() %></td>
     
     <td  class = "border" align="left" 
     onclick="location.href='./ReviewDetailAction.rv?num=<%=bl.getREVIEW_NUM()%>'"
     style = "cursor:pointer;">
     		
		<%=bl.getREVIEW_SUBJECT() %>
		
	</td>
	
	<td>
		<div align="center"><%=bl.getREVIEW_ID() %></div>
	</td>	
		
	<td class = "border">
		<div align="center"><%=bl.getREVIEW_DATE() %></div>
	</td>	
		
	<td>
		<div align="center"><%=bl.getREADCOUNT() %></div>
	</td>		
    </tr>
    <%} %>
  </tbody>
   
</table>

		<div align="center" style = "margin-bottom:100px; ">
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
			</div>

</body>
</html>