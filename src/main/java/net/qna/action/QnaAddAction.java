package net.qna.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.qna.dao.QNADAO;
import net.qna.vo.QNAVO;

public class QnaAddAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		QNADAO qnadao = new QNADAO();
		QNAVO qnadata = new QNAVO();
		ActionForward forward = new ActionForward();
		
		String realFolder="";
		String uploadFolder="/qnaupload";
		
		int fileSize=5*1024*1024;
		
		String saveFolder = request.getSession().getServletContext().getRealPath(uploadFolder);
		System.out.println(saveFolder);
		
		boolean result=false;
		
		try {
			MultipartRequest multi=null;
			
			multi=new MultipartRequest(request,
						saveFolder,
						fileSize,
						"utf-8",
						new DefaultFileRenamePolicy()
					);
			
			qnadata.setQNA_ID(multi.getParameter("QNA_ID"));
			qnadata.setQNA_SUBJECT(multi.getParameter("QNA_SUBJECT"));
			qnadata.setQNA_CONTENT(multi.getParameter("QNA_CONTENT"));
			qnadata.setQNA_FILE(
					multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			result=qnadao.qnaInsert(qnadata);
			
			if(result==false) {
				System.out.println("게시판 등록 실패");
				return null;
			}
			System.out.println("게시판 등록완료");
			
			forward.setRedirect(true);
			forward.setPath("./QnaList.um");
			return forward;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}