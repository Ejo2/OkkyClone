package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;
import kr.or.bit.user.dto.Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class columnContentService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;

        String no = request.getParameter("no");
        String cpage = request.getParameter("cp"); // current page
        String pagesize = request.getParameter("ps"); // pagesize

        System.out.println("글번호" + no);

        Board board = new Board();
        //List<Reply> replyList = new ArrayList<>();

        boolean isread = false;

        try {
            ColumnDao columnDao = new ColumnDao();
            // 글 번호를 가지고 오지 않았을 경우 예외처리
            if (no == null || no.trim().equals("")) {
                response.sendRedirect("BoardList.go");
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


            isread = columnDao.getReadNum(no);

            if (isread) {
                board = columnDao.columnContent(Integer.parseInt(no));
                //  replyList = dao.replylist(idx);
            }

            request.setAttribute("board", board);
            request.setAttribute("no", no);
            request.setAttribute("cp", cpage);
            request.setAttribute("ps", pagesize);
            //request.setAttribute("replyList", replyList);

            forward = new ActionForward();
            forward.setRedirect(false); // forward
            forward.setPath("/WEB-INF/views/columncontent.jsp");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return forward;
    }
}
