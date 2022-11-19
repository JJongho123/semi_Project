package net.review.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		//후기글 쓰기 페이지 이동
		if (command.equals("/ReviewWrite.rv")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./review/review_write.jsp");

			//후기글 등록
		} else if (command.equals("/ReviewAddAction.rv")) {
			System.out.println("글 등록 실행 : " );
			action = new ReviewAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		//후기 목록 불러오기
	} else if (command.equals("/ReviewBoard.rv")) {
		System.out.println("리뷰리스트액션 실행 : " );
				action = new ReviewListAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//후기글 자세히 보기
	} else if (command.equals("/ReviewDetailAction.rv")) {
		System.out.println("리뷰 글 보기 실행 : " );
		action = new ReviewDetailAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//후기글 수정 폼
	} else if (command.equals("/ReviewModify.rv")) {
		action = new ReviewModify();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 후기글 수정 메서드
	} else if (command.equals("/ReviewModifyAction.rv")) {
		System.out.println("리뷰 글 보기 실행 : " );
		action = new ReviewModifyAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//후기글 삭제 메서드
	} else if (command.equals("/ReviewDeleteAction.rv")) {
		action = new ReviewDeleteAction();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
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
		System.out.println("review board doGet()~~~~~~~\n");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("review board()%%%%%%%%%%% \n");
		doProcess(request, response);
	}

}
