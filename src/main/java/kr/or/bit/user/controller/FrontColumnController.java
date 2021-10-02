package kr.or.bit.user.controller;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.service.columns.columnBoardAddService;
import kr.or.bit.user.service.columns.columnListService;

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

        if(url_Command.equals("/BoardList.go")) { //글쓰기 처리
            //UI+로직
            action = new columnListService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/BoardWrite.go")) { //만약 있다면 상세보기
            //UI 제공 ...
            //예) /WEB-INF/views/memoview.jsp 가정
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/columns/columnwrite.jsp");
        }else if(url_Command.equals("/BoardWriteOK.go")) { //만약 있다면 상세보기
            //UI 제공 ...
            //예) /WEB-INF/views/memoview.jsp 가정
            action = new columnBoardAddService();
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
