package net.cart.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cart.service.FreshServiceImpl;

@WebServlet("/fresh/fresh.do")
public class FreshController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FreshController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			doAction(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			doAction(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//어떠한 행동을 할것인지에 대한 파라미터
		String act = (String)request.getParameter("act");
		
		String viewPage = "";
		
		FreshServiceImpl service = new FreshServiceImpl();
		
		//act가 넘어오지 않았을 경우 list를 담아 명함 목록으로 이동
		if(act == null || act.equals("")) {
			act = "cart";
		}
		
		//각 act에 따른 serviceImpl 호출
		if(act.equals("cart")) {
			service.cartList(request, response);
		}else if(act.equals("del")) {
			service.cartDelete(request, response);
			
			viewPage = (String)request.getAttribute("viewPage");
			response.sendRedirect(viewPage);
			return;
		}
		
		//각 프로세스 실행 후 setAttribute 했던 viewPage를 받아올 거임
		viewPage = (String)request.getAttribute("viewPage");
		
		//viewPage가 정상적으로 넘어오지 않았을경우 목록으로 이동
		if(viewPage == null) {
			viewPage = "/fresh/fresh.do?act=cart";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
