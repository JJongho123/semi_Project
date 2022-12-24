<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 파일업로드 위한 라이브러리 임포트 -->
<%@ page import="net.firstpage.db.ProductDAO"%>
<%@ page import="java.io.File"%>
<!-- 파일 이름이 동일한게 나오면 자동으로 다른걸로 바꿔주고 그런 행동 해주는것 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!-- 실제로 파일 업로드 하기 위한 클래스 -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="net.firstpage.db.*"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>

<html>
<head>
<style type="text/css">
a {
	color: black;
	text-decoration: none;
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">



<%
int listcount = ((int) request.getAttribute("listcount"));
int nowpage = ((int) request.getAttribute("page"));
int maxpage = ((int) request.getAttribute("maxpage"));
int startpage = ((int) request.getAttribute("startpage"));
int endpage = ((int) request.getAttribute("endpage"));

List productList = (List) request.getAttribute("productlist");

//검색 기능용
String srchKey = (String) request.getAttribute("srchKey");
if (srchKey == null) {
	srchKey = "";
}

String srchFlds = (String) request.getAttribute("srchFlds");
if (srchFlds == null) {
	srchFlds = "";
}
%>
<title>상품 페이지</title>

<script type="text/javascript">
	function submitSrchForm(num) {
		document.srchForm.srchKey.value = document.srchForm.srchKey.value
				.trim();
		document.srchForm.num.value = num;
		document.srchForm.submit();
	}
	

	function resetSrchForm(num) {
		document.srchForm.srchFlds[0].selected = true;
		document.srchForm.srchKey.value = "";
	}
	
	
</script>


</head>
<body>
	<!-- 네비게이션 바 -->
	<%@ include file="../include/menu.jsp"%>

	<!-- 본문 영역 -->
	<div class="container">
	
	<bR><p class="text-center text-success fs-1 fw-BOLDER">SHOP</p><bR>

		<div align="right">

			<table>
			
				<!-- 검색기능추가 시작 -->
				
				<tr>
					<td colspan="4" align="center"><br /> &nbsp;&nbsp;&nbsp;
						<form name="srchForm" action="ProductList.bo" method="post">
							<select name="srchFlds">
								<option value="all"
									<%=srchFlds.equals("all") ? "selected='selected'" : ""%>>모두</option>
								<option value="name"
									<%=srchFlds.equals("name") ? "selected='selected'" : ""%>>상품명</option>
								
								<option value="con"
									<%=srchFlds.equals("con") ? "selected='selected'" : ""%>>내용</option>
							</select> <input type="text" name="srchKey" size="20" maxlength="50"
								value="<%=srchKey%>" /> <input type="button" value="검색"
								onClick="submitSrchForm(4)" />  <input type="hidden" name="num"
								value="">
						</form> 
						<br/></td>
				</tr>
				<!-- 검색기능끝 -->
				
				



			</table>
		</div>
	

			<hr style="border:3px; margin:3px; padding:0px">
		<div>
		<!--  admin 일때만 보이는 등록버튼 -->
		<c:if test="${sessionScope.id == 'admin1234'}">
			&nbsp;&nbsp;&nbsp;&nbsp;<span> <a class="btn btn-outline-danger btn-sm" href="./ProductAdd.bo" style="--bs-btn-border-color: var(--bd-light); font-size:15px; text-decoration:none">상품등록</font></a></span>
		
		</c:if>

		<span>
		
	
			&nbsp;&nbsp;	&#124; <a class="btn btn-outline-success btn-sm" onClick="submitSrchForm(1)" style="--bs-btn-border-color: var(--bd-light); font-size:15px; cursor: pointer;">&nbsp;&nbsp;낮은가격순&nbsp;&nbsp;</a>	&#124;&nbsp;
			 <a class="btn btn-outline-success btn-sm" onClick="submitSrchForm(2)" style="--bs-btn-border-color: var(--bd-light); font-size:15px; cursor: pointer;">높은가격순&nbsp;&nbsp;</a>	&#124;&nbsp;&nbsp;
			<a class="btn btn-outline-success btn-sm" onClick="submitSrchForm(3)" style="--bs-btn-border-color: var(--bd-light); font-size:15px; cursor: pointer;">신상품순&nbsp;&nbsp;</a>	&nbsp;&nbsp;
		</span>
		</div>
			<hr style="border:3px; margin:3px; padding:0px">
		




		<div class="container">
			<div class="row">
				<%
				for (int i = 0; i < productList.size(); i++) {
					ProductBean bl = (ProductBean) productList.get(i);
				%>


				<div class="col-lg-3 col-md-3">
					<div class="card my-3" style="width: 16rem;">
						<a href="./ProductDetail.bo?num=<%=bl.getPRO_NUM()%>"> <img
							src="${path}/productupload/<%=bl.getPRO_IMAGE() %>"
							class="card-img-top" alt="..."
							style="width: 100%; height: 300px;">
						</a>



						<div class="card-body">
							<h5 class="card-title"><%=bl.getPRO_NAME()%></h5>

							<p>
								<fmt:formatNumber pattern="#,###원"
									value="<%=bl.getPRO_PRICE()%>" />
							</p>



							<!--  admin한테만 보이는 삭제 목록 -->
							<c:if test="${sessionScope.id == 'admin1234'}">
								<a href="./ProductDelete.bo?num=<%=bl.getPRO_NUM()%>"
									class="btn btn-outline-danger btn-sm" >삭제</a>
								<a href="./ProductModify.bo?num=<%=bl.getPRO_NUM()%>"
									class="btn btn-outline-success btn-sm">수정</a>
							</c:if>

						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>

			<div align="center" >
				<tr>
					<td colspan="7" style="font-family: Tachoma; font-size: 10pt;">
						<% if (nowpage <= 1) {%> 
						&laquo; &nbsp; 
						<%} else {%> 
						<a href="./ProductList.bo?srchFlds=<%=srchFlds%>&srchKey=<%=srchKey%>&page=<%=nowpage - 1%>">&laquo;</a>&nbsp;
						<%	}%> 
<% for (int a = startpage; a <= endpage; a++) {
 	if (a == nowpage) {
 %> <%=a%> &nbsp; <%
 } else {
 %> 
 <a href="./ProductList.bo?srchFlds=<%=srchFlds%>&srchKey=<%=srchKey%>&page=<%=a%>"><%=a%></a>&nbsp; 
 <% } %>
 <% } %> 
 <% if (nowpage >= maxpage) {%>&raquo;
 <% } else {
 %> 
 <a href="./ProductList.bo?srchFlds=<%=srchFlds%>&srchKey=<%=srchKey%>&page=<%=nowpage + 1%>">&raquo;</a>
 <% } %>
					</td>
				</tr>
			</div>



			<form id='frm' name='frm' action='GET'>
				<input type='hidden' name='page' value='<%=listcount%>'> <input
					type='hidden' name='page' value='<%=page%>'> <input
					type='hidden' name='page' value='<%=maxpage%>'> <input
					type='hidden' name='page' value='<%=startpage%>'> <input
					type='hidden' name='page' value='<%=endpage%>'>
			</form>

		</div>

	</div>
	<%@ include file="../include/footer.jsp"%>

</body>
</html>





