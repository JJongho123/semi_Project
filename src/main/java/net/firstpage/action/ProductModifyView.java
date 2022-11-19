package net.firstpage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.firstpage.db.ProductBean;
import net.firstpage.db.ProductDAO;

public class ProductModifyView implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		ProductDAO prodao = new ProductDAO();
		ProductBean productdata = new ProductBean();

		int num = Integer.parseInt(request.getParameter("num"));
		productdata = prodao.getDetail(num);

		if (productdata == null) {
			System.out.println("(수정) 상세보기 실패");
			return null;
		}
		System.out.println("(수정)상세보기 성공");

		request.setAttribute("productdata", productdata);
		forward.setRedirect(false);
		forward.setPath("./firstpage/product_modify.jsp");
		return forward;
	}

}
