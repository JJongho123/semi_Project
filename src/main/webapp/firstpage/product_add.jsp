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

<style>
	td .kbs {
		font-family:Arial Black;
		font-size:12pt; 
	
	}

</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>

<div align="center">
<form action="./ProductAddAction.bo" method="post" enctype="multipart/form-data" name="productform">


		
	<br><h3  style= "font-family:Arial Black;">상품등록</h3><br>

<table>



	
	<tr>
		<td class="kbs" height="16">
			<div align="left">* 상품명&nbsp;&nbsp;</div>
		</td>
		<td>
		
			<input name="PRO_NAME"class="form-control" type="text">
		</td>
	</tr>
	
	<tr>
		<td class="kbs" height="16">
			<div align="left" style="margin-right:50px;">* 보관온도</div>
		</td>
		<td>
			<input name="PRO_TEMP"class="form-control" type="text">
				
		</td>
	</tr>
	<tr>
		<td class="kbs" height="16">
			<div align="left" style="margin-right:50px;">* 중량</div>
		</td>
		<td>
			<input name="PRO_WEIGHT"class="form-control" type="text">
				
		</td>
	</tr>
	<tr>
		<td class="kbs">
			<div align="left" style="margin-right:50px;">* 조리시간</div>
		</td>
		<td>
			<input name="PRO_TIME"class="form-control" type="text">
				
		</td>
	</tr>
	
	
	

	<tr>
		<td class="kbs" height="16">
			<div align="left">* 가 격</div>
		</td>
		<td>
			
			<input name="PRO_PRICE"class="form-control" type="text" >
				
		</td>
	</tr>
	
	<tr>
		<td class="kbs" height="16">
			<div align="left">* 상품 설명</div>
		</td>
		<td>
			<textarea name="PRO_CONTENT" cols="55" rows="10" class="form-control"> </textarea>	
			
		</td>
	</tr>
	
 
	<tr>
		<td class="kbs" height="16">
			<div align="left">* 상품 사진</div>
		</td>
		

		<td>
			<input name="PRO_IMAGE" type="file" class="form-control"/>	
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

			<a class="btn btn-success" style="text-decoration:none; width:50%; margin-left:50px;" href="javascript:addProduct()">등록</a>&nbsp;&nbsp;
			<!-- <a class="btn btn-primary" style="text-decoration:none;" href="javascript:history.go(-1)">뒤로</a> -->
	
		</td>
	</tr>
</table>
</form>
</div>
<%@ include file="../include/footer.jsp"%>

</body>
</html>