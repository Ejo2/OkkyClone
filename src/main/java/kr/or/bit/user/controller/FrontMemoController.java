package kr.or.bit.user.controller;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/member.do")
public class FrontMemoController extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    
    public FrontMemoController(){
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url_Command = requestURI.substring(contextPath.length());
        
        Action action = null;
        ActionForward forward = null;
        if (url_Command.equals("/loginGo.do")){
            action = new LoginGoService();
            forward = action.execute(request, response);
            
        }else if (url_Command.equals("/login.do")){
            action = new LoginService();
            forward = action.execute(request, response);
            System.out.println("login.do");
        }else if (url_Command.equals("/joinGo.do")){
            action = new JoinGoService();
            forward = action.execute(request, response);
            System.out.println("joinGo.do");
    
        }else if (url_Command.equals("/join.do")){
            action = new JoinService();
            forward = action.execute(request, response);
            System.out.println("join.do");
            
        }else if (url_Command.equals("/logout.do")){
            action = new logoutService();
            forward = action.execute(request, response);
            System.out.println("logout.do");
            
        }else if (url_Command.equals("/memberDetailGo.do")){
            //UI 페이지 이동
            action = new memberDetailGoService();
            forward = action.execute(request, response);
            System.out.println("memberDetailGo.do");
        }else if (url_Command.equals("/job.do")){
            action = new jobService();
            forward = action.execute(request, response);
            System.out.println("job.do");
        }else if (url_Command.equals("/scrapListGo.do")){
            
            action = new scrapListGoService();
            forward = action.execute(request, response);
    
        }else if (url_Command.equals("/userInfoChange.do")){
    
            action = new userInfoChange();
            forward = action.execute(request, response);
            System.out.println("userInfoChange.do");
    
        }else if (url_Command.equals("/updateUserNickname.do")){
            
            action = new updateUserNicknameService();
            forward = action.execute(request, response);
            System.out.println("updateUserNickname.do");
    
        }else if (url_Command.equals("/updateUserEmail.do")){
    
            action = new updateUserEmailService();
            forward = action.execute(request, response);
            System.out.println("updateUserEmail.do");
    
        }else if (url_Command.equals("/jobData.do")){ //jobdata를 json으로 생성
            action = new jobDataService();
            forward = action.execute(request, response);
            System.out.println("jobData.do");
        }
        
        if (forward != null){
            if (forward.isRedirect()){ //true
                response.sendRedirect(forward.getPath());
            }else{ //false (모든 자원 ) 사용
                System.out.println("forward != null else" + forward);
                //UI
                //UI + 로직
                //forward url 주소 변환 없어 View 내용을 받을 수 있다
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        }
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doProcess(request, response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doProcess(request, response);
    }
    
}
