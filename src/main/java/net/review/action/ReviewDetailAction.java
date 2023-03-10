package net.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class ReviewDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		ReviewDAO reviewddao = new ReviewDAO();
		ReviewBean reviewdata = new ReviewBean();

		int num = Integer.parseInt(request.getParameter("num"));
		reviewddao.setReadCountUpdate(num);
		reviewdata = reviewddao.getDetail(num);

		if (reviewdata == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");

		request.setAttribute("reviewdata", reviewdata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./review/review_view.jsp");
		return forward;

	}
}