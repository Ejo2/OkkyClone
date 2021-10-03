package kr.or.bit.user.service.userInfo;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 
 */
public class deleteUserService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
    
        String myId = (String) session.getAttribute("id");//로그인된 아이디
        String msg = "";
        String url = "";
        
        try{
            userDao dao = new userDao();
            int result = dao.deleteUser(myId);
            if (result > 0){
    
                msg = "회원 탈퇴 완료!";
                url = "/main.jsp";
            }else{
                msg = "회원 탈퇴 실패!";
                url = "userInfoChange.do";
            }
            
            
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);
        session.invalidate();//세션 비활성화
    
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
        
        return  forward;
    }
    
}

























