<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script type="text/javascript">
/* 쿠키가 적용된 사이드바 */
jQuery(function(){
	checkToggle();
	});
	function checkToggle(){
		if(jQuery.cookie("isToggle") == "") {
		$("#sidebar, #sideList, #sidebar-toggle").addClass("sideon");
		} else {
		$("#sidebar, #sideList, #sidebar-toggle").removeClass("sideon");
		}
	}
	function toogleSide(){
		jQuery.cookie('isToggle', 'no', { path : '/' });
		this.checkToggle();
	}
	function toogleSideOn(){
		jQuery.cookie('isToggle', '', { path : '/' });
		this.checkToggle();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	list-style: none;
	padding-left: 0px;
}
</style>
<link href="sidestyle.css" rel="stylesheet" />
</head>
<body>
<div id="sidebar">
	<div id="sideList">
		<div class="listLeft">
			<p style="font-size:20px; color:rgb(50,50,50); width:70px; line-height:50px; text-align:center;">내 정보</p>
		</div>
		<div class="listRight">
			<p style="font-size:40px; color:#000; width:200px; line-height:100px; text-align:center;">
			
			<div align="center">
		<h2>MY PAGE</h2>
		<br>
		<h3>나의 정보</h3>

		<ul>
			<li><a href="./UserUpdate.kr">회원 정보 수정</a></li>
			<li><a href="./MemberDelete.or">회원 탈퇴</a></li>
		</ul>
		<br>

		<h3>나의 활동</h3>
		<ul>
			<li><a href="./############">1:1 문의</a></li>
			<li><a href="./ReviewBoard.rv">나의 후기</a></li>
		</ul>
	
	</div>
		</div>
	</div>
</div>
<div id="sidebar-toggle">
	<a class="sideOnImg" alt="open" onclick="toogleSideOn();" style = "cursor:pointer;">열기</a>
	<a class="sideOffImg" alt="close" onclick="toogleSide();" style = "cursor:pointer;">닫기</a>
</div>
</body>
</html>