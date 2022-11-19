<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<%@ include file="../include/header.jsp" %>

<script>
function addProduct() {
	productform.submit();
}
</script>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<form action="./ProductAddAction.bo" method="post" enctype="multipart/form-data" name="productform">
<table>

	

		<tr align="center" valign="middle">
			<td colspan="2">상품등록</td>
		</tr>
	
	
	<tr>
		<td style="font-family:돋움;font-size:12pt;" height="16">
			<div align="center">상품명</div>
		</td>
		<td>
			<input name="PRO_NAME" type="text" size="10" maxlength="10" value=""/>	
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋움;font-size:12pt;" height="16">
			<div align="center">상품종류</div>
		</td>
		<td>
			<input name="PRO_KIND" type="text" size="10" maxlength="10" value=""/>	
		</td>
	</tr>
	
	

	<tr>
		<td style="font-family:돋움;font-size:12pt;" height="16">
			<div align="center">가 격</div>
		</td>
		<td>
			<input name="PRO_PRICE" type="text" size="50" maxlength="100" value=""/>	
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋움;font-size:12pt;" height="16">
			<div align="center">상품 설명</div>
		</td>
		<td>
			<textarea name="PRO_CONTENT" cols="67" rows="15"> </textarea>	
		</td>
	</tr>
	
 
	<tr>
		<td style="font-family:돋움;font-size:12pt;" height="16">
			<div align="center">상품 사진</div>
		</td>
		<td>
			<input name="PRO_IMAGE" type="file"/>	
		</td>
	</tr>
	
	
	<tr bgcolor="#cccccc">
		<td colspan="2" style="height: 1px">
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
			<a href="javascript:addProduct()">[등록]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
			
			
		</td>
	</tr>
</table>
</form>

</body>
</html>