package kr.or.bit.user.service.columns;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;
import kr.or.bit.user.dto.Board;
import kr.or.bit.user.dto.userDto;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class columnEditOkService implements Action {
    
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        int no = Integer.parseInt(request.getParameter("no"));
        
        
        String id = (String) session.getAttribute("id");
        String nickname = (String) session.getAttribute("nickname");
        
        String title = request.getParameter("title");
        String cont = request.getParameter("text");
        
        System.out.println("cont + " + cont);
        System.out.println("id + " + id);
        System.out.println("title + " + title);
        System.out.println("cont + " + cont);
        System.out.println("cont + " + cont);
    
        userDto user = new userDto();
        
        user.setNickname(nickname);
        user.setId(id);
        
        Board board = new Board();
        board.setId(id);
        board.setTitle(title);
        board.setCont(cont);
        board.setNo(no);
        board.setId(id);
        board.setId(id);
        
        System.out.println("에딧 서비스 no" + no);
        
        String msg = "";
        String url = "";
        
        ActionForward forward = null;
        
        try{
            ColumnDao ColumnDao = new ColumnDao();
            
            if (no==0){
                msg = "글번호 입력 오류";
                url = "BoardList.go";
            }else{
                int result = ColumnDao.columnEdit(board);
                
                if (result > 0){
                    msg = "edit success";
                    url = "BoardList.go";
                }else{
                    msg = "edit fail";
                    url = "BoardEdit.go?no=" + no;
                }
            }
            request.setAttribute("board_msg", msg);
            request.setAttribute("board_url", url);
            
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
            
        }catch (NamingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return forward;
    }
}
