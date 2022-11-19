package net.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class ReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		boolean result = false;
		
		int num = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewdata = new ReviewBean();
		
		boolean usercheck = reviewdao.isBoardWriter(num,request.getParameter("REVIEW_ID"));
		if (usercheck == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권리가 없습니다.');");
			out.println("location.href='./ReviewBoard.rv'");
			out.println("</script>");
			out.close();
			return null;
		}
		
		try {
			reviewdata.setREVIEW_NUM(num);
			reviewdata.setREVIEW_SUBJECT(request.getParameter("REVIEW_SUBJECT"));
			reviewdata.setREVIEW_CONTENT(request.getParameter("REVIEW_CONTENT"));
			
			result = reviewdao.ReviewModify(reviewdata);
			if (result == false) {
				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 완료");
			
			forward.setRedirect(true);
			forward.setPath("./ReviewDetailAction.rv?num=" + reviewdata.getREVIEW_NUM());
			//return forward
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return forward;

	}

}
