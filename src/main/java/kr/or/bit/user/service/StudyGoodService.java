package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyGoodService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type");
        int no = Integer.parseInt(request.getParameter("no"));
        StudyDao dao = new StudyDao();
        int result = dao.goodUpAndDown(no,type);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/StudyDetail.so?no="+no);
        return forward;
    }
}
