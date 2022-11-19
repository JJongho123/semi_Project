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
	<form action="ProductModifyAction.bo" method="post" name="modifyform">
		<input type="hidden" name="PRO_NUM"
			value="<%=productdata.getPRO_NUM()%>"> <input type="hidden"
			name="USER_ID" value="<%=id%>">

		<table>
			<tr align="center" valign="middle">
				<td colspan="5">상품 수정 페이지</td>
			</tr>
			<tr>
				<td height="16" style="font-family: 돋움; font-size: 12">
					<div align="center">상 품 명</div>
				</td>
				<td><input name="PRO_NAME" size="50" maxlength="100"
					value="<%=productdata.getPRO_NAME()%>"></td>
			</tr>
			
				<tr>
				<td height="16" style="font-family: 돋움; font-size: 12">
					<div align="center">상품가격</div>
				</td>
				<td><input name="PRO_PRICE" size="50" maxlength="100"
					value="<%=productdata.getPRO_PRICE()%>"></td>
			</tr>
			
			<tr>
				<td height="16" style="font-family: 돋움; font-size: 12">
					<div align="center">상품종류</div>
				</td>
				<td><input name="PRO_KIND" size="50" maxlength="100"
					value="<%=productdata.getPRO_KIND()%>"></td>
			</tr>
			
			
			<tr>
				<td style="font-family: 돋움; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="PRO_CONTENT" cols="67" rows="15"><%=productdata.getPRO_CONTENT()%></textarea>
				</td>
			</tr>
		

			<tr bgcolor="#cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>

			<tr align="center" valign="middle">
				<td colspan="5"><font size=2>
					<a href="javascript:productmodify()">[수정]</a>&nbsp;&nbsp; 
					<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</font></td>
			</tr>
		</table>
	</form>

</body>
</html>



</body>
</html>