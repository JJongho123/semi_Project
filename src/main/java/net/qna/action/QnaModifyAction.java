package net.qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.qna.dao.QNADAO;
import net.qna.vo.QNAVO;


public class QnaModifyAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		String id=(String)request.getSession().getAttribute("id");
		if(id==null || !id.equals("admin1234")) {
			forward.setRedirect(true);
			forward.setPath("./UserLogin.kr");
			return forward;
	    }
		
		boolean result = false;
		
		int num = Integer.parseInt(request.getParameter("QNA_NUM"));
		
		QNADAO qnadao = new QNADAO();
		QNAVO qnadata = new QNAVO();
		
		boolean usercheck = qnadao.isQnaWriter(num, request.getParameter("QNA_ID"));
		
		if(usercheck == false) {
	         response.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('수정할 권한이 없습니다.');");
	         out.println("location.href='./QnaList.um';");
	         out.println("</script>");
	         out.close();
	         return null;
	      }
	      try {
	         qnadata.setQNA_NUM(num);
	         qnadata.setQNA_SUBJECT(request.getParameter("QNA_SUBJECT"));
	         qnadata.setQNA_CONTENT(request.getParameter("QNA_CONTENT"));
	         
	         result = qnadao.qnaModify(qnadata);
	         if(result == false) {
	            System.out.println("게시판 수정 실패");
	            return null;
	         }
	         System.out.println("게시판 수정 완료");   
	         
	         forward.setRedirect(true);
	         forward.setPath("./QnaDetailAction.um?num=" + qnadata.getQNA_NUM());
	         //return forward;
	      }catch (Exception ex) {
	         ex.printStackTrace();
	      }
	      return forward;
	   }

}
