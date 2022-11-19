package net.login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.login.db.UserBean;
import net.login.db.UserDAO;

public class UserLoginAction implements Action {

   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
   throws Exception{
      ActionForward forward = new ActionForward();
      
      HttpSession session = request.getSession();
      UserDAO userdao = new UserDAO();
      UserBean user = new UserBean();
      
      int result = -1;
      
      user.setUSER_ID(request.getParameter("USER_ID"));
      user.setUSER_PW(request.getParameter("USER_PW"));
      result = userdao.isUser(user);
      
      if (result == 0) {
         response.setContentType("text/html;charset=utf-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('비밀번호가 일치하지 않습니다.');");
         out.println("location.href='./UserLogin.kr';");
         out.println("</script>");
         out.close();
         return null;
      }else if (result == -1) {
         response.setContentType("text/html;charset=utf-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('아이디가 존재하지 않습니다.');");
         out.println("location.href='./UserLogin.kr';");
         out.println("</script>");
         out.close();
         return null;
      }
      
      // 로그인 성공 
      session.setAttribute("id", user.getUSER_ID());
      System.out.println("로그인 성공");
      forward.setRedirect(true);
      forward.setPath("./main.kr");
      return forward;
   }
}