package net.qna.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.qna.dao.QNADAO;

public class QnaListAction implements Action{

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
//		if(id==null || !id.equals("admin1234")) {
//		forward.setRedirect(true);
//		forward.setPath("./UserLogin.kr");
//		return forward;
//	}

		
		
		QNADAO qnadao=new QNADAO();
		List qnalist=new ArrayList();
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		System.out.println("** listcount  데이터 가져오기 ");
		int listcount=qnadao.getListCount(); // 총 리스트 수 받아옴
		
	
		System.out.println(" ----- ");
		qnalist = qnadao.getQnaList(page,limit);	// 리스트를 받아옴
		
		System.out.println(" getQnaList  데이터 가져오기 ");
		
		// 총 페이지 수
		int maxpage=(int)((double)listcount/limit+0.95); // 0.95를 더해서 올림처리
		
		// 현재 페이지에 보여줄 시작 페이지수 1,11,21
		int startpage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		
		// 현재 페이지에 보여줄 마지막 페이지수 10,20,30
		int endpage = maxpage;
		
		if(endpage > startpage+10-1) endpage = startpage+10-1;
		
		request.setAttribute("page", page);	// 현재 페이지 수
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("qnalist", qnalist);
		
		forward.setRedirect(false);
		forward.setPath("./qna_board/qna_board_list.jsp");
		return forward;
	}

}
