package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;
import kr.or.bit.user.dto.Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAEditService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        //수정하기
        String no = request.getParameter("no");
        System.out.println("수정게시판 번호=" + no);
        String msg="";
        String url="";

        QnADao qnADao;

        ActionForward forward = null;
        try {
            if(no == null || no.trim().equals("")){
                response.sendRedirect("QnAList.qo");
                return null;
            }
            qnADao = new QnADao();

           Board board = qnADao.qnaEditContent(no);

            if(board == null){
                msg ="데이터 오류";
                url ="QnAList.qo";

                request.setAttribute("board_msg", msg);
                request.setAttribute("board_url", url);

                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/redirect.jsp");

            }else {
                request.setAttribute("no", no);
                request.setAttribute("board", board);

                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/qna_board/qna_edit.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return forward;
    }
}
