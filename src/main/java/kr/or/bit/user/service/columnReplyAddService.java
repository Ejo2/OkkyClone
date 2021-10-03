package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;
import kr.or.bit.user.dto.Comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class columnReplyAddService implements Action {

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

            if(result > 0){
                msg ="댓글 입력 성공";
                url ="BoardContent.go?no="+no;
            }else{
                msg="댓글 입력 실패";
                url="BoardContent.go?no="+no;
            }
        } catch (Exception e) {
            e.getStackTrace();
        }

        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect.jsp");

        return forward;
    }
}
