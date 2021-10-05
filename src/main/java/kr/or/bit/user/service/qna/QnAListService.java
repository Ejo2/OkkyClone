package kr.or.bit.user.service.qna;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;
import kr.or.bit.user.dto.Board;
import kr.or.bit.utils.QnAPager;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class QnAListService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        ActionForward forward = null;

        try {
            QnADao qnADao = new QnADao();

            // 게시물 총 건수
            int totalboardcount = qnADao.totalBoardCount();
            System.out.println("totalboardcount = " + totalboardcount);
            // 상세보기 >> 다시 LIST 넘어올때 >> 현재 페이지 설정
            String ps = request.getParameter("ps"); // pagesize
            String cp = request.getParameter("cp"); // current page

            // List 페이지 처음 호출
            if (ps == null || ps.trim().equals("")) {
                // default 값 설정
                ps = "5"; // 5개씩
            }
            if (cp == null || cp.trim().equals("")) {
                // default 값 설정
                cp = "1"; // 1번째 페이지 보겠다
            }

            int pagesize = Integer.parseInt(ps);
            int cpage = Integer.parseInt(cp);
            int pagecount = 0;

            if (totalboardcount % pagesize == 0) {
                pagecount = totalboardcount / pagesize; // 20 << 100/5
            } else {
                pagecount = (totalboardcount / pagesize) + 1;
            }

            // 102건 : pagesize=5 >> pagecount=21페이지
            // 전체 목록 가져오기
            List<Board> qnalist = qnADao.qnaList(cpage, pagesize);
            System.out.println("list.size() = " + qnalist.size());
            int pagersize=3; // 한 페이지에 번호를 몇개까지 보일것인지
            QnAPager pager = new QnAPager(totalboardcount,cpage,pagesize,pagersize,"QnAList.qo");

            request.setAttribute("pagesize", pagesize);
            request.setAttribute("cpage", cpage);
            request.setAttribute("pagecount", pagecount);
            request.setAttribute("qnalist", qnalist);
            request.setAttribute("totalboardcount", totalboardcount);
            request.setAttribute("pager", pager);

            forward = new ActionForward();
            forward.setRedirect(false); // forward
            forward.setPath("/WEB-INF/views/qna_board/qna_list.jsp");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return forward;
    }
}
