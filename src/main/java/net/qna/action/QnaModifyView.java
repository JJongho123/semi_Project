package net.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.qna.dao.QNADAO;
import net.qna.vo.QNAVO;


public class QnaModifyView implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		QNADAO qnadao = new QNADAO();
		QNAVO qnadata = new QNAVO();

		int num = Integer.parseInt(request.getParameter("num"));
		qnadata = qnadao.getDetail(num);

		if (qnadata == null) {
			System.out.println("(수정) 상세보기 실패");
			return null;
		}
		System.out.println("(수정)상세보기 성공");

		request.setAttribute("qnadata", qnadata);
		forward.setRedirect(false);
		forward.setPath("./qna_board/qna_board_modify.jsp");
		return forward;

	}

}