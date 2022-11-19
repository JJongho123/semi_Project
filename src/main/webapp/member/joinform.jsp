<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>회원가입 페이지</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>

<body>

<form name="joinform" action="./UserJoinAction.kr" method="post" onsubmit="return valid()">

<h1 align="center">회원정보 입력</h1>

<table align="center">
   <tr>
      <td> 아이디* </td>
      <td><input type="text" name="USER_ID" id="USER_ID" class="USER_ID" size=28 maxlength="20" placeholder="공백 없는 영문/숫자 포함 4~20자">
      <button type="button" onClick="javascript:useridCheck()">중복확인</button>
   </td>
   </tr>
   <tr>
      <td> 비밀번호* </td>
      <td><input type="password" class="pw" name="USER_PW" id="USER_PW" placeholder="특수문자 포함 8~12자"></td>
   </tr>
   <tr>
      <td> 비밀번호 확인* </td>
      <td><input type="password" class="pw" name="USER_PW2" id="USER_PW2" placeholder="비밀번호 확인">
      	  <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
          <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span></div></td>
   </tr>
   <tr>
      <td> 이름* </td>
      <td><input type="text" name="USER_NAME" id="USER_NAME" size=3></td>
   </tr>
   <tr>
      <td> 전화번호* </td>
    		<td><select name="USER_PHONE1" id="USER_PHONE1" style="width:65px;height:30px;">선택
         			<option value="선택">선택</option>
			        <option value="010">010</option>
			        <option value="011">011</option>
			        <option value="016">016</option>
		 </select>
          <input type="text" name="USER_PHONE2" id="USER_PHONE2" size=17 maxlength="8" placeholder="(-)없이 입력해주세요.">
          </td>
   </tr>
   <tr>
      <td> 주소* </td>
      <td><input type="text" name="USER_ZIP_CODE" id="USER_ZIP_CODE" maxlength="20"
               size=5 value="" class="size_mail1" placeholder="우편번호">
         <input type="text" name="USER_ADDR" id="USER_ADDR" maxlength="30"
               size=50 value="" class="size_mail2" placeholder="주소">
      </td>
   </tr>
   <tr>
      <td> 생년월일 </td>
      <td><input type="text" name="USER_YEAR" id="USER_YEAR" maxlength="5"
               size=4 value="" class="size_mail1" placeholder="년(4자)">
         <select name="USER_MONTH" id="USER_MONTH" style="width:50px;height:30px;">월
         			<option value="월">월</option>
			        <option value="1">01</option>
			        <option value="2">02</option>
			        <option value="3">03</option>
			        <option value="4">04</option>
			        <option value="5">05</option>
			        <option value="6">06</option>
			        <option value="7">07</option>
			        <option value="8">08</option>
			        <option value="9">09</option>
			        <option value="10">10</option>
			        <option value="11">11</option>
			        <option value="12">12</option>
		 </select>
		 <select name="USER_DAY" id="USER_DAY" style="width:50px;height:30px;">일
			        <option value="일">일</option>
			        <option value="01">01</option>
			        <option value="02">02</option>
			        <option value="03">03</option>
			        <option value="04">04</option>
			        <option value="05">05</option>
			        <option value="06">06</option>
			        <option value="07">07</option>
			        <option value="08">08</option>
			        <option value="09">09</option>
			        <option value="10">10</option>
			        <option value="11">11</option>
			        <option value="12">12</option>
			        <option value="13">13</option>
			        <option value="14">14</option>
			        <option value="15">15</option>
			        <option value="16">16</option>
			        <option value="17">17</option>
			        <option value="18">18</option>
			        <option value="19">19</option>
			        <option value="20">20</option>
			        <option value="21">21</option>
			        <option value="22">22</option>
			        <option value="23">23</option>
			        <option value="24">24</option>
			        <option value="25">25</option>
			        <option value="26">26</option>
			        <option value="27">27</option>
			        <option value="28">28</option>
			        <option value="29">29</option>
			        <option value="30">30</option>
			        <option value="31">31</option>
	  </select>
      </td>
   </tr>
   <tr>
      <td> 성별 </td>
      <td>
         <input type="radio" name="USER_GENDER" id="USER_GENDER" value="남성" checked/>남성
         <input type="radio" name="USER_GENDER" id="USER_GENDER" value="여성"/>여성
      </td>
   </tr>
   <tr>
      <td> 이메일 </td>
      <td><input type="email" name="USER_EMAIL_F" id="USER_EMAIL_F" maxlength="20" size="10" class="size_mail1"> @
      	  <input type="email" name="USER_EMAIL_B" id="USER_EMAIL_B" maxlength="20" size="10" class="size_mail2"
      	  			placeholder="직접입력">
            <select name="USER_EMAIL_S" id="USER_EMAIL_S" style="width:100px;height:30px;">
            	  <option value="type">직접입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="nate.com">nate.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hanmail.net">hanmail.net</option>
            </select>
      </td>
   </tr>
   <tr>
      <td colspan="2" align="center">
      	<a href="javascript:history.go(-1)"><input type="button" value="뒤로"></a>&nbsp;&nbsp;
         <a href="javascript:joinform.submit()"><input type="button" value="회원가입"></a>&nbsp;&nbsp;
      </td>
   </tr>
   </table>
