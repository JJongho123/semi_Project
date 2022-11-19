package net.login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.login.db.UserBean;
import net.login.db.UserDAO;


public class UserJoinAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		UserDAO userdao = new UserDAO();
		UserBean user = new UserBean();
		
		boolean result = false;
		boolean result2 = true;
		
		user.setUSER_ID(request.getParameter("USER_ID"));
		user.setUSER_PW(request.getParameter("USER_PW"));
		user.setUSER_PW(request.getParameter("USER_PW2"));
		user.setUSER_NAME(request.getParameter("USER_NAME"));
		user.setUSER_PHONE1(request.getParameter("USER_PHONE1"));
		user.setUSER_PHONE2(request.getParameter("USER_PHONE2"));
		user.setUSER_ZIP_CODE(request.getParameter("USER_ZIP_CODE"));
		user.setUSER_ADDR(request.getParameter("USER_ADDR"));
		user.setUSER_YEAR(Integer.parseInt(request.getParameter("USER_YEAR")));
		user.setUSER_MONTH(Integer.parseInt(request.getParameter("USER_MONTH")));
		user.setUSER_DAY(Integer.parseInt(request.getParameter("USER_DAY")));
		user.setUSER_GENDER(request.getParameter("USER_GENDER"));
		user.setUSER_EMAIL_F(request.getParameter("USER_EMAIL_F"));
		user.setUSER_EMAIL_B(request.getParameter("USER_EMAIL_B"));
		user.setUSER_EMAIL_S(request.getParameter("USER_EMAIL_S"));
		
		result = userdao.joinUser(user);
		
		if (result == false) {
			System.out.println("회원가입 실패");
			return null;
		}
		//
		forward.setRedirect(true);
		forward.setPath("./UserLogin.kr");
		return forward;
	}
}
