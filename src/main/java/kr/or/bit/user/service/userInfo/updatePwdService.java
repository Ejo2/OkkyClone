package kr.or.bit.user.service.userInfo;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 
 */
public class updatePwdService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        
        String password = request.getParameter("newPassword");//변경된 비밀번호
        HttpSession session = request.getSession();
        String myId = (String) session.getAttribute("id");
        
        String msg = "";
        String url = "";
        
        try{
            userDao dao = new userDao();
            
            int result = dao.updateUserPwd(myId, password);
            System.out.println("업데이트 패스워드의 result를 찍어보자" + result);
            
            if (result > 0){
                
                msg = "패스워드 변경 성공";
                url = "userInfoChange.do";
            }else{
                
                msg = "패스워드 변경 실패";
                url = "userInfoChange.do";
            }
            
            
        }catch (Exception e){
            
            System.out.println(e.getMessage());
            
        }
        
        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
        
        return forward;
    }
    
}

























