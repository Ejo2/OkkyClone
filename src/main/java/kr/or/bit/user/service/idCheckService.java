package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 
 */
public class idCheckService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        System.out.println("id 출력출력"+id);
        int result = 0;
    
        userDao dao = new userDao();
        result = dao.userIdCheck(id);
        System.out.println("result 출력 출력"+result);
        if (result == 1){
            
            request.setAttribute("result", 1); //이미존재.
        }else{
            request.setAttribute("result", 0);
        }
        
        
    
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/valid/userValid.jsp");
        return forward;
    }
    
}

























