<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="net.cart.vo.*" %>
<%@ page import="net.firstpage.db.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/menu.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
crossorigin="anonymous">
<%
   List<CartVo> cartList = (List<CartVo>)request.getAttribute("cartList");
   
   if(cartList == null)
   {
      cartList = new ArrayList<CartVo>();
   }
   
   int total = 0;
   
   int CartPrice = 0;
   int delivery = 0;
   int order_amount = 0;
 
  
%>
<bR><p class="text-center text-success fs-1 fw-BOLDER">CART</p><bR>
<div class = container>
<table class="table table-hover text-center">
   <thead class="table-light">
      <tr class="table-success">
         <th scope="col">이미지</th>
            <th scope="col">상품명</th>
           <th scope="col">수량</th>
            <th scope="col">가격</th>
         <th scope="col">삭제</th>
            
      </tr>
   </thead>
   <tbody>
      <%
      if(cartList.size() > 0)
      {
      %>
         <%
         for(int i=0; i<cartList.size(); i++)
         {
            CartVo cartVo = cartList.get(i);
            total = total + (cartVo.getCART_QUANTITY() * cartVo.getCart_price());
            int ProductPrice = cartVo.getPRO_PRICE() * cartVo.getCART_QUANTITY();
         	CartPrice = ProductPrice + CartPrice;
         %>
      <tr>
         <td class="align-middle"><img src="${path}/productupload/<%=cartVo.getPRO_IMAGE()%>" style="width:200px; height:200px;"/></td>
         <td class="align-middle"><%=cartVo.getPRO_NAME()%></td>
          <td class="align-middle">
          
			
			<!--  <span id="up" onclick= "countup(?,?)">+</span>--> 
			
			 <a style="text-decoration-line:none;" href="./QuantityUp.bo?num=<%=cartVo.getPRO_NUM()%>&quan=<%=cartVo.getCART_QUANTITY()%>">
            +
            </a>
            
	
			<span id="message1"><%=cartVo.getCART_QUANTITY()%></span>
			
			 <a style="text-decoration-line:none;" href="./QuantityDown.bo?num=<%=cartVo.getPRO_NUM()%>&quan=<%=cartVo.getCART_QUANTITY()%>">
            -
            </a>
            
		</td>
         <td class="align-middle"><fmt:formatNumber value="<%=ProductPrice%>" pattern="#,###"/>원
         <td class="align-middle">
            <a style="text-decoration-line:none;" href="./DeleteCart.bo?num=<%=cartVo.getCart_num()%>">
            삭제
            </a>
         </td>
 
		
      </tr>
         <%}%>
   
  
   <thead class="table-light">
      <tr class="table-success">
         
        	 <th></th>
         	<th>총상품금액</th>
           <th>배송비</th>
           <th>총결제금액</th>
            <th></th>
      </tr>
   </thead>
     <tbody>
     <tr>
     <td></td>
       <td class="align-middle"><fmt:formatNumber value="<%=CartPrice %>" pattern="#,###"/>원
       </td>
       <% if(CartPrice>=30000) { 
       		delivery = 0;%>
       <td class="align-middle"><fmt:formatNumber value="<%=delivery %>" pattern="#,###"/>원</td>
       <%} else { 
       		delivery = 3000;%>
        <td class="align-middle"><fmt:formatNumber value="<%=delivery %>" pattern="#,###"/>원</td>
       <%} %>
       <%  order_amount = delivery + CartPrice; %>
       
       <td class="align-middle"><fmt:formatNumber value="<%=order_amount %>" pattern="#,###"/>원</td>
       
        <td class="align-middle">
            <a href="./OrderCart.bo" style="text-decoration-line:none;">
           	주문하기
            </a>
         </td>
       </tr>
       
     </tbody>
     
    
   <tbody>
         
      <%}else{ %>
      <tr>
         <td colspan="5"><Br>
         <svg xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="currentColor" class="bi bi-cart-x" viewBox="0 0 16 16">
              <path d="M7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793 7.354 5.646z"/>
              <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
         </svg><br><Br><Br>
         <p class="fw-bolder">장바구니가 비어 있습니다.</td>
      </tr>
      <%} %>
   </tbody>
   
</table>
   <tfoot>
   <p class="text-end">
      <!-- 총액 : <span id="total"></span>원-->
   </p>
   </tfoot>
   
   
	
</div>
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script>

   
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" 
integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" 
crossorigin="anonymous">
</script>

 <%@ include file="../include/footer.jsp"%>