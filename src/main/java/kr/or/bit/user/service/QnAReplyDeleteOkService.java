package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAReplyDeleteOkService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;


        QnADao qnADao;

        try {
            int rno = Integer.parseInt(request.getParameter("rno"));
            qnADao = new QnADao();
            qnADao.qnaReplyDelete(rno);
        } catch (NamingException e) {
            e.printStackTrace();
        }

        forward = new ActionForward();
        forward.setRedirect(false); // forward
        forward.setPath("/QnAList.qo");

        return forward;
    }
}
