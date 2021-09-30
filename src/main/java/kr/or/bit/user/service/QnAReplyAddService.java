package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;
import kr.or.bit.user.dto.Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAReplyAddService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {


        String id = request.getParameter("id");
        String rcont = request.getParameter("rcont");
        String no = request.getParameter("no");
        String removed = request.getParameter("removedOk");


        System.out.println("댓글 아이디=" + id);
        System.out.println("댓글내용=" + rcont);



        //Reply reply = new Reply();
        String msg="";
        String url="";

        try {
            QnADao dao = new QnADao();
            int boardNo = Integer.parseInt(no);
            int removedOk = Integer.parseInt(removed);

            int result = dao.qnaReplyWrite(boardNo, id, rcont, removedOk);


            if(result > 0){
                msg ="댓글 입력 성공";
                url ="QnAContent.qo?no="+boardNo;
            }else{
                msg="댓글 입력 실패";
                url="QnAContent.qo?no="+boardNo;
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect.jsp");

        return forward;
    }
}
