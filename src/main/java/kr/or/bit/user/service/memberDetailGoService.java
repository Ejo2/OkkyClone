package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.boardDto;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/*
 
 */
public class memberDetailGoService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        
        ActionForward forward = new ActionForward();
        
        HttpSession session = request.getSession();
        
        
        try{
            if (session.getAttribute("id") == null){
                
                forward.setPath("/WEB-INF/views/login.jsp");
                
            }else{
                
                userDao dao = new userDao();
                String ps = request.getParameter("ps");//pageSize
                String cp = request.getParameter("cp"); //currentPage
                
                
                //ps,  cp 값이 없는 경우 _기본값_설정
                if (ps == null || ps.equals("")){
                    //디폴트 값을 명시합니다.
                    ps = "5"; //나는 5개의 묶음을 한 페이지로 잡을 것입니다.
                }
                if (cp == null || cp.equals("")){
                    //디폴트 값을 명시합니다.
                    cp = "1"; //cp값의 기본값을 첫 번째 페이지를 보게할 것입니다.
                }
                int pagesize = Integer.parseInt(ps);
                int cpage = Integer.parseInt(cp);
                
                
                //작성자가 작성한 게시글 리스트
                List<boardDto> writeBoardList = dao.getUserDetailBoardList(session.getAttribute("id"), cpage, pagesize);
                List<boardDto> totalBoardList = dao.getTotalBoardList(session.getAttribute("id"));
                System.out.println("writeBoardList : " +writeBoardList);
                System.out.println("totalBoardList : "+totalBoardList);
                //작성자의 회원정보 관련 리스트
                userDto userInfo = dao.getUserInfoList(session.getAttribute("id"));
                System.out.println("userInfo" + userInfo);
                
                //작성자 스크랩 내역 관련 리스트
                List<boardDto> userScrapList = dao.getUserScrapList(session.getAttribute("id"));
                System.out.println("userScrapList : "+userScrapList);
                
                //게시글 작성개수
                int totalBoardCount = totalBoardList.size();
                System.out.println(totalBoardCount);
                
                //페이징
                int pageCount = 0;
                if (totalBoardCount % pagesize == 0){
                    
                    pageCount = totalBoardCount / pagesize;
                }else{
                    pageCount = totalBoardCount / pagesize + 1;
                }
                
                request.setAttribute("pagesize", pagesize);
                request.setAttribute("cpage", cpage);
                request.setAttribute("pageCount", pageCount);
                request.setAttribute("totalBoardCount", totalBoardCount);
                
                
                request.setAttribute("writeBoardList", writeBoardList);
                request.setAttribute("userInfo", userInfo);
                request.setAttribute("userScrapList", userScrapList);
                
                System.out.println("회원의 글목록을 띄웁니다.");
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/memberDetail.jsp");
                
            }
        }catch (Exception e){
            
            System.out.println(e.getMessage());
            
        }
        
        
        return forward;
    }
    
}

























