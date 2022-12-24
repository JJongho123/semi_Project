package net.firstpage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.dao.FreshDao;

public class CartDeleteAction implements Action
{
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      ActionForward forward = new ActionForward();
      request.setCharacterEncoding("utf-8");
      
      HttpSession session = request.getSession();
      int num = Integer.parseInt(request.getParameter("num"));
      
      boolean result=false;
      
      FreshDao freshdao = new FreshDao();
      
      result=freshdao.CartDelete(num);
      if(result==false) {
         System.out.println("삭제 실패");
         return null;
      }
      System.out.println("삭제 성공");
      forward.setRedirect(true);
      forward.setPath("./GoingCartum.bo");
      return forward;
   }

}