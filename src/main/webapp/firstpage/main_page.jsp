<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="net.firstpage.db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<meta charset="UTF-8">

<% 
List<ProductBean> mainlist = (List<ProductBean>)request.getAttribute("mainlist");
%>

<title>메인화면</title>

<%@ include file="../include/header.jsp"%>

</head>
<body>
	<div id="page">
		<%@ include file="../include/menu.jsp"%>
		<!-- 내 배포주소 확인하기 -->
		<%-- <%=request.getRealPath("/") %> --%>


	<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<%=request.getContextPath()%>/images/fresh_11.png" class="d-block w-100">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/bg_brand_main.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath()%>/images/bg_brand_main2.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
	
		
		<div class="row" style="margin:30px;">
			<h3 align="center" style="font-weight: bold;"  > New </h3>
				<%
				for (int i = 0; i < mainlist.size(); i++) {
					ProductBean ml = (ProductBean) mainlist.get(i);
				%>


				<div class="col-lg-3 col-md-3" >
					<div class="card my-3" style="width: 16rem;">
						<a href="./ProductDetail.bo?num=<%=ml.getPRO_NUM()%>"> <img
							src="${path}/productupload/<%=ml.getPRO_IMAGE() %>"
							class="card-img-top" alt="..."
							style="width: 100%; height: 250px;">
						</a>



						<div class="card-body">
							<h5 class="card-title"><%=ml.getPRO_NAME()%></h5>

							<p>
								<fmt:formatNumber pattern="#,###원"
									value="<%=ml.getPRO_PRICE()%>" />
							</p>


						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		
		


<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>
