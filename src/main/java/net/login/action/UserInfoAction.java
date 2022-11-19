package net.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.login.db.UserBean;
import net.login.db.UserDAO;

public class UserInfoAction implements Action {

   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
         ActionForward forward = new ActionForward();
            request.setCharacterEncoding("utf-8");

            UserDAO userdao = new UserDAO();
            UserBean userdata = new UserBean();
            
            String id = request.getParameter("id"); //id로 세션을 가져옴
           
            userdata = userdao.getDetail_user(id);
            System.out.println(id);
            if (userdata == null) {
               System.out.println("(수정) 상세보기 실패");
               return null;
            }
            System.out.println("(수정)상세보기 성공");

            request.setAttribute("userdata", userdata);
            forward.setRedirect(false);
            forward.setPath("./member/infoform.jsp");
            return forward;
   }
}