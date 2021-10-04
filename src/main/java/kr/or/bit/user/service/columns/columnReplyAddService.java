package kr.or.bit.user.service.columns;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;
import kr.or.bit.user.dto.Comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class columnReplyAddService implements Action {
    ActionForward forward = null;
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        String rcont = request.getParameter("rcont");
        String no = request.getParameter("no");
        HttpSession session = request.getSession();

        System.out.println("댓글내용=" + rcont);
        System.out.println("게시물댓글번호=" + no);

        int result = 0;

        Comments reply = new Comments();

        String msg="";
        String url="";

        try {
            reply.setNo(Integer.parseInt(no));
            reply.setRcont(rcont);
            reply.setId((String) session.getAttribute("id")); //로그인 한 사람만 댓글 작성 가능

            ColumnDao dao = new  ColumnDao ();
            result = dao.columnReplyWrite(reply);

            msg = (result > 0)?"ok":"no";

            response.setContentType("text/html;charset=utf-8");
            PrintWriter writer = response.getWriter();
            writer.print(msg);
        } catch (Exception e) {
            e.getStackTrace();
        }


        return forward;
    }
}
