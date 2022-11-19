
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

		if (id == null) {

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Login required');");
			out.println("location.href='./UserLogin.kr';");
			out.println("</script>");
			out.close();

			return null;
		}

		int num = Integer.parseInt(request.getParameter("num"));

		cartvo = prodao.getdetailcart(num, id);

		result = prodao.cartInsert(cartvo);

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
		forward.setPath("./ProductList.bo");
		return forward;
	}
}
