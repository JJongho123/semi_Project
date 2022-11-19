package net.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.qna.dao.QNADAO;
import net.qna.vo.QNAVO;

public class QnaReplyAction implements Action {


	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ActionForward forward = new ActionForward();
		
		QNADAO qnadao = new QNADAO();
		QNAVO qnadata = new QNAVO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		qnadata = qnadao.getDetail(num);
		
		if(qnadata==null) {
			System.out.println("답변글 작성 실패");
			return null;
			
		}
		System.out.println("답변글 작성~~~~");
		
		request.setAttribute("qnadata", qnadata);
		
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_reply.jsp");
		return forward;
	}

}