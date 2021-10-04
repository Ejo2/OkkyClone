package kr.or.bit.user.service.columns;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class columnReplyDeleteOkService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;

        ColumnDao columnDao;
        String msg="";
        String url="";
        int result = 0;

        try {
            int rno = Integer.parseInt(request.getParameter("rno"));
            System.out.println("rno = " + rno);
            columnDao = new ColumnDao();
            result = columnDao.columnReplyDelete(rno);

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
