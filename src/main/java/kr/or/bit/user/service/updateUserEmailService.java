package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 
 */
public class updateUserEmailService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        String myId = (String) session.getAttribute("id");
        
        
        return null;
    }
    
}

























