<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   String id = null;
   if(session.getAttribute("id") != null){
      id = (String)session.getAttribute("id");
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>menu</title>
<%@ include file="../include/header.jsp"%>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg"
	color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

</head>
<body>
	
		<header 
			class="d-flex flex-wrap justify-content-center py-3 border-bottom">
			<a href="<%=request.getContextPath()%>/Mainpage.bo"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
				<span class="fs-4">&nbsp; Fresh </span>
				
			</a>

			<ul class="nav nav-pills">

				<li class="nav-item"><a href="./ProductList.bo" class="nav-link">SHOP</a></li>
				<li class="nav-item"><a href="./QnaList.um" class="nav-link">NOTICE</a></li>


				<c:if test="${sessionScope.id != null }">
					<!--  로그인페이지랑 연동되면 변수명이랑 맞춰보기 -->


					<li class="nav-item"><a href="./UserLogout.kr" class="nav-link">LOG
							OUT</a></li>
					<li class="nav-item"><a class="nav-link"><%=id %>님 반갑습니다.</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> MY MENU </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="./mypage.or">MY PAGE</a></li>

							<li><a class="dropdown-item" href="주문페이지 링크">ORDER</a></li>
							<li><a class="dropdown-item" href="./GoingCartum.bo">🛒CART</a></li>
							

							<li><hr class="dropdown-divider"></li>

						</ul></li>

					<!-- 로그인 상태 -->
				</c:if>





				<c:if test="${sessionScope.id == null}">
					<li class="nav-item"><a href="./UserLogin.kr" class="nav-link">LOG
							IN</a></li>
					<li class="nav-item"><a href="./UserJoin.kr" class="nav-link">CREATE
							ACCOUNT</a></li>
				</c:if>
			<li class="nav-item"><a href="./firstpage/kakaomap_page.jsp" class="nav-link">WAY TO COME</a></li>

			</ul>
		</header>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>