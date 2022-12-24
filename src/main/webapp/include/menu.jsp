<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	 <%@ page import="net.login.db.*"%> 
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


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<%@ include file="../include/header.jsp"%>
<!-- Bootstrap core CSS --> 
</head>
<body>
<nav class="nav justify-content-end" style = "border-bottom: solid 1px; border-bottom-color:#E0E0E0;">
    <a class="btn btn-outline-success btn-sm" href="./ProductList.bo" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >SHOP</a>
    <a class="btn btn-outline-success btn-sm" href="./QnaList.um" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >NOTICE</a>
    
	<c:if test="${sessionScope.id != null }">
    <a class="btn btn-outline-success btn-sm" href="./UserLogout.kr" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >LOGOUT</a>
    <a class="btn btn-outline-success btn-sm" href="./GoingCartum.bo" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >CART</a>
    <a class="btn btn-outline-success btn-sm" href="#" role="button"
    	style ="--bs-btn-border-color: var(--bd-light);" ><%=id %>님 반갑습니다.</a>
   		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
	
	<c:if test="${sessionScope.id == null}">
	 <a class="btn btn-outline-success btn-sm" href="./UserLogin.kr" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >LOGIN</a>
    <a class="btn btn-outline-success btn-sm" href="./UserJoin.kr" role="button"
    	style ="--bs-btn-border-color: var(--bd-light);" >JOIN</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</c:if>
</nav>
 
 

<nav class="navbar bg-light" style = "border-bottom: solid 1px; border-bottom-color:#E0E0E0;">
  <div class="container-fluid">
    
    
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href = "<%=request.getContextPath()%>/main.kr"><img alt="로고이미지"	class="rounded float-end" src="<%=request.getContextPath()%>/images/freshlogo2_1.png"></a>
    	
    	
    	

    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div  class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel"
    		style = " --bs-offcanvas-width: 300px; ">
      <div class="offcanvas-header">
      <c:if test="${sessionScope.id != null }">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel"><%=id%>님 환영합니다.</h5>
        </c:if>	
      <c:if test="${sessionScope.id == null }">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">
        <a href="./UserLogin.kr" class="link-dark">로그인</a> 후 이용해주세요</h5>
        </c:if>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav  justify-content-end flex-grow-1 pe-3">
          <li class="nav-item">
            <h5><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/main.kr">Home</a><br></h5>
          </li>
          <li class="nav-item">
           <c:if test="${sessionScope.id != null }">

            <a class="btn btn-outline-success col-6 mx-auto" href="./ReviewBoard.rv" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >나의 후기</a><br><br>
            <a class="btn btn-outline-success col-6 mx-auto" href="./QnaList.um" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >공지 사항</a><br><br>
            <a class="btn btn-outline-success col-6 mx-auto" href="./UserInfoAction.kr?id=<%=id%>" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >회원 수정</a><br><br>
            <a class="btn btn-outline-success col-6 mx-auto" href="./MemberDelete.or" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >회원 탈퇴</a>
   		 	
   
  
            

            </c:if>
            
            <c:if test="${sessionScope.id == null}">
            
            </c:if>
            <br><br><br>
     <nav class="navbar sticky-bottom">
  <div class="container-fluid">
    <a class="btn btn-outline-success col-6 mx-auto" href="./firstpage/kakaomap_page.jsp" role="button"
   		 style ="--bs-btn-border-color: var(--bd-light);" >오시는 길</a>
  </div>
</nav>
            
          </li>    
        </ul>
      </div>
    </div>
  </div>
</nav>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>