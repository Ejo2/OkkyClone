package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyCategoryDao;
import kr.or.bit.user.dto.Study_category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class StudyWriteGoService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;

        StudyCategoryDao dao = new StudyCategoryDao();
        List<Study_category> categoryList = dao.getCategoryList();

        request.setAttribute("categoryList", categoryList);

        forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/study_write.jsp");


        return forward;
    }
}
