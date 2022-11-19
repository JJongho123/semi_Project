package net.firstpage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.firstpage.db.ProductDAO;


public class ProductDeleteAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		
		
		boolean result=false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductDAO prodao = new ProductDAO();
		
	
		result=prodao.productDelete(num);
		if(result==false) {
			System.out.println("상품 삭제 실패");
			return null;
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('상품이 삭제되었습니다.');");
		out.println("location.href='./ProductList.bo';");
		out.println("</script>");
		out.close();
		
		System.out.println("상품 삭제 성공");
		
		return null;
		
		
	}

}	
		
		

