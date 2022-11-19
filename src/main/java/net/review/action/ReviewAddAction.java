package net.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;

public class ReviewAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewdata = new ReviewBean();
		ActionForward forward = new ActionForward();

		String realFolder = "";
		String saveFolder = "/reviewupload";

		int fileSize = 5 * 1024 * 1024;

		// realFolder = request.getRealpath(saveFolder);

		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);

		boolean result = false;

		try {
			MultipartRequest multi = null;

			multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

			reviewdata.setREVIEW_ID(multi.getParameter("REVIEW_ID"));
			reviewdata.setREVIEW_SUBJECT(multi.getParameter("REVIEW_SUBJECT"));
			reviewdata.setREVIEW_CONTENT(multi.getParameter("REVIEW_CONTENT"));
			reviewdata.setREVIEW_IMAGE(multi.getFilesystemName((String) multi.getFileNames().nextElement()));

			result = reviewdao.boardInsert(reviewdata);

			if (result == false) {
				System.out.println("게시판 등록 실패");
				return null;
			}
			System.out.println("게시판 등록 완료");

			forward.setRedirect(true);
			forward.setPath("./ReviewBoard.rv");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}
}
