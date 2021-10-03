package kr.or.bit.user.service.study;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dto.Study_Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyInsertService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;
        forward = new ActionForward();

        Study_Board sb = new Study_Board();
        sb.setId(request.getParameter("nickname"));
        sb.setTitle(request.getParameter("title"));
        sb.setSido(request.getParameter("location1") +" "+request.getParameter("location2"));
        sb.setSt_categorynum(Integer.parseInt(request.getParameter("categoryCode")));
        sb.setExp(request.getParameter("carrier"));
        sb.setCloseok(Integer.parseInt(request.getParameter("deadline")));
        sb.setCont(request.getParameter("text"));

        StudyDao dao = new StudyDao();
        int result =dao.insertBoard(sb);

        int count = dao.getMaxNo();
        int result2 = dao.insertBoard_join(sb,count);

        forward.setRedirect(false);
        forward.setPath("/StudyPaging.so?page=1");
        return forward;
    }
}
