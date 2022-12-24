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

	<div style="margin-left: 50px; margin-top: 100px; margin-right: 50px;">
		<div class="row g-0">
			<div class="col-md-8 col-lg-8" style="width: 600px; height: 700px;">
				<img style="width:700px; height:500px;"
					src="${path}/productupload/<%=product.getPRO_IMAGE()%>"
					class="img-fluid rounded-start" alt="...">

			</div>
			<div class="col-md-4 col-lg-4"
				style="margin-left: 70px; margin-right: 30px;">
				<div>
					<h2 style="font-weight: bold;">
						&nbsp;&nbsp;&nbsp;<%=product.getPRO_NAME()%></h2>
					<h3 style="font-weight: bold;">
						&nbsp;&nbsp;&nbsp;
						<fmt:formatNumber pattern="#,###원"><%=product.getPRO_PRICE()%></fmt:formatNumber>
					</h3>
					<br>
					<h3>&nbsp; ❄ &nbsp;&nbsp;&nbsp;⏰ &nbsp;&nbsp;&nbsp; 🍚</h3>

					<p style="font-weight: bold;">
						<small class="text-muted"><a style="color: #41A1DE">&nbsp;
								<%
								if (product.getPRO_TEMP() < 0) {
								%> 냉동보관 <%
								} else if (0 <= product.getPRO_TEMP() && product.getPRO_TEMP() <= 10) {
								%>냉장보관 <%
								} else {
								%> 실온보관 <%
								}
								%>

						</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=product.getPRO_TIME()%>분


							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=product.getPRO_WEIGHT()%>g</small>
					</p>

					<hr>
					<br>
					<p><%=product.getPRO_CONTENT()%></p>




					<hr>

					<p>
						<small class="text-muted">&nbsp;&nbsp;&nbsp;배송정보
							&nbsp;&nbsp;&nbsp;당일배송</small>
					</p>
					<p>
						<small class="text-muted">&nbsp;&nbsp;&nbsp;배송비
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,000원 (30,000원 이상 무료)</small>
					</p>
					
					
					<form action="./GoingCart.bo?num=<%=product.getPRO_NUM()%>"
						method="post" enctype="multipart/form-data" name="boardform">
						<input type="hidden" name="USER_ID" value="<%=id%>">
						<hr>
						<a class="btn btn-success btn-lg" id="cart"
								style="text-decoration: none; color: white; align: center;"
								href="javascript:addboard()">장바구니 </a>
								
						<a class="btn btn-danger btn-lg" id="like"
								style="text-decoration: none; color: white; align: center;"
								href="javascript:addlike()">찜하기 ♡</a>
							

					</form>
		
					<br>
					<br>
				</div>
			</div>
		</div>
	</div>




<script src="//code.jquery.com/jquery.min.js"></script>

<script>


	function addboard(){
	
			var returnVal = confirm("장바구니에 추가 하시겠습니까 ? ");
			if(returnVal== true){
			boardform.submit();
			
		}
	}    
		
		
</script>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>

