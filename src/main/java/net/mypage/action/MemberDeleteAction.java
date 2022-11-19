package net.mypage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.login.db.UserBean;
import net.mypage.db.MypageBean;
import net.mypage.db.MypageDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		boolean result = false;
		
		MypageDAO userdao = new MypageDAO();
	   // MypageBean user = new MypageBean();
	      
	      
	    System.out.println("null일때 id " + id);
	      

		
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./UserLogin.kr");
			return forward;
			
		}
		
		result = userdao.deleteMember(id);
		
		if (result == false) {
			System.out.println("회원 삭제 실패");
			return null;
		}
		//탈퇴 성공시 메인 페이지 이동
		System.out.println("회원 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./Mainpage.bo");
		return forward;
	}
}