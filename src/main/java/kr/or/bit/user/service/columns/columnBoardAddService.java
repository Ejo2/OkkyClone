package kr.or.bit.user.service.columns;

        import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;
import kr.or.bit.user.dto.Board;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class columnBoardAddService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        String title = request.getParameter("title");
        String cont = request.getParameter("cont");
        HttpSession session = request.getSession();

        int result = 0;

        Board board = new Board();

        board.setTitle(title);
        board.setCont(cont);
        board.setId((String) session.getAttribute("id")); //아이디 세션

        try {
            ColumnDao dao = new ColumnDao();

            result = dao.writeok(board);

        } catch (NamingException e) {
            e.printStackTrace();
        }


        // write.jsp 화면 >> writeok.jsp 처리 >> service >> dao > DB 작업 >
        // return dao > return service > writeok.jsp 결과처리 >> 이동 (공통) >> redirect.jsp

        String msg = "";
        String url = "";
        if (result > 0) {
            msg = "insert success";
            url = "BoardList.go";
        } else {
            msg = "insert fail";
            url = "BoardWrite.go";
        }

        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect/redirect.jsp");

        return forward;

    }

}
