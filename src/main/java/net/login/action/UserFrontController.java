package net.login.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.login.db.UserDAO;

public class UserFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet { static final long serialVersionUID = 1L;

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("user~!");
    	String RequestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = RequestURI.substring(contextPath.length());
    	
    	UserDAO userdao = new UserDAO();
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	if (command.equals("/UserLogin.kr")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./member/loginform.jsp");

    	} else if (command.equals("/UserJoin.kr")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./member/joinform.jsp");
    	
    	} else if (command.equals("/UserLogout.kr")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./member/logout.jsp");
    	
    	} else if (command.equals("/main.kr")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./firstpage/main_page.jsp");
    	
    	} else if(command.equals("/UserLoginAction.kr")) {
    		action = new UserLoginAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
    			e.printStackTrace();
    		}
    			
    	} else if (command.equals("/main.kr")) {
	    		forward = new ActionForward();
	    		forward.setRedirect(false);
	    		forward.setPath("main.jsp");
    	
    	} else if (command.equals("/UserJoinAction.kr")) {
    		action = new UserJoinAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
    			e.printStackTrace();
			}
    	} else if (command.equals("/UserIdCheckAction.kr")) {
    		System.out.println("UserIdCheckAction.kr 컨트롤러 실행중 ! ");
    		BufferedReader br = request.getReader();
    		String userid = br.readLine();
    		System.out.println(userid);
    		int result = userdao.joinIdCheck(userid);
    		PrintWriter out = response.getWriter();
    		System.out.println(result);
    		if(result == 1){
    			out.print("ok");
    		}else{
    			out.print("fail");
    		}
    		out.flush();
    		}
    	// 업데이트 확인용@@@@@@@@@@@@@@@@@@@
    	else if (command.equals("/UserInfo.kr")) { //회원 정보 보기
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("./member/infoform.jsp");
            
         } else if(command.equals("/UserInfoAction.kr")) { //회원 정보 보기 액션
                action = new UserInfoAction();
                try {
                   forward = action.execute(request, response);
                }catch (Exception e) {
                   e.printStackTrace();
                }
                
         } 
       /*  else if (command.equals("/UserUpdate.kr")) { //회원 정보 수정
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("./member/updateform.jsp");
            
         } 
         */
         else if(command.equals("/UserUpdateAction.kr")) { //회원 정보 수정 액션
                action = new UserUpdateAction();
                try {
                   forward = action.execute(request, response);
                }catch (Exception e) {
                   e.printStackTrace();
                }
         }
       	/*else if (command.equals("/UserUpdateAction.kr")) {
    		action = new UserUpdateAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
    			e.printStackTrace();
			}
    	} 
    	
    	} else if(command.equals( "/MemberListAction.me")) {
    		action = new MemberListAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
    			e.printStackTrace();
			}
    		
    	} else if(command.equals( "/MemberViewAction.me")) {
    		action = new MemberViewAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
    			e.printStackTrace();
    		}

    	} else if(command.equals( "/MemberDeleteAction.me")) {
    		action = new MemberDeleteAction();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
    			e.printStackTrace();
    		}
    	
    	}*/
 
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		} else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("get~!");
		
		doProcess (request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("post~!");
		
		doProcess (request, response);
	}
}