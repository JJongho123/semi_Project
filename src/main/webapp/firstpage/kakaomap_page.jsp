<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding = "UTF-8" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <hr>
   <div>
      
   
      <!-- * Kakao Map - Go Mapper -->
<!-- 1. Map node -->
<div id="daumRoughmapContainer1668647876168" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
   2. Installation script
   * If two or more map embedding services are installed, only one installation script is inserted.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. Run script -->
<script charset="UTF-8">
   new  daum.roughmap.Lander ({
      "timestamp" : "1668647876168",
      "key" : "2ckk2",
      "mapWidth" : "1000",
      "mapHeight" : "600"
   }).render();
</script>
   </div>
   <hr>
   <div>
   <h3><img src="<%=request.getContextPath()%>/images/kakao_pin.png" class="d-block w-100" alt="..." style="width:25px; height:25px;">
   891, Daechi-dong Jibeon, 06194, Daechi Tower, 424 Teheran-ro, Gangnam-gu, Seoul</ h3 >
   

   <h3>
   <img src="<%=request.getContextPath()%>/images/phone.png" class="d-block w-100" alt="..." style="width:20px; height:20px;">
   Contact
   1833-5836 representative number
   </h3>


   
   </div>

</body>
</html>