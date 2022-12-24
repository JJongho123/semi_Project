package net.firstpage.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.firstpage.db.ProductDAO;

public class MainFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session=request.getSession();
       
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		ProductDAO prodata = new ProductDAO();

			// 1.리스트
		if (command.equals("/ProductList.bo")) {
			action = new ProductListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
			// 2.상품등록 페이지 연결
		else if (command.equals("/ProductAdd.bo")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./firstpage/product_add.jsp");


		}
			// 3. 상품추가 !!
		else if (command.equals("/ProductAddAction.bo")){
			action = new ProductAddAction();
			
			try {
				forward = action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}

			// 5. 상품 상세정보
		else if (command.equals("/ProductDetail.bo")) {
			   action = new ProductDetailAction();
		         try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }


		}
		   // 6. 상품 삭제
		else if (command.equals("/ProductDelete.bo")) {
			   action = new ProductDeleteAction();
		         try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}

			// 7. 카트에 상품 담기
		else if (command.equals("/GoingCart.bo")) {
			   action = new GoingCartAction();
		         try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         
		}
			// 8. 카트 페이지에서 리스트로 뽑기
		else if (command.equals("/GoingCartum.bo")) {
		action = new CartListAction();
				         try {
				            forward = action.execute(request, response);
				         } catch (Exception e) {
				            e.printStackTrace();
				         }
			
		}
			// 9. 상품 수정 페이지
		else if (command.equals("/ProductModify.bo")) {
			   action = new ProductModifyView();
		         try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}
			// 10. 상품 수정 액션 페이지
		else if (command.equals("/ProductModifyAction.bo")) {
			   action = new ProductModifyAction();
		         try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		}
			// 11 . 카트에서 상품 삭제
	      else if (command.equals("/DeleteCart.bo")) {
	            action = new CartDeleteAction();
	               try {
	                  forward = action.execute(request, response);
	               } catch (Exception e) {
	                  e.printStackTrace();
	               }

	}
		// 카트 상품수량 올리기
		else if (command.equals("/QuantityUp.bo")) {
			System.out.println("QuantityUp.bo 컨트롤러 실행중 ! ");
			int num = Integer.parseInt(request.getParameter("num"));
			int quan = Integer.parseInt(request.getParameter("quan"));
			
			
    		System.out.println(num);
    		prodata.quantityUp(num, quan);
    	
    		forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("GoingCartum.bo");
    		
    		}
		
		// 카트 상품수량 내리기
		else if (command.equals("/QuantityDown.bo")) {
				System.out.println("QuantityDown.bo 컨트롤러 실행중 !@@ ");
				int num = Integer.parseInt(request.getParameter("num"));
				int quan = Integer.parseInt(request.getParameter("quan"));
				
				if(quan<=1) {
					 response.setContentType("text/html;charset=utf-8");
			         PrintWriter out = response.getWriter();
			         out.println("<script>");
			         out.println("alert('더이상 수량을 낮출수 없습니다.');");
			         out.println("location.href='GoingCartum.bo';");
			         out.println("</script>");
			         out.close();
			         return;
				
				}
		
		    	System.out.println(num);
		    	prodata.quantityDown(num, quan);
		    	
		    	forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("GoingCartum.bo");
		    		
		    }
	
	
			// forward 하기위한 필수코드
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());

			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("board doGet()~~~~~~~\n");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("board doPost()%%%%%%%%%%% \n");
		doProcess(request, response);
	}

}