package kr.or.bit.user.service.study;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//쓰지 않는 서비스(비동기로 controller에서 할 예정)
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
