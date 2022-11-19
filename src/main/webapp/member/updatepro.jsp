<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "net.login.db.*" %>
<%@ page import = "net.login.action.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보수정</h1>
<%
	// 한글 처리 (form 태그 정보를 post방식 전달)
	request.setCharacterEncoding("UTF-8");
	
	// 전달된 정보 (파라미터) 저장 - 수정 할 데이터 값
	// -> 자바빈 객체를 사용해서 한번에 저장 (액션태그)
%>
<jsp:useBean id="mb" class="net.login.db.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%
	System.out.println("수정할 데이터 : " + mb);
	//UserDAO 객체 생성 - UpdateUser(bean);
	UserDAO userdao = new UserDAO();
	int result = userdao.updateUser(mb);
	
	System.out.println("수정 처리결과 : " + result);
	//수정 처리 결과 (정수 데이터)에 따른 페이지 이동
	
	if(result == -1){
		%>
		<script type="text/javascript">
					alert('회원 정보가 없습니다.');
					history.back();
		</script>
		<%
	}else if(result == 0){
		%>
		<script type="text/javascript">
					alert('비밀번호 오류입니다.');
					history.back();
		</script>
		<%
	}else if(result ==1){
		%>
		<script type="text/javascript">
					alert('회원정보 수정완료.');
					location.href='main.jsp';
		</script>
		<%
	}
%>
</body>
</html>