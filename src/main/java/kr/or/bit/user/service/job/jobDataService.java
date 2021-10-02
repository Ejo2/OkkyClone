package kr.or.bit.user.service.job;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 
 */
public class jobDataService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/jobdata.jsp");

        return forward;
    }
    
}

























