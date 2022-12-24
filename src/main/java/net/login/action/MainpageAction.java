package net.login.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.firstpage.db.ProductDAO;

public class MainpageAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("여기까지 도달!");

		ActionForward forward = new ActionForward();
		
		ProductDAO prodao = new ProductDAO();
		
		
		List mainlist = new ArrayList();
		
		
		try {
		mainlist = prodao.getmainlist();
		
		request.setAttribute("mainlist", mainlist);
		}catch(Exception e) {
			System.out.println("mainlist 오류 : "+  e);
		}
		
		
		forward.setRedirect(false);
		forward.setPath("./firstpage/main_page.jsp");
		return forward;

		
		
	}

}
