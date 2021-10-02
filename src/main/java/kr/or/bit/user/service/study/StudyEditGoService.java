package kr.or.bit.user.service.study;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyCategoryDao;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dto.Study_Board;
import kr.or.bit.user.dto.Study_category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class StudyEditGoService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;
        int no = Integer.parseInt(request.getParameter("no"));
        try {
            StudyDao dao = new StudyDao();
            Study_Board sb = dao.getBoardByNo(no);
            request.setAttribute("sb", sb);

            StudyCategoryDao dao2 = new StudyCategoryDao();
            List<Study_category> categoryList = dao2.getCategoryList();
            request.setAttribute("categoryList", categoryList);

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/study/study_edit.jsp");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return forward;
    }
}
