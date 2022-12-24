<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding = "UTF-8" %>
    <%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

  <%@ include file="../include/menu.jsp"%>
  
   <div align="center">
      <h2>오시는길</h2>
    
   
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1669895958072" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1669895958072",
		"key" : "2ctiu",
		"mapWidth" : "900",
		"mapHeight" : "600"
	}).render();
</script>
   </div>
   <hr>
   <div align="center">


   
   </div>
    <%@ include file="../include/footer.jsp"%>
  

</body>
</html>