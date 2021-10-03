package kr.or.bit.user.controller;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.service.QnACommentListService;
import kr.or.bit.user.service.QnAReplyAddService;
import kr.or.bit.user.service.qna.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("*.qo")
public class FrontQnAController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FrontQnAController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url_Command = requestURI.substring(contextPath.length());

        Action action = null;
        ActionForward forward = null;

        if (url_Command.equals("/QnAList.qo")) {
            action = new QnAListService();
            forward = action.execute(request, response);
        } else if (url_Command.equals("/QnAWrite.qo")) {
            action = new QnAWriteService();
            forward = action.execute(request, response);
        } else if (url_Command.equals("/QnAWriteOK.qo")) {
            System.out.println("글쓰기 실행");
            action = new QnAAddService();
            forward = action.execute(request, response);
        } else if (url_Command.equals("/QnAContent.qo")) {
            System.out.println("상세보기");
            action = new QnAContentService();
            forward = action.execute(request, response);
        } else if (url_Command.equals("/QnAEdit.qo")) {
            action = new QnAEditService();
            forward = action.execute(request, response);
            System.out.println("수정실행");
        } else if (url_Command.equals("/QnAEditOk.qo")) {
            action = new QnAEditOkService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/QnAReplyOk.qo")) {
            System.out.println("댓글실행!");
            action = new QnAReplyAddService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/QnADeleteOk.qo")) {
            System.out.println("삭제실행!");
            action = new QnADeleteAddService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/recommendOk.qo")) { //ajax
            System.out.println("추천실행!");
            action = new QnArecommendService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/ReplyDeleteOk.qo")) {
            action = new QnAReplyDeleteOkService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/getQnaCommentList.qo")) {
            action = new QnACommentListService();
            forward = action.execute(request, response);
        }


        if (forward != null) {
            if (forward.isRedirect()) { //true
                response.sendRedirect(forward.getPath());
            } else {
                System.out.println("forward != null else" + forward);
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
        }


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
}
