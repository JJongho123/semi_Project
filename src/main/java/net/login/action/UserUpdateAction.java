package net.login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.login.db.UserBean;
import net.login.db.UserDAO;

public class UserUpdateAction implements Action {

   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      request.setCharacterEncoding("UTF-8");
      ActionForward forward = new ActionForward();
      boolean result = false;
   
      UserDAO userdao = new UserDAO();
      UserBean userdata = new UserBean();
      
      String id = request.getParameter("id"); //id로 세션을 가져옴
      
      boolean usercheck = userdao.isUserWriter(request.getParameter(id));
         
         if(usercheck == false) {
               response.setContentType("text/html;charset=UTF-8");
               PrintWriter out = response.getWriter();
               out.println("<script>");
               out.println("alert('수정할 권한이 없습니다.');");
               out.println("location.href='./ProductList.bo';");
               out.println("</script>");
               out.close();
               return null;
            }
      
      try {
         userdata.setUSER_PW(request.getParameter("USER_PW"));
         userdata.setUSER_NAME(request.getParameter("USER_NAME"));
         userdata.setUSER_ID(request.getParameter("USER_ID"));
         userdata.setUSER_PHONE1(request.getParameter("USER_PHONE1"));
         userdata.setUSER_PHONE2(request.getParameter("USER_PHONE2"));
         userdata.setUSER_ZIP_CODE(request.getParameter("USER_ZIP_CODE"));
         userdata.setUSER_ADDR(request.getParameter("USER_ADDR"));
        
         userdata.setUSER_EMAIL_F(request.getParameter("USER_EMAIL_F"));
         userdata.setUSER_EMAIL_B(request.getParameter("USER_EMAIL_B"));
         userdata.setUSER_EMAIL_S(request.getParameter("USER_EMAIL_S"));
         
         System.out.println("여기쯤이니");
         
         result = userdao.userModify(userdata);
         
         if(result == false) {
            System.out.println("회원 정보 수정 실패");
            return null;
         }
         System.out.println("회원 정보 수정 완료");   
         
         forward.setRedirect(true);
         forward.setPath("./main.kr");
         //return forward;
      }catch (Exception ex) {
         ex.printStackTrace();
      }
      return forward;
   }
}