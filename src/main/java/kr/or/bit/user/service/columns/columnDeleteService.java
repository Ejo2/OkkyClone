package kr.or.bit.user.service.columns;

        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;

        import kr.or.bit.user.action.Action;
        import kr.or.bit.user.action.ActionForward;

public class columnDeleteService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        String msg="";
        String url="";

        //삭제글 처리 (글번호 받기)
        String no = request.getParameter("no");
        String cpage = request.getParameter("cp"); // current page
        String pagesize = request.getParameter("ps"); // pagesize
        String referer = (String)request.getHeader("Referer");

        ActionForward forward = null;

        if(no == null || no.trim().equals("")){
            msg ="글번호가 넘어오지 않았습니다";
            url = "BoardContent.do?no=" + no;
            request.setAttribute("board_msg", msg);
            request.setAttribute("board_url", url);

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/redirect.jsp");

        } else {
            request.setAttribute("no", no);
            request.setAttribute("cp", cpage);
            request.setAttribute("ps", pagesize);

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/BoardDeleteOk.go");
        }

        return forward;
    }

}
