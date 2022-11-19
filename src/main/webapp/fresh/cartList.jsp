<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.cart.vo.*" %>
<%@ page import="net.firstpage.db.*" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>

<%
@SuppressWarnings("unchecked")
	List<CartVo> cartList = (List<CartVo>)request.getAttribute("cartList");
	
	if(cartList == null){
		cartList = new ArrayList<CartVo>();
	}
	
	int total = 0;
%>
<p>장바구니</p>
<table border="1">
	<thead>
		<tr>
			<th>이미지</th>
			<th>이름</th>
			<th>수량</th>
			<th>가격</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
		<%
		if(cartList.size() > 0){
		%>
			<%
			for(int i=0; i<cartList.size(); i++){
						CartVo cartVo = cartList.get(i);
						total = total + (cartVo.getCart_quantity() * cartVo.getCart_price());
			%>
				<tr>
						
					<td><img src="${path}/productupload/<%=cartVo.getPRO_IMAGE()%>" style="width:200px; height:200px;"/></td>
					<td><%=id%></td><tr>
					<td><%=cartVo.getPRO_NAME()%></td><tr>
					<td><%=cartVo.getPRO_NUM()%></td><tr>
					<td><%=cartVo.getPRO_KIND()%></td><tr>
					<td><%=cartVo.getPRO_PRICE()%></td><tr>
					<td><%=cartVo.getPRO_CONTENT()%></td><tr>
					
					
					<td><%=cartVo.getCart_quantity()%></td>
					<td><%=cartVo.getCart_quantity() * cartVo.getCart_price()%></td>
					<td>
						<a href="/fresh_project/fresh/fresh.do?act=del&cart_num=<%=cartVo.getCart_num()%>">
							삭제
						</a>
					</td>
				</tr>
			<%}%>
		<%}else{ %>
			<tr>
				<td colspan="3">장바구니가 비어있습니다.</td>
			</tr>
		<%} %>
	</tbody>
</table>

<p>
	총액 : <span id="total"></span>원
</p>

<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		$("#total").append('<%=total%>');
	});
</script>