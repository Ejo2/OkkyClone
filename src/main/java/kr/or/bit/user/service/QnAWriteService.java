package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnAWriteService  implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;

        forward = new ActionForward();
        forward.setRedirect(false); // forward
        forward.setPath("/WEB-INF/views/qna_board/qna_write.jsp");

        return forward;
    }
}
