package net.firstpage.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.firstpage.db.ProductBean;
import net.firstpage.db.ProductDAO;

public class ProductSortAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductDAO prodao = new ProductDAO();
		List<ProductBean> productlist = new ArrayList<ProductBean>();
		
		productlist=prodao.getSort(num);
		
		
		
		
		if(productlist==null) {
			System.out.println("정렬 실패");
			return null;
		}
	
		System.out.println("정렬 성공");
		
		request.setAttribute("productlist", productlist);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./firstpage/product_page.jsp");
		
		return forward;
	
	
	}

}
