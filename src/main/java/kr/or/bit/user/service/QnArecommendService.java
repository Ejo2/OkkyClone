package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class QnArecommendService implements Action {
    ActionForward forward = null;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        int no = Integer.parseInt(request.getParameter("no"));//글번호
        String status = request.getParameter("status");//good이냐 bad냐
        System.out.println("status = " + status);
        int good_val=(status.equals("good"))?1:-1; //
        String msg = "";

        try {
            QnADao qnADao = new QnADao();
            int result = qnADao.recommend(no, good_val);

            msg = (result == 1)?"ok":"no";  //결과값
            response.setContentType("text/html;charset=utf-8"); //한글처리
            PrintWriter out = response.getWriter();
            out.print(msg);
        } catch (NamingException | IOException e) {
            e.printStackTrace();
        }
        return forward;
    }


}
