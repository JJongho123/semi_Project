package net.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.qna.dao.QNADAO;
import net.qna.vo.QNAVO;

public class QnaReplyView implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		QNADAO qnadao = new QNADAO();
		QNAVO qnadata = new QNAVO();
		int result=0;
		
		qnadata.setQNA_NUM(Integer.parseInt(request.getParameter("QNA_NUM")));
		qnadata.setQNA_ID(request.getParameter("QNA_ID"));
		qnadata.setQNA_SUBJECT(request.getParameter("QNA_SUBJECT"));
		qnadata.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
		qnadata.setQNA_RE_REF(Integer.parseInt(request.getParameter("QNA_RE_REF")));
		qnadata.setQNA_RE_LEV(Integer.parseInt(request.getParameter("QNA_RE_LEV")));
		qnadata.setQNA_RE_SEQ(Integer.parseInt(request.getParameter("QNA_RE_SEQ")));
		
		result=qnadao.qnaReply(qnadata);
		if(result==0) {
			System.out.println("답변글 작성 실패");
			return null;
		}
		System.out.println("답변글 성공");
		
		forward.setRedirect(true);
		forward.setPath("./QnaDetailAction.um?num=" + result);
		return forward;
	}

}