package net.firstpage.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.vo.CartVo;
import net.firstpage.db.ProductDAO;

public class CartListAction implements Action
{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");
      
      ActionForward forward = new ActionForward();
      HttpSession session=request.getSession();
         String id=(String)session.getAttribute("id");
         
         ProductDAO prodao = new ProductDAO();
         
         
         List cartList = new ArrayList();
         
         cartList = prodao.getCartList(id);
         
         request.setAttribute("cartList", cartList);
         
         forward.setRedirect(false);
         forward.setPath("./fresh/cartList.jsp");

         return forward;
         
         
      
   }
   
}