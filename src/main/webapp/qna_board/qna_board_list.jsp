<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.qna.dao.*" %>
<%@ page import="net.qna.vo.*" %>

<%
/*    String id = null;
   if(session.getAttribute("id") != null){
      id = (String)session.getAttribute("id");
   } */
   
   List qnaList = (List)request.getAttribute("qnalist");
   
   int listcount = ((Integer)request.getAttribute("listcount")).intValue();
   int nowpage = ((Integer)request.getAttribute("page")).intValue();
   int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
   int startpage = ((Integer)request.getAttribute("startpage")).intValue();
   int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
crossorigin="anonymous">
<meta charset="UTF-8">
<%@ include file="../include/header.jsp"%>
</head>
<body>
   <div id="page">
      <%@ include file="../include/menu.jsp"%>
   <div id="wrap">
   <bR><p class="fw-bolder text-center text-success fs-1">NOTICE<bR><br>
<div class="container">
   <table class="table table-hover text-center">
   <thead class="table-light">
   <tr class="table-success">
      <th colspan="4">
      <font size="3">공 지 사 항</font></th>
      <th colspan="1" align="center">
         <font size="2">글 개수 : ${listcount }</font>
      </th>
   </tr>
   </thead>
   <tbody>
   <tr align="center" valign="middle" bordercolor="#333333">
      <td style="font-family:Arial; font-size:10pt;" width="8%" height="26">
         <div align="center" >번호</div>
      </td>
      <td style="font-family: Tahoma; font-size:10pt;" width="50%">
         <div align="center">제목</div>
      </td>
      <td style="font-family: Tahoma; font-size:10pt;" width="14%">
         <div align="center">작성자</div>
      </td>
      <td style="font-family: Tahoma; font-size:10pt;" width="17%">
         <div align="center"></div>
      </td>
      <td style="font-family: Tahoma; font-size:10pt;" width="11%">
         <div align="center">조회수</div>
      </td>
   </tr>
   
   <%
      for(int i = 0; i < qnaList.size(); i++){
         QNAVO qv = (QNAVO)qnaList.get(i);
   %>
   
   <tr align="center" valign="middle" bordercolor="#333333"
      onmouseover="this.style.backgroundColor='#e3e3e3'"
      onmouseout="this.style.backgroundColor=''">
      <td height="23" style="font-family: Tahoma; font-size:10pt;">
         <%=qv.getQNA_NUM() %>
      </td>
      
      <td style="font-family: Tahoma; font-size:10pt;">
         <div align="left">
            <%if(qv.getQNA_RE_LEV() != 0){ %>
               <%for(int a=0; a<=qv.getQNA_RE_LEV() * 2; a++) { %>
               &nbsp;
               <%} %>
               ▶
               <%} else{ %>
               ▶
               <%} %>
               <a href="./QnaDetailAction.um?num=<%=qv.getQNA_NUM() %>">
                  <%=qv.getQNA_SUBJECT() %>
               </a>
         </div>
      </td>
      
      <td style="font-family: Tahoma; font-size:10pt;">
      
         <div align="center">
         <%if(qv.getQNA_ID().equals("admin1234")){ %>
         관리자
          <%} %>
          </div>
      </td>
      <td style="font-family: Tahoma; font-size:10pt;">
         <div align="center"><% //qv.getQNA_DATE() %></div>
      </td>
      <td style="font-family: Tahoma; font-size:10pt;">
         <div align="center"><%=qv.getQNA_READCOUNT() %></div>
      </td>
   </tr>
   <%} %>
</table>
      </div>   
   </div>   
   <p align="center" align="middle">
      <td colspan="7" style="font-family: Tahoma; font-size:10pt;">
         <%if(nowpage <= 1) {%>
         [이전]&nbsp;
         <%} else {%>
         <a href="./QnaList.um?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
         <%} %>
         
         <%for (int a=startpage ; a <= endpage ; a++){
            if(a == nowpage){%>
            [<%=a %>]
            <%} else {%>
            <a href="./QnaList.um?page=<%=a %>">[<%=a %>]</a>
            &nbsp;
            <%} %>
         <% }%>
         
         <%if(nowpage >= maxpage) {%>
         [다음]
         <%} else {%>
         <a href="./QnaList.um?page=<%=nowpage+1 %>">[다음]</a>
         <%} %>
      </td>
   </tr>
</p>
   <p align="center" valign="middle">
      <% if(id!=null && id.equals("admin1234")){   %>   
      <a href="./QnaWrite.um">[글쓰기]</a>
    <% }else{     %>        
       <a href="#" onclick="alert('admin1234 계정만 글쓰기가 가능합니다.'); return false;">[글쓰기]</a>       
      <% } %>
   </p>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" 
integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" 
crossorigin="anonymous">
</script>
</body>
</html>