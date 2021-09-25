package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 
 */
public class JoinService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        userDto dto = new userDto();
        dto.setId(request.getParameter("id"));
        dto.setNickname(request.getParameter("nickname"));
        dto.setPw(request.getParameter("pw"));
        dto.setEmail(request.getParameter("email"));
//        dto.setPhoto(request.getParameter("photo"));
        dto.setPhoto("https://bit.ly/3kFwIYe");//회원가입할때 기본 프로필사진 올리기
        System.out.println("dto :" + dto.getPhoto());
        
        
        //선택하지 않는다면 기본 프로필 사진으로 맞춰집니다.
       
        
        System.out.println("dto:" + dto);
        userDao dao = new userDao();
        
        int result = dao.join(dto);
        
        String msg = "";
        String url = "";
        
        if (result > 0){
            msg = "등록성공";
            url = "/index.html";
        }else{
            msg = "등록실패";
            url = "/WEB-INF/views/join.jsp";
        }
        
        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect.jsp");
        
        return forward;
    }
    
}

























