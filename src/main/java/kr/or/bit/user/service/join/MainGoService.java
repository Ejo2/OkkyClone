package kr.or.bit.user.service.join;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.MainDao;
import kr.or.bit.user.dto.MainContentsDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/*
 
 */
public class MainGoService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        ActionForward forward = null ;
        
        try {
            MainDao mainDao = new MainDao();
            ArrayList<MainContentsDto> getSBoardList = mainDao.getSBoardList();
            ArrayList<MainContentsDto> getBoardList = mainDao.getBoardList();
            ArrayList<MainContentsDto> getBoardListHit = mainDao.getBoardListHit();
            
            request.setAttribute("getSBoardList", getSBoardList);
            request.setAttribute("getBoardList", getBoardList);
            request.setAttribute("getBoardListHit", getBoardListHit);
            
            System.out.println("getSBoardList 값 여기요~" + getSBoardList);
            System.out.println("getBoardList 값 여기요~" + getBoardList);
            
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/main.jsp");
            System.out.println("forward 값 여기요~" + forward);
            
        }catch (Exception e){
            System.out.println("서비스단 문제" + e.getMessage());
        }
        return forward;
    }
    
}

























