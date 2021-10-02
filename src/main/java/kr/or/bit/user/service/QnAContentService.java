package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;
import kr.or.bit.user.dto.Board;
import kr.or.bit.user.dto.Comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class QnAContentService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;

        String no = request.getParameter("no");
        String cpage = request.getParameter("cp"); // current page
        String pagesize = request.getParameter("ps"); // pagesize

        System.out.println("글번호" + no);

        Board board = new Board();
        List<Comments> replyList = new ArrayList<>(); //댓글 객체

        boolean isread = false;

        try {
            QnADao qnADao = new QnADao();

            // 총 댓글 건수
            int totalReplyCount = qnADao.totalReplyCount(Integer.parseInt(no));
            System.out.println("totalReplyCount = " + totalReplyCount);

            // 글 번호를 가지고 오지 않았을 경우 예외처리
            if (no == null || no.trim().equals("")) {
                response.sendRedirect("QnAList.qo");
                return null;
            }
            no = no.trim();

            if (cpage == null || cpage.trim().equals("")) {
                //default 값 설정
                cpage = "1";
            }
            if (pagesize == null || pagesize.trim().equals("")) {
                //default 값 설정
                pagesize = "5";
            }
                isread = qnADao.getReadNum(no); //조회수

            if (isread) {
               board = qnADao.QnAContent(Integer.parseInt(no));
              replyList = qnADao.replylist(no);
            }

            request.setAttribute("board", board);
            request.setAttribute("no", no);
            request.setAttribute("cp", cpage);
            request.setAttribute("ps", pagesize);
            request.setAttribute("replyList", replyList);
            request.setAttribute("totalReplyCount",totalReplyCount);

            forward = new ActionForward();
            forward.setRedirect(false); // forward
            forward.setPath("/WEB-INF/views/qna_board/qna_read.jsp");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return forward;
    }
}
