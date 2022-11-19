package net.review.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String id =(String)session.getAttribute("id");
		if (id==null) {
			forward.setRedirect(true);
			forward.setPath("./Userlogin.kr");
			return forward;
		}
		
		ReviewDAO reviewdao = new ReviewDAO();
		List<ReviewBean> reviewlist = new ArrayList<ReviewBean>();
		
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page")!= null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = reviewdao.getListCount();// 총리스트 수 받아옴
		reviewlist = reviewdao.getBoardList(page, limit); //리스트를 받아옴
		
		//총페이지수
		int maxpage = (int)((double)listcount/limit + 0.95); // 0.95를 더해서 올림처리
		
		//현재 페이지에 보여줄 시작 페이지수 1,11,21 등
		int startpage = (((int) ((double)page / 10 + 0.9))-1) * 10 + 1;
		
		//현재 페이지에 보여줄 마지막 페이지수 10,20,30,등
		int endpage = maxpage;
		
		if (endpage > startpage + 10 - 1) endpage = startpage+10-1;
			
			request.setAttribute("page", page); //현재 페이지수
			request.setAttribute("maxpage", maxpage); //최대 페이지수
			request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지수
			request.setAttribute("endpage", endpage); //현재 페이지에 표시할 끝 페이지 수
			request.setAttribute("listcount", listcount); //글 수
			request.setAttribute("reviewList", reviewlist); 
			
			forward.setRedirect(false);
			forward.setPath("./review/review_board.jsp");
			
			return forward;
		
	}

}
