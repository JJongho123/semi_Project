package net.firstpage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.firstpage.db.ProductBean;
import net.firstpage.db.ProductDAO;

public class ProductDetailAction implements Action {


	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	request.setCharacterEncoding("utf-8");
	
		
		ProductDAO prodao = new ProductDAO();
		ProductBean product = new ProductBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
	
		
		product=prodao.getDetail(num);
		
		if(product==null) {
			System.out.println("상세보기 실패");
			return null;
		}
	
		System.out.println("상세보기 성공");
		
		request.setAttribute("product", product);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./firstpage/product_detail.jsp");
		
		return forward;
	
	
	}

}
