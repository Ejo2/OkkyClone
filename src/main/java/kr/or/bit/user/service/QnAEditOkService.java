package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAEditOkService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String no = request.getParameter("no");


        String msg = "";
        String url = "";
        ActionForward forward = null;

        try {
            QnADao qnADao = new QnADao();

            if (no == null || no.trim().equals("")) {
                msg = "글번호 입력 오류";
                url = "QnAList.qo";
            }else {
                int result = qnADao.qnaBoardEdit(request);

                if (result > 0) {
                    msg = "edit success";
                    url = "QnAList.qo";
                } else {
                    msg = "edit fail";
                    url = "QnAEdit.qo?no=" + no;
                }
            }
            request.setAttribute("board_msg", msg);
            request.setAttribute("board_url", url);

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/redirect.jsp");

        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return forward;
    }
}
