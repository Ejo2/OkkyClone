package kr.or.bit.user.service.loginLoout;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 
 */
public class logoutService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        session.invalidate();
    
        ActionForward forward = new ActionForward();
    
        forward.setRedirect(false);
        forward.setPath("/main.do");
        return forward;
    }
    
}

























