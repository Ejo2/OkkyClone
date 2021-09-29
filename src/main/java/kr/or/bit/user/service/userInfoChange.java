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
        
        System.out.println("123");
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("id"));
        
        try{
            
            String myId = (String) session.getAttribute("id");
            System.out.println("myId");
            
            if (session.getAttribute("id") == null){
                
                forward.setPath("/WEB-INF/views/login.jsp");
                
            }else{
                
                userDao dao = new userDao();
                
                userDto userInfo = dao.getUserInfoList(myId);
                request.setAttribute("userInfo", userInfo);
                
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/userInfoChange.jsp");
                
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            System.out.println("파이널리");
        }
        
        
        return forward;
    }
    
}

























