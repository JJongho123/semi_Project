<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.login.db.*" %>


<%@ include file="../include/header.jsp" %>

<%
UserBean userdata = (UserBean) request.getAttribute("userdata");
%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
   function usermodify() {
      modifyform.submit();
   }
</script>
<head>
<meta charset="UTF-8">
<title>fresh 유저 정보 조회</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!-- LOGIN 부트스트랩 가져온 부분 /HEAD 바로 위 까지 -->
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">


<%@ include file="../include/menu.jsp" %>
</head>
<body>
<!-- 회원 수정   수정 예정@@@@@@-->
<form action="UserUpdateAction.kr" method="post" name="modifyform">
<input type="hidden" name="USER_ID" value="<%=id%>">

<main>
    <div class="container">

      <!-- 위에서 한 칸 떨어져 주는 역할. 없으면 meun.jsp랑 붙어버림 -->
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        
        <!-- 얘가 있어야 넓이가 유지됨. -->
        <div class="container" style="width:1200px;" > 
       
        <!-- 센터로 오게 해주는 고마운 친구 -->
          <div class="row justify-content-center">
          
             <!-- border 같은 느낌 -->
           <!-- 기본값 <div class="col-lg-2 col-md-6 d-flex flex-column align-items-center justify-content-center"> -->
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center"> <!-- 내가 수정 -->

         <!-- 얘가 없으면 border가 사라져버림 -->
              <div class="card mb-3">

                <div class="card-body">

            <!-- 위에서 한 칸 떨어져 주는 역할.-->
                  <div class="pt-4 pb-2">
                    <h1 class="card-title text-center pb-0 fs-4">회원 정보 수정</h1>
                  </div>

                  <form class="row g-3 needs-validation" novalidate>
                  
<div class="col-20">
          <label>이름</label>
              <div class="input-group has-validation" style="margin:0px; width:500px;">
              <input type="text" name="USER_NAME" class="form-control" id="USER_NAME" value="<%=userdata.getUSER_NAME()%>" required>
              </div>
              </div>
              
<div class="col-20">
          <label>비밀번호</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_PW" class="form-control" id="USER_PW" value="<%=userdata.getUSER_PW()%>" required>
              </div>
              </div>
      
<div class="col-20">
          <label>번호1</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_PHONE1" class="form-control" id="USER_PHONE1" value="<%=userdata.getUSER_PHONE1()%>" required>
              </div>
              </div>
              
<div class="col-20">
          <label>번호2</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_PHONE2" class="form-control" id="USER_PHONE2" value="<%=userdata.getUSER_PHONE2()%>" required>
              </div>
              </div>
      
<div class="col-20">
          <label>우편번호</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_ZIP_CODE" class="form-control" id="USER_ZIP_CODE" value="<%=userdata.getUSER_ZIP_CODE()%>" required>
              </div>
              </div>

<div class="col-20">
          <label>주소</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_ADDR" class="form-control" id="USER_ADDR" value="<%=userdata.getUSER_ADDR()%>" required>
              </div>
              </div>
      
<div class="col-20">
          <label>이메일1</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_EMAIL_F" class="form-control" id="USER_EMAIL_F" value="<%=userdata.getUSER_EMAIL_F()%>" required>
              </div>
              </div>

<div class="col-20">
          <label>이메일2</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_EMAIL_B" class="form-control" id="USER_EMAIL_B" value="<%=userdata.getUSER_EMAIL_B()%>" required>
              </div>
              </div>

<div class="col-20">
          <label>이메일3</label>
              <div class="input-group has-validation">
              <input type="text" name="USER_EMAIL_S" class="form-control" id="USER_EMAIL_S" value="<%=userdata.getUSER_EMAIL_S()%>" required>
              </div>
              </div>
<table align="center"><br>
   <tr>
      <td colspan="2" align="center">
      <a href="javascript:usermodify()"><button class="btn btn-lg btn-success" style="align:center; width:100px;">수정</button></a>&nbsp;&nbsp; 
      <a href="javascript:history.go(-1)"><button class="btn btn-lg btn-success" style="align:center; width:100px;">뒤로</button></a>&nbsp;&nbsp;
      </td>
      </tr>
      </table>
</form>
</div>
</div>
</div>
</div>
</div>
</section>
</div>
</main>
</form>
      
<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="form-validation.js"></script>
<!-- LOGIN 부트스트랩 가져온 부분 /BODY 바로 위 까지 -->
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/chart.js/chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
  
  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
s