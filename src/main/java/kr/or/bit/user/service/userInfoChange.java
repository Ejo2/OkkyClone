package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 
 */
public class userInfoChange implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        String myId = (String) session.getAttribute("id");
        try{
            if (session.getAttribute("id") == null){
                forward.setPath("WEB-INF/views/login.jsp");
                
            }else{
                userDao dao = new userDao();
                
                userDto userInfo = dao.getUserInfoList(myId);
                request.setAttribute("userInfo",userInfo);
                
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        
        
        forward.setRedirect(false);
        
        forward.setPath("/WEB-INF/views/userInfoChange.jsp");
        return forward;
    }
    
}

























