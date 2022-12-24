<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="net.qna.vo.*"%>
<%@ page import="net.qna.dao.*"%>
<%
//String id = (String) session.getAttribute("id");
QNAVO qna = (QNAVO) request.getAttribute("qnadata");
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
<script type="text/javascript">
   function modifyboard() {// 여기 68번 끝
      modifyform.submit();
   }
</script>


<%@ include file="../include/header.jsp"%>
</head>
<body>
   <div id="page">
      <%@ include file="../include/menu.jsp"%>
   <div id="wrap">
   <bR><p class="fw-bolder text-center text-success fs-1">NOTICE<bR><br>
      <div class="container" style="width:1100px">



   <!--  게시판 수정 -->
   <form action="QnaModifyAction.um" method="post" name="modifyform">
      <input type="hidden" name="QNA_NUM"
         value="<%=qna.getQNA_NUM()%>"> <input type="hidden"
         name="QNA_ID" value="<%=id%>">

      <table class="table table-bordered text-center">
         
         <tr>
            <td class="align-middle table-success" height="16" style="font-family: arial; font-size: 12">
               <div align="center" style="font-weight:bold">제 목</div>
            </td>
            <td><input name="QNA_SUBJECT" size="80" maxlength="100"
               value="<%=qna.getQNA_SUBJECT()%>"></td>
         </tr>
         <tr>
            <td class="align-middle table-success" style="font-family: arial; font-size: 12">
               <div align="center" style="font-weight:bold">내 용</div>
            </td>
            <td><textarea name="QNA_CONTENT" cols="82" rows="15"><%=qna.getQNA_CONTENT()%></textarea>
            </td>
         </tr>
         <%
         if (!(qna.getQNA_FILE() == null)) {
         %>
         <tr>
            <td class=align-middle style="font-family: arial; font-size: 12">
               <div align="center" style="font-weight:bold">파일 첨부</div>
            </td>
            <td>&nbsp;&nbsp;<%=qna.getQNA_FILE()%>
            </td>
         </tr>
         <%
         }
         %>

      </table>
      <p align="center" valign="middle" font-family:arial;">
      <a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; 
      <a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
   </p>
   </form>


</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" 
integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" 
crossorigin="anonymous">
</script>
</body>
</html>