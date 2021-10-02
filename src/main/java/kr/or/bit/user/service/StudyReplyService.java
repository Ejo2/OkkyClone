package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dto.Comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyReplyService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;
        forward = new ActionForward();

        Comments cm = new Comments();
        cm.setNo(Integer.parseInt(request.getParameter("no")));
        cm.setRcont(request.getParameter("repltext"));

        StudyDao dao = new StudyDao();
        int result =dao.insertReply(cm);

        forward.setRedirect(false);
        forward.setPath("/StudyDetail.so?no="+cm.getNo());
        return forward;
    }
}
