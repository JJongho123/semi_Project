
package net.firstpage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.cart.vo.CartVo;
import net.firstpage.db.ProductDAO;

public class GoingCartAction implements Action {

   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("utf-8");

      ActionForward forward = new ActionForward();
      HttpSession session = request.getSession();
      String id = (String) session.getAttribute("id");

      ProductDAO prodao = new ProductDAO();

      CartVo cartvo = new CartVo();

      boolean result = false; 
      
      boolean result2 = false;

      if (id == null) {

         response.setContentType("text/html;charset=utf-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('로그인이 필요합니다');");
         out.println("location.href='./UserLogin.kr';");
         out.println("</script>");
         out.close();

         return null;
      }
      

      int num = Integer.parseInt(request.getParameter("num"));
      
      result2 = prodao.CheckCart(num);
      
      if(result2 == true) {
    	  response.setContentType("text/html;charset=utf-8");
          PrintWriter out = response.getWriter();
          out.println("<script>");
          out.println("alert('장바구니에 이미 담겨있습니다.');");
          out.println("location.href='./ProductDetail.bo?num="+num+"';");
          out.println("</script>");
          out.close();
    	  
          return null;
          
          
      }
     
      else if(result2 == false) {
    	  

      cartvo = prodao.getdetailcart(num, id);

      result = prodao.cartInsert(cartvo);
      }
      if (cartvo == null) {
         System.out.println("cartvo is null");
      }

      if (result == false) {
         System.out.println("Failed to send cart value");
         return null;
      }

      System.out.println("Successful transfer of cart value");

      forward.setRedirect(true);
      //forward.setPath("./GoingCartum.bo");
      forward.setPath("./ProductDetail.bo?num="+num);
      return forward;
   }
}