</form>


<%--아이디 중복확인--%>
<script>
	var isChecking = false;

	function valid(){
		if(isChecking == false){
			alert("아이디 중복체크를 해주세요.");
		}
		return isChecking;
	}
	
	function useridCheck(){
	      // DB에서 확인해서 정상이면 isChecking = true
	      var userid = $("#USER_ID").val();
	      console.log(userid);
	
	      $.ajax({
	         type: "POST",
	         url: "UserIdCheckAction.kr",
	         data: userid,
	         contentType: "text/plain; charset=utf-8",
	         dataType: "Text"  // 응답 받을 데이터의 타입을 적으면 자바스크립트 오브젝트로 파싱해줌.
	      }).done(function(data){
	         if(data == 'ok'){ // 유저네임 있다는 것
	        	 isChecking = false;
	            alert('중복된 아이디가 존재합니다.')
	         }else{
	        	 isChecking = true;
	            $("#userid").attr("readonly", "readonly");
	            alert("사용가능한 아이디 입니다.")
	         }
	      });
	   }
</script>

<%--이메일 select를 EMAIL_B에 넣기--%>
<script type="text/javascript">
//이메일 입력방식 선택
$('#USER_EMAIL_S').change(function(){
   $("#USER_EMAIL_S option:selected").each(function () {
		
		if($(this).val()== 'type'){ //직접입력일 경우
			 $("#USER_EMAIL_B").val('');                        //값 초기화
			 $("#USER_EMAIL_B").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#USER_EMAIL_B").val($(this).text());      //선택값 입력
			 $("#USER_EMAIL_B").attr("disabled",true); //비활성화
		}
   });
});
</script>

<%--비밀번호 숫자, 영문 소문자, 특수문자만 사용--%>
<script>
$("#USER_PW").change(function(){
    checkPassword($('#USER_PW').val(),$('USER_ID').val());
});
function checkPassword(USER_PW, USER_ID){
    
    if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(USER_PW)){            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#USER_PW').val('').focus();
        return false;
    }    
    var checkNumber = USER_PW.search(/[0-9]/g);
    var checkEnglish = USER_PW.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#USER_PW').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(USER_PW)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#USER_PW').val('').focus();
        return false;
    }
    return true;
}
</script>

<%--아이디 영어 소문자, 숫자만 사용 가능--%>
<script>
$("#USER_ID").change(function(){
    checkId($('#USER_ID').val(),$('USER_ID').val());
});
function checkId(USER_ID){
    
    if(!/^(?=.*[a-z])(?=.*[0-3]).{4,20}$/.test(USER_ID)){            
        alert('숫자+영문자 조합으로 4자리 이상 사용해야 합니다.');
        $('#USER_ID').val('').focus();
        return false;
    }
    var checkNumber = USER_ID.search(/[0-9]/g);
    var checkEnglish = USER_ID.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#USER_ID').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(USER_ID)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#USER_ID').val('').focus();
        return false;
    }
        
    //if(USER_PW.search(USER_ID) > -1){
    //    alert("비밀번호에 아이디가 포함되었습니다.");
    //    $('#USER_PW').val('').focus();
    //    return false;
    //}
    return true;
}
</script>

