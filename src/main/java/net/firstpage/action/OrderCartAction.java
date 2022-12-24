package net.firstpage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.firstpage.db.ProductDAO;

public class OrderCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		
		
		boolean result=false;
		
	
		
		ProductDAO prodao = new ProductDAO();
		
	
		result=prodao.OrderCart(id);
		if(result==false) {
			System.out.println("상품 주문 실패");
			return null;
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('주문완료되었습니다.');");
		out.println("location.href='./GoingCartum.bo';");
		out.println("</script>");
		out.close();
		
		System.out.println(" 주문 성공");
		
		return null;
		
		
		
	}

}
