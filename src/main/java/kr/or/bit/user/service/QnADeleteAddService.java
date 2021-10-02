package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;
import kr.or.bit.user.dto.Board;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnADeleteAddService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;

        QnADao qnADao;

        try {
            int no = Integer.parseInt(request.getParameter("no"));
            qnADao = new QnADao();
            qnADao.qnaDelete(no);
        } catch (NamingException e) {
            e.printStackTrace();
        }

        forward = new ActionForward();
        forward.setRedirect(false); // forward
        forward.setPath("/QnAList.qo");

        return forward;
    }
}
