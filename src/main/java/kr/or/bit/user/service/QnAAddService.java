package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;
import kr.or.bit.user.dto.Board;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAAddService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        String title = request.getParameter("title");
        String cont = request.getParameter("cont");

        System.out.println("title = " + title);
        System.out.println("cont = " + cont);

        int result = 0;
        Board board = new Board();

        board.setTitle(title);
        board.setCont(cont);


        try {
            QnADao qnADao = new QnADao();
            result = qnADao.qnaWriteok(board);

        } catch (NamingException e) {
            e.printStackTrace();
        }

        String msg = "";
        String url = "";
        if (result > 0) {
            msg = "insert success";
            url = "QnAList.qo";
        } else {
            msg = "insert fail";
            url = "QnAWrite.qo";
        }

        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect.jsp");

        return forward;
    }
}
