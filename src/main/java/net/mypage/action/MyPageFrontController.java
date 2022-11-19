package net.mypage.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPageFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

			// 1.마이페이지(회원정보)
		if (command.equals("/mypage.or")) { //마이페이지로 이동
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./mypage/mypage.jsp");
    		
		} else if (command.equals("/MemberDelete.or")) { //회원탈퇴
			System.out.println("나오냐");
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./mypage/userdeleteform.jsp");
    		
		}else if (command.equals("/MemberDeleteAction.or")) { //회원탈퇴 메서드
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
			// forward 하기위한 필수코드
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());

			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("board doGet()~~~~~~~\n");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("board doPost()%%%%%%%%%%% \n");
		doProcess(request, response);
	}

}