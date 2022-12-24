<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.firstpage.db.*"%>
<%
ProductBean productdata = (ProductBean) request.getAttribute("productdata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<%@ include file="../include/header.jsp" %>

<%@ include file="../include/menu.jsp" %>

<script type="text/javascript">
	function productmodify() {
		modifyform.submit();
	}
</script>
</head>
<body>
	<!--  게시판 수정 -->
	<div align="center">
	<form action="ProductModifyAction.bo" method="post" name="modifyform">
		<input type="hidden" name="PRO_NUM"
			value="<%=productdata.getPRO_NUM()%>"> <input type="hidden"
			name="USER_ID" value="<%=id%>">
			
			<br><h3  style= "font-family:Arial Black;">상품수정</h3><br>

		<table>
		
	<tr>
		<td style="font-family:Arial Black;font-size:12pt;" height="16">
			<div align="left">* 상품명&nbsp;&nbsp;</div>
		</td>
		<td>
		
			<input name="PRO_NAME"class="form-control" value="<%=productdata.getPRO_NAME()%>" >
		</td>
	</tr>
	
	
	
	<tr>
		<td style="font-family:Arial Black;font-size:12pt;" height="16">
			<div align="left" style="margin-right:50px;">* 보관온도</div>
		</td>
		<td>
			<input name="PRO_TEMP"class="form-control" value="<%=productdata.getPRO_TEMP()%>">
				
		</td>
	</tr>
	
		<tr>
		<td style="font-family:Arial Black;font-size:12pt;" height="16">
			<div align="left" style="margin-right:50px;">* 중량</div>
		</td>
		<td>
			<input name="PRO_WEIGHT"class="form-control" value="<%=productdata.getPRO_WEIGHT()%>">
				
		</td>
	</tr>
	<tr>
		<td style="font-family:Arial Black;font-size:12pt;" height="16">
			<div align="left" style="margin-right:50px;">* 조리시간</div>
		</td>
		<td>
			<input name="PRO_TIME"class="form-control" value="<%=productdata.getPRO_TIME()%>">
				
		</td>
	</tr>

	
	

	<tr>
		<td style="font-family:Arial Black;font-size:12pt;" height="16">
			<div align="left">* 가 격</div>
		</td>
		<td>
			
			<input name="PRO_PRICE"class="form-control" value="<%=productdata.getPRO_PRICE()%>" >
				
		</td>
	</tr>
	
	
		<tr>
		<td style="font-family:Arial Black;font-size:12pt;" height="16">
			<div align="left">* 상품 설명</div>
		</td>
		<td>
			<textarea name="PRO_CONTENT" cols="55" rows="10" class="form-control"><%=productdata.getPRO_CONTENT()%> </textarea>	
			
		</td>
	</tr>


	<tr>
		<td colspan="2">
		&nbsp;
		</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="2">
			<input type="hidden" name="USER_ID" value="<%=id %>">

			<a class="btn btn-success" style="text-decoration:none; width:50%; margin-left:50px;" href="javascript:productmodify()">수정</a>&nbsp;&nbsp;
			<!-- <a class="btn btn-primary" style="text-decoration:none;" href="javascript:history.go(-1)">뒤로</a> --> 
	
		</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../include/footer.jsp"%>

</body>
</html>

