package net.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.qna.dao.QNADAO;
import net.qna.vo.QNAVO;


public class QnaDetailAction implements Action{


	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" 상세 보기  :");
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		boolean result=false;
		boolean usercheck=false;
		int num = Integer.parseInt(request.getParameter("num"));
		
		QNADAO qnadao = new QNADAO();
		qnadao.setReadCountUpdate(num);
		QNAVO  qnadata =qnadao.getDetail(num);
		
		request.setAttribute("qnadata", qnadata);
		
//		usercheck = qnadao.isQnaWriter(num, id);
//		
//		if(usercheck==false) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('삭제할 권한이 없습니다.');");
//			out.println("location.href='./QnaList.um';");
//			out.println("</script>");
//			out.close();
//			return null;
//		}
//		result=qnadao.qnaDelete(num);
//		if(result==false) {
//			System.out.println("게시판 삭제 실패");
//			return null;
//		}
//		System.out.println("게시판 삭제 성공");
//		forward.setRedirect(true);
//		forward.setPath("./QnaList.um");
		
		
		forward.setRedirect(false);
		forward.setPath("./qna_board/qna_board_view.jsp");
		return forward;
	}

}





