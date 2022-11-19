package net.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.qna.dao.QNADAO;

public class QnaWrite implements Action{

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		if(id==null || !id.equals("admin1234")) {
			forward.setRedirect(true);
			forward.setPath("./UserLogin.kr");
			return forward;
		}
		

		QNADAO qnadao=new QNADAO();		
		
		forward.setRedirect(false);
		forward.setPath("./qna_board/qna_board_write.jsp");
		return forward;
	}

}
