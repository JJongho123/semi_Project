package net.firstpage.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.firstpage.db.ProductDAO;

public class ProductListAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		String ss = request.getParameter("num");
		int num =0;
		if (ss == null) {
			num = 1;
		}
		else {
			num = Integer.parseInt(request.getParameter("num"));
		}
		

		ProductDAO prodao = new ProductDAO();
		List productlist = new ArrayList();
		
		
		
		int page = 1;
		int limit = 8;
		
		request.setCharacterEncoding("UTF-8");
		
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		
		
		//검색 기능 추가 - 시작
		String srchKey = request.getParameter("srchKey");
		String srchFlds = request.getParameter("srchFlds");
		String cond = null;
		
		try {
			
	
		if (srchKey == null || srchKey.equals("")) {
			cond = null;
			
		}else if (srchFlds.equals("all")) {
			String whereFmt = " upper(PRO_NAME) like '%%' || upper('%s') || '%%' "
							+ " or upper(PRO_CONTENT) like '%%' || upper('%s') || '%%' ";
			cond = String.format(whereFmt, srchKey, srchKey, srchKey);
			
		}else if (srchFlds.equals("name")) {
			String whereFmt = " upper(PRO_NAME) like '%%' || upper('%s') || '%%' ";
			cond = String.format(whereFmt, srchKey);
		}else if (srchFlds.equals("con")) {
			String whereFmt = " upper(PRO_CONTENT) like '%%' || upper('%s') || '%%' ";
			cond = String.format(whereFmt, srchKey);
		}
		// 검색 기능 추가 - 끝
		
		
		int listcount = prodao.getListCount(cond);
		productlist = prodao.getProductList(page, limit, cond, num);
		
		// 총 페이지 수 : 0.95를 더해서 올림 처리
		int maxpage = (int)((double)listcount / limit + 0.95);
		
		// 현재 페이지에서 보여줄 시작 페이지 수 (1, 11, 21, 등)
		int startpage = (((int)((double)page / 5 + 0.9)) - 1) * 5 + 1;
		
		// 현재 페이지에서 보여줄 마지막 페이지 수 (10, 20, 30, 등)
		int endpage = startpage + 5 - 1;
		
		if(endpage > startpage+5-1) endpage = startpage+5-1;
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("productlist", productlist);
		}catch(Exception e) {
			System.out.println("ProductListAction 에러 : "+ e);
		}
		

		
		
		// 검색 기능 추가 - 시작
		request.setAttribute("srchKey", srchKey);
		request.setAttribute("srchFlds", srchFlds);
		
		// 검색 기능 추가 - 끝
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./firstpage/product_page.jsp");
		return forward;
	}

}
