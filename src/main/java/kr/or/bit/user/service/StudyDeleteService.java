package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyDeleteService implements Action {


    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        int no = Integer.parseInt(request.getParameter("no"));

        StudyDao dao = new StudyDao();
        int result = dao.deleteBoard(no);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/StudyPaging.so?page=1");

        return forward;
    }
}
