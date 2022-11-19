<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.firstpage.db.*"%>


<%
ProductBean product = (ProductBean) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>


	<div class="text-center">
		<img src="${path}/productupload/<%=product.getPRO_IMAGE()%>"
			class="rounded float-start" alt="..."
			style="width: 500px; height: 500px;">
	</div>

	<div>
		<table style="margin-left: 100px;">

			<tr>
				<td style="font-family: 돋움; font-size: 12" height="16">
					<div align="center">상품명&nbsp;&nbsp;</div>
				</td>

				<td style="font-family: 돋움; font-size: 12"><%=product.getPRO_NAME()%>
				</td>
			</tr>
			
			<tr>
				<td style="font-family: 돋움; font-size: 12" height="16">
					<div align="center">상품가격&nbsp;&nbsp;</div>
				</td>

				<td style="font-family: 돋움; font-size: 12"><%=product.getPRO_PRICE()%>
				</td>
			</tr>
			
			<tr>
				<td style="font-family: 돋움; font-size: 12" height="16">
					<div align="center">상품종류&nbsp;&nbsp;</div>
				</td>

				<td style="font-family: 돋움; font-size: 12"><%=product.getPRO_KIND()%>
				</td>
			</tr>
		

			<tr>
				<td style="font-family: 돋움; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td style="font-family: 돋움; font-size: 12">
					<table style="table-layout: fixed">
						<tr>
							<td valign=top style="font-family: 돋움; font-size: 12"><%=product.getPRO_CONTENT()%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
			
<script>
	function addboard(){
		boardform.submit();
	}
</script>
		
		<!--  id값 여기까지는 넘어옴 -->
		<h2><%=id %></h2>
		<form action="./GoingCart.bo?num=<%=product.getPRO_NUM()%>" method="post" enctype="multipart/form-data" name="boardform">
			<input type="hidden" name="USER_ID" value="<%=id %>">
			<input type="hidden" name="PRO_NUM" value="<%=product.getPRO_NUM() %>">
			<input type="hidden" name="PRO_NAME" value="<%=product.getPRO_NAME() %>">
			<input type="hidden" name="PRO_KIND" value="<%=product.getPRO_KIND() %>">
			<input type="hidden" name="PRO_PRICE" value="<%=product.getPRO_PRICE() %>">
			<input type="hidden" name="PRO_CONTENT" value="<%=product.getPRO_CONTENT() %>">
			<input type="hidden" name="PRO_IMAGE" value="<%=product.getPRO_IMAGE() %>">
		<a href="javascript:addboard()"> 장바구니추가 </a>
	
		</form>
	
	</div>

</body>
</html>