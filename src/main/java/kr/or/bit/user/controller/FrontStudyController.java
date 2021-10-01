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


@WebServlet("*.so")
public class FrontStudyController extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public FrontStudyController(){
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url_Command = requestURI.substring(contextPath.length());

        System.out.println(requestURI);
        System.out.println(contextPath);
        System.out.println(url_Command);

        Action action=null;
        ActionForward forward=null;

        if(url_Command.equals("/StudyWrite.so")) {//글쓰는 곳으로 이동만하기
            action = new StudyWriteGoService();
            forward = action.execute(request, response);

        }else if(url_Command.equals("/StudyWriteSubmit.so")) {//스터디 게시판 글 넣기
            action = new StudyInsertService();
            forward = action.execute(request, response);
            
        }else if(url_Command.equals("/StudyPaging.so")) {//스터디 게시판 리스트 with 페이징
            action = new StudyPagingService();
            forward = action.execute(request, response);
            
        }else if(url_Command.equals("/StudyDetail.so")) {//스터디 디테일뷰
            action = new StudyDetailService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/StudyEdit.so")) {//스터디글 글번호로 수정 페이지로가기
            action = new StudyEditGoService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/StudyEditConfirm.so")) {//스터디글 글번호로 수정 반영하기
            action = new StudyEditConfirmService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/StudyDelete.so")) {//스터디글 글번호로 삭제
            action = new StudyDeleteService();
            forward = action.execute(request, response);
        }else if(url_Command.equals("/StudyGood.so")) {//스터디 좋아요&싫어요
            action = new StudyGoodService();
            forward = action.execute(request, response);
        }else{
            System.out.println("정해진 바 없는 uri 요청!");
            action = new StudyWriteGoService();
            forward = action.execute(request, response);
        }

        if(forward != null) {
            if(forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            }else {

                RequestDispatcher dis  = request.getRequestDispatcher(forward.getPath());
                try {
                    dis.forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                }
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
