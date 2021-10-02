package kr.or.bit.user.service;

import com.sun.xml.internal.ws.util.xml.DummyLocation;
import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.rmi.activation.ActivationID;

/*
 
 */
public class validationService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    
        HttpSession session = request.getSession();
        String myId = (String) session.getAttribute("id");
        String email = request.getParameter("email");
        System.out.println("변경변경"+email);
        String msg = "";
        String url = "";
        try{
            
            userDao dao = new userDao();
            int result = dao.updateUserEmail(email, myId);
        
            if (result > 0){
                msg = "이메일 변경 성공";
            }else{
                msg = "이메일 변경 실패";
            }
            url = "userInfoChange.do";
        }catch (Exception e){
        
            System.out.println(e.getMessage());
        }
        
        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect.jsp");
        
        
        return forward;
    }
    
}

























