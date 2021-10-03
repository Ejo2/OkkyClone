package kr.or.bit.user.service.qna;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class QnAReplyDeleteOkService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
        ActionForward forward = null;


        QnADao qnADao;
        String msg="";
        String url="";
        int result = 0;
        try {
            int rno = Integer.parseInt(request.getParameter("rno"));
            System.out.println("rno = " + rno);
            qnADao = new QnADao();
            result = qnADao.qnaReplyDelete(rno);

            msg = (result > 0)?"ok":"no";

            response.setContentType("text/html;charset=utf-8");
            PrintWriter writer = response.getWriter();
            writer.print(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }



        return forward;
    }
}
