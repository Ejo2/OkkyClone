package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyInsertService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;
        forward = new ActionForward();
        
        //제대로 던져주나 테스트
        String title = request.getParameter("title");
        String location1 = request.getParameter("location1");
        String location2 = request.getParameter("location2");
        String categoryCode = request.getParameter("categoryCode");
        String carrier = request.getParameter("carrier");
        String deadline = request.getParameter("deadline");
        String text = request.getParameter("text");

        System.out.println(deadline);

        request.setAttribute("title", title);
        request.setAttribute("location1", location1);
        request.setAttribute("location2", location2);
        request.setAttribute("categoryCode", categoryCode);
        request.setAttribute("carrier", carrier);
        request.setAttribute("deadline",deadline);
        request.setAttribute("text", text);


        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/study_testing.jsp");
        return forward;
    }
}
