<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<title>로그인 페이지</title>
</head>
<body>
<form name="loginform" action="./UserLoginAction.kr" method="post">

<h1 align="center">로그인</h1>
<table align="center">

	<tr><td>아이디 </td><td><input type="text" name="USER_ID" size=20/></td></tr>
	<tr><td>비밀번호 </td><td><input type="password" name="USER_PW" size=20/></td></tr>
	<tr align="center"> 
		<td><input type="checkbox" name="idsave" value="checked">아이디 저장</td>
	</tr>
</table>

<table align="center">
	<tr >
		<td>
			<a href="javascript:loginform.submit()"><button type="button">로그인</button></a>&nbsp;&nbsp;
			<a href="UserJoin.kr"><button type="button">회원가입</button></a>
		</td>
	</tr>
</table>
<table align="center">
<tr>
<td>
	<a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">Logout</a>
    <script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('f9a7885f5ab565a33168180b70bdc8dc');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
    </script>
   </td>
  </tr>
  <script>
  $(function(){

		$("#btn-kakao-login").click(function(event){
			// a태그 기능 실행멈춤.
			event.preventDefault();
			// 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
			$("alert-kakao-login").addClass("d-none");
			// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
			Kakao.init('f9a7885f5ab565a33168180b70bdc8dc');
			// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
			Kakao.Auth.login({
				success:function(auth){
					Kakao.API.request({
						url: '/v2/user/me',
						success: function(response){
							// 사용자 정보를 가져와서 폼에 추가.
							var account = response.kakao_account;
							
							$('#form-kakao-login input[name=email]').val(account.email);
							$('#form-kakao-login input[name=name]').val(account.profile.nickname);
							$('#form-kakao-login input[name=img]').val(account.profile.img);
							// 사용자 정보가 포함된 폼을 서버로 제출한다.
							document.querySelector('#form-kakao-login').submit();
						},
						fail: function(error){
							// 경고창에 에러메시지 표시
							$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
						}
					}); // api request
				}, // success 결과.
				fail:function(error){
					// 경고창에 에러메시지 표시
					$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
				}
			}); // 로그인 인증.
		}) // 클릭이벤트
	})// 카카오로그인 끝.
  </script>
</table>
</form>
</body>
</html>