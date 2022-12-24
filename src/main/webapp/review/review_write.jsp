<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- <%
   	String user_id =(String)session.getAttribute("id");
   %> --%>
   <%@ include file="../include/header.jsp"%>
	
   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
crossorigin="anonymous">
<meta charset="UTF-8">
<title>MVC 게시판</title>
<script type="text/javascript">
	function addboard() {
		boardform.submit();
	}
</script>
</head>
<body>

 <div id="page">
      <%@ include file="../include/menu.jsp"%>
  <div id="wrap">
     <bR><p class="fw-bolder text-center text-success fs-1">REVIEW<bR><br>
  <div class="container" style="width:1100px">
<!--게시판 등록 -->
<form action="./ReviewAddAction.rv" method="post" enctype="multipart/form-data" name="boardform">
<input type="hidden" name="REVIEW_ID" value="<%=id%>">
<table class="table table-bordered text-center word-break:break-all">
	
	
	<tr>
		<td class="align-middle table-success" style="font-family:arial; fontsize:12" height="16">
			<div align="center" style="font-weight:bold;">글쓴이</div>
		</td>
		<td>
			<%=id %>
		</td>
	</tr>
	<tr>
		<td class="align-middle table-success" style="font-family:arial; fontsize:12" height="16">
			<div align="center" style="font-weight:bold">제 목</div>
		</td>
		<td>
			<input name="REVIEW_SUBJECT" type="text" size="50" maxlength="100"
				value=""/>
		</td>
	</tr>
	
	<tr>
		<td class="align-middle table-success" style="font-family:arial; fontsize:12;">
			<div align="center" style="font-weight:bold">내 용</div>
		</td>
		<td>
			<textarea name="REVIEW_CONTENT" cols="82" rows="15"></textarea>
		</td>
	</tr>
	
	
	<tr>
		<td class="align-middle table-success" style="font-family:arial; fontsize:12">
			<div align="center" style="font-weight:bold">파일 첨부</div>
		</td>
		<td>
			<input name="REVIEW_IMAGE" type ="file"/>
		</td>
	</tr>
	
	
	
	
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
	</table>

</form>
</div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" 
integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" 
crossorigin="anonymous">
</script>
<!-- 게시판 등록 -->
</body>
</html>