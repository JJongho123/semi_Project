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
<title>상품 값전달 받기페이지</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>


	<div class="text-center">
		
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
		
		

	</div>

</body>
</html>