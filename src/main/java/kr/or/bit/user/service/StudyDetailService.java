package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dto.Study_Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyDetailService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        ActionForward forward = null;
        int no = Integer.parseInt(request.getParameter("no"));
        try {
            StudyDao dao = new StudyDao();
            int hitUp = dao.hitupPost(no);
            Study_Board sb = dao.getBoardByNo(no); //게시글 번호로 게시글 안의 자료 가져오기
            String cateName = dao.getCategorynameByNum(no);

            request.setAttribute("sb", sb); //board 데이터
            request.setAttribute("cateName", cateName); //카테고리 이름

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/study_read.jsp");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return forward;
    }
}
