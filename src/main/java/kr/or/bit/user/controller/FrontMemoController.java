package kr.or.bit.user.controller;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.service.idCheckService;
import kr.or.bit.user.service.job.jobDataService;
import kr.or.bit.user.service.job.jobService;
import kr.or.bit.user.service.join.JoinGoService;
import kr.or.bit.user.service.join.JoinService;
import kr.or.bit.user.service.join.MainGoService;
import kr.or.bit.user.service.loginLoout.LoginGoService;
import kr.or.bit.user.service.loginLoout.LoginService;
import kr.or.bit.user.service.loginLoout.logoutService;
import kr.or.bit.user.service.userInfo.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("*.do")
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
        }else if (url_Command.equals("/job.do")){ //jobOffer
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
    
        }else if (url_Command.equals("/jobData.do")){ //jobdata를 json으로 생성
            action = new jobDataService();
            forward = action.execute(request, response);
            System.out.println("jobData.do");
        }else if (url_Command.equals("/validation.do")){
            action = new validationService();
            forward = action.execute(request, response);
    
        }else if (url_Command.equals("/pwdChangeGo.do")){
            action = new pwdChangeGoService();
            
            forward = action.execute(request, response);
        }else if (url_Command.equals("/updatePwd.do")){
            action = new updatePwdService();
            forward = action.execute(request, response);
        }else if (url_Command.equals("/byebyeGo.do")){
            action = new deleteUserService();
            forward = action.execute(request, response);
    
            System.out.println("byebyeGo.do");
        }else if (url_Command.equals("/profileChange.do")){
            action = new profileChangeService();
            forward = action.execute(request, response);
    
            System.out.println("profileChange.do");
        }else if (url_Command.equals("/main.do")){ //main화면
            action = new MainGoService();
            forward = action.execute(request, response);

            System.out.println("main.do");
        }else if(url_Command.equals("/myContentGo.do")){
            
            action = new myContentService();
            forward = action.execute(request, response);
            
        }else if (url_Command.equals("/idCheck.do")){
            
            System.out.println("idCheck.do");
            action = new idCheckService();
            forward = action.execute(request, response);
            
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
