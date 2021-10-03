package kr.or.bit.user.service.columns;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class columnDeleteService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;

        ColumnDao columnDao;

        try {
            int no = Integer.parseInt(request.getParameter("no"));
            columnDao = new ColumnDao();
            columnDao.deleteOk(no);
        } catch (NamingException e) {
            e.printStackTrace();
        }

        forward = new ActionForward();
        forward.setRedirect(false); // forward
        forward.setPath("/BoardList.go");

        return forward;
    }

}
