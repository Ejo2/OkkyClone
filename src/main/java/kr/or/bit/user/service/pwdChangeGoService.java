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
public class pwdChangeGoService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    
    
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
        String myPwd = "";
        try{
            if (session.getAttribute("id") == null){
                forward.setPath("/WEB-INF/views/login.jsp");
                
            }else{
                userDao dao = new userDao();
                userDto dto = dao.getUserInfoList(session.getAttribute("id"));
    
                System.out.println("패스워드 체인지의 비밀번호 전달값" + dto);
                myPwd = dto.getPw();
                System.out.println("왜 비번이 안보이는데????"+myPwd);
                
                request.setAttribute("myPwd", myPwd);
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/pwdChange.jsp");
    
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        
        return forward;
    }
    
}

























