package kr.or.bit.user.controller;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.service.columns.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.go")
public class FrontColumnController extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    public FrontColumnController(){
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url_Command = requestURI.substring(contextPath.length());
        
        Action action = null;
        ActionForward forward = null;
        
        if (url_Command.equals("/BoardList.go")){ //게시판 리스트
            
            action = new columnListService();
            forward = action.execute(request, response);
            
        }else if (url_Command.equals("/BoardWrite.go")){ //글쓰기
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/columns/columnwrite.jsp");
        }else if (url_Command.equals("/BoardWriteOK.go")){ //글쓰기 ok
            action = new columnBoardAddService();
            forward = action.execute(request, response);
        }else if (url_Command.equals("/BoardContent.go")){
            
            System.out.println("상세보기");
            action = new columnContentService();
            
            forward = action.execute(request, response);
        }else if (url_Command.equals("/BoardEdit.go")){
            
            action = new columnEditService();
            forward = action.execute(request, response);
            System.out.println("수정실행");
            
        }else if (url_Command.equals("/BoardEditOk.go")){
            
            action = new columnEditOkService();
            forward = action.execute(request, response);
        }else if (url_Command.equals("/BoardReplyOk.go")){
            System.out.println("댓글실행!");
            
            action = new columnReplyAddService();
            forward = action.execute(request, response);
            
        }else if (url_Command.equals("/BoardDeleteOk.go")){
            
            System.out.println("삭제실행!");
            action = new columnDeleteService();
            forward = action.execute(request, response);
            
        }else if (url_Command.equals("/recommendOk.go")){ //ajax
            
            System.out.println("추천실행!");
            action = new columnrecommendService();
            forward = action.execute(request, response);
            
        }else if (url_Command.equals("/ReplyDeleteOk.go")){
            
            action = new columnReplyDeleteOkService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/getCommentList.go")) {
            action = new columnCommentListService();
            forward = action.execute(request, response);
        }
        
        if (forward != null){
            if (forward.isRedirect()){ //true
                response.sendRedirect(forward.getPath());
            }else{ //false (모든 자원 ) 사용
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
