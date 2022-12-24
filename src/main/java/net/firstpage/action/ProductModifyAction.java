package net.firstpage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.firstpage.db.ProductBean;
import net.firstpage.db.ProductDAO;

public class ProductModifyAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		boolean result = false;
		
		int num = Integer.parseInt(request.getParameter("PRO_NUM"));
		
		ProductDAO prodao = new ProductDAO();
		ProductBean	productdata = new ProductBean();
		
		boolean usercheck = prodao.isBoardWriter(num, request.getParameter("USER_ID"));
		
		if(usercheck == false) {
	         response.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('수정할 권한이 없습니다.');");
	         out.println("location.href='./ProductList.bo';");
	         out.println("</script>");
	         out.close();
	         return null;
	      }
		
	
	      try {
	    	  productdata.setUSER_ID(request.getParameter("USER_ID"));
	    	  productdata.setPRO_NUM(num);
	    	  productdata.setPRO_NAME(request.getParameter("PRO_NAME"));
			  productdata.setPRO_PRICE(Integer.parseInt(request.getParameter("PRO_PRICE")));
			  productdata.setPRO_CONTENT(request.getParameter("PRO_CONTENT"));
			  productdata.setPRO_TEMP(Integer.parseInt(request.getParameter("PRO_TEMP")));
			  productdata.setPRO_WEIGHT(Integer.parseInt(request.getParameter("PRO_WEIGHT")));
			  productdata.setPRO_TIME(Integer.parseInt(request.getParameter("PRO_TIME")));
	         
	         result = prodao.productModify(productdata);
	         if(result == false) {
	            System.out.println("게시판 수정 실패");
	            return null;
	         }
	         System.out.println("게시판 수정 완료");   
	         
	         forward.setRedirect(true);
	         forward.setPath("./ProductList.bo");
	         //return forward;
	      }catch (Exception ex) {
	         ex.printStackTrace();
	      }
	      return forward;

	}
}
