package kr.or.bit.user.service.columns;

        import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;
import kr.or.bit.user.dto.Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class columnEditService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        //수정하기
        String no = request.getParameter("no");
        System.out.println("수정게시판 번호=" + no);
        String msg="";
        String url="";
    
        ColumnDao columnDao = null;
        System.out.println("columnEditService 의 트라이전");
        ActionForward forward = null;
        try {
            if(no == null || no.trim().equals("")){
                response.sendRedirect("BoardList.go"); //cpage=1 , ps=5
                return null;
            }
            columnDao = new ColumnDao();
            System.out.println("columnEditService 의 트라이전");

            Board board = columnDao.columnEditContent(no);
            System.out.println("Board 출력 !!!!!!!!!!!!!!"+board);

            if(board == null){
                msg ="데이터 오류";
                url ="BoardList.go";

                request.setAttribute("board_msg", msg);
                request.setAttribute("board_url", url);

                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/redirect/redirect.jsp");

            }else {
                request.setAttribute("no", no);
                request.setAttribute("board", board);
                System.out.println("setAttribute(\"board\", board) 출력 !!!!!!!!!!!!!!");

                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/columns/columnedit.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return forward;
    }
}
