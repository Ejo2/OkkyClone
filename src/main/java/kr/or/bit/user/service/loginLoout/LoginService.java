package kr.or.bit.user.service.loginLoout;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 
 */
public class LoginService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        ActionForward forward = new ActionForward();
        userDao dao = new userDao();
        userDto dto = dao.login(id, pw);
    
        if (dto != null){
    
            HttpSession session = request.getSession();
            
            session.setAttribute("id", id);
            session.setAttribute("photo", dto.getPhoto());
            
            session.setAttribute("nickname", dto.getNickname());
//            session.setAttribute("email", dto.getEmail());
            
            System.out.println(id);
            
            forward.setRedirect(true);
            forward.setPath("/main.do");
            
        }else{
            
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/loginlogout/login.jsp");
        }
        return forward;
    }
    
}

























