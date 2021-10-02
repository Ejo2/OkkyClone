package kr.or.bit.user.service.userInfo;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 
 */
public class updateUserNicknameService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        String nickname = request.getParameter("nickname");
        HttpSession session = request.getSession();
        String myId = (String) session.getAttribute("id");
        
        String msg = "";
        String url = "";
        
        try{
            
            userDao dao = new userDao();
            
            int result = dao.updateUserNickname(nickname,myId);
    
            if (result > 0){
                msg = "닉네임 변경 성공";
                url = "userInfoChange.do";
            }else{
                msg = "닉네임 변경 실패";
                url = "userInfoChange.do";
            }
      
            
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

