<%--이름 한글로만--%>
<script>
$("#USER_NAME").change(function(){
    checkName($('#USER_NAME').val(),$('USER_NAME').val());
});
function checkName(USER_NAME){
	
	/* if(!/^(?=.*[가-힣])(?=.*[0-3]).{2,15}$/.test(USER_NAME)){            
        alert('한글로 입력해주세요.');
        $('#USER_NAME').val('').focus();
        return false;
    } */
    var checkKorea = USER_NAME.search(/[가-힣]/ig);
    if(checkKorea <0){
        alert("이름은 한글로만 입력하여야 합니다.");
        $('#USER_NAME').val('').focus();
        return false;
    }
    return true;
}
</script>

<%--휴대폰 번호 숫자만111
<script>
$("#USER_PHONE_1").change(function(){
    checkPhone_1($('#USER_PHONE_1').val(),$('USER_PHONE_1').val());
});
function checkPhone_1(USER_PHONE_1){
	
	if(!/^(?=.*[0-9])(?=.*[0-2]).{3,3}$/.test(USER_PHONE_1)){            
        alert('숫자만 입력해주세요.');
        $('#USER_PHONE_1').val('').focus();
        return false;
    }
    return true;
}
</script>--%>

<%--휴대폰 번호 숫자만222--%>
<script>
$("#USER_PHONE2").change(function(){
    checkPhone2($('#USER_PHONE2').val(),$('USER_PHONE2').val());
});
function checkPhone2(USER_PHONE2){
	/*
	 if(!/^(?=.*[0-9])(?=.*[0-7]).{4,9}$/.test(USER_PHONE2)){            
        alert('숫자만 입력해주세요.');
        $('#USER_PHONE2').val('').focus();
        return false;
    }*/
	var checkNumber = USER_PHONE2.search(/[0-9]/g);
    if(checkNumber <0){
        alert("숫자만 입력해주세요.");
        $('#USER_PHONE2').val('').focus();
        return false;
    }
    return true;
}
</script>

<%--우편번호 숫자만--%>
<script>
$("#USER_ZIP_CODE").change(function(){
    checkZIPCODE($('#USER_ZIP_CODE').val(),$('USER_ZIP_CODE').val());
});
function checkZIPCODE(USER_ZIP_CODE){
	
	var checkNumber = USER_ZIP_CODE.search(/[0-9]/g);
    if(checkNumber <0){
        alert("우편번호를 정확히 입력해주세요.");
        $('#USER_ZIP_CODE').val('').focus();
        return false;
    }
    return true;
}
</script>

<%--주소 한글 숫자 혼합--%>
<script>
$("#USER_ADDR").change(function(){
    checkADDR($('#USER_ADDR').val(),$('USER_ADDR').val());
});
function checkADDR(USER_ADDR){

	var checkNumber = USER_ADDR.search(/[0-9]/g);
    var checkKorea = USER_ADDR.search(/[가-힣]/ig);
    if(checkKorea <0 || checkNumber <0){
        alert("한글과 숫자로 정확하게 주소를 입력해주세요.");
        $('#USER_ADDR').val('').focus();
        return false;
    }
    return true;
}
</script>

<%--년도 숫자만 기입--%>
<script>
$("#USER_YEAR").change(function(){
    checkYEAR($('#USER_YEAR').val(),$('USER_YEAR').val());
});
function checkYEAR(USER_YEAR){
	
	if(!/^(?=.*[0-9])(?=.*[0-3]).{4,4}$/.test(USER_YEAR)){            
        alert('년도를 제대로 입력해주세요.');
        $('#USER_YEAR').val('').focus();
        return false;
    }
    return true;
}
</script>

<%--비밀번호 확인 기능--%>
<script>
    $('.pw').focusout(function () {
        var pwd1 = $("#USER_PW").val();
        var pwd2 = $("#USER_PW2").val();
  
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });
</script>
</body>
</html>