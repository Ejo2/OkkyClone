package kr.or.bit.user.service.study;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dto.Study_Board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyEditConfirmService implements Action {


    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        Study_Board sb = new Study_Board();
        sb.setNo(Integer.parseInt(request.getParameter("no")));
        sb.setTitle(request.getParameter("title"));
        sb.setSido(request.getParameter("location1") +" "+request.getParameter("location2"));
        sb.setSt_categorynum(Integer.parseInt(request.getParameter("categoryCode")));
        sb.setExp(request.getParameter("carrier"));
        sb.setCloseok(Integer.parseInt(request.getParameter("deadline")));
        sb.setCont(request.getParameter("text"));

        StudyDao dao = new StudyDao();
        int result = dao.updateBoard(sb); //main board
        int result2 = dao.updateBoard_join(sb.getNo(),sb); //join studyboard

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/StudyPaging.so?page=1");

        return forward;
    }
}
