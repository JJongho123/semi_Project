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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
crossorigin="anonymous">
<%@ include file="../include/header.jsp"%>
</head>
<body>
   <div id="page">
      <%@ include file="../include/menu.jsp"%>
   <div id="wrap">
   <bR><p class="fw-bolder text-center text-success fs-1">NOTICE<bR><br>
      <div class="container" style="width:1100px">
<!--  게시판 수정 -->
<table class="table table-bordered text-center">
   <tr>
      <td class="align-middle table-success" style="font-family:arial; font-size:12" height="16" width="15%">
         <div align="center" style="font-weight:bold">제 목</div>
      </td>
      <td style="font-family:arial; font-size:12" width="85%">
      <%=qna.getQNA_SUBJECT() %>
      </td>
   </tr>
   <tr>
      <td class="align-middle table-success" style="font-family:arial;font-size:12;"width="15%">
         <div align="center" style="font-weight:bold">내 용</div>
      </td>
      <td style="font-family:arial; font-size:12" width="85%">
         <table>
            <tr>
               <td valign=top style="font-family:arial; font-size:12">
               <%=qna.getQNA_CONTENT() %>
               </td>
            </tr>
         </table>
      </td>
   </tr>
   
   <tr>
      <td class="align-middle table-success" style="font-family:arial; font-size:12">
         <div align="center" style="font-weight:bold">첨부파일</div>
      </td>
      <td style="font-family:arial; font-size:12">
      <%if(!(qna.getQNA_FILE()==null)){ %>
      <a href="./boardupload/<%=qna.getQNA_FILE() %>">
         <%= qna.getQNA_FILE() %></a>
      
      <%} %>
      </td>
   </tr>
</table>
<p align="center" align="middle">
   <td colspan="5">
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
</p>


</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" 
integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" 
crossorigin="anonymous">
</script>
</body>
</html>