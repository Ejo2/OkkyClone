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

@WebServlet("*.go")
public class FrontColumnController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FrontColumnController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url_Command = requestURI.substring(contextPath.length());

        Action action=null;
        ActionForward forward=null;

        if(url_Command.equals("/BoardList.go")) { //게시판 리스트
            action = new columnListService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/BoardWrite.go")) { //글쓰기
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/columnwrite.jsp");
        }else if(url_Command.equals("/BoardWriteOK.go")) { //글쓰기 OK
            action = new columnBoardAddService();
            forward = action.execute(request, response);
        }else if (url_Command.equals("/BoardContent.go")) { //상세보기
            System.out.println("상세보기");
            action = new columnContentService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/BoardEdit.go")) { //수정하기
            action = new columnEditService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/BoardEditOk.go")) {
            action = new columnEditOkService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/BoardDelete.go")) { //삭제하기
            action = new columnDeleteService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/BoardDeleteOk.go")) { //삭제하기 ok
            action = new columnDeleteOk();
            forward = action.execute(request, response);
        }




        if(forward != null) {
            if(forward.isRedirect()) { //true
                response.sendRedirect(forward.getPath());
            }else { //false (모든 자원 ) 사용
                //UI
                //UI + 로직
                //forward url 주소 변환 없어 View 내용을 받을 수 있다
                RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        }


    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
