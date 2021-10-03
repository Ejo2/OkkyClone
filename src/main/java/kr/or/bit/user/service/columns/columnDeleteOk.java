package kr.or.bit.user.service.columns;

        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import kr.or.bit.user.action.Action;
        import kr.or.bit.user.action.ActionForward;
        import kr.or.bit.user.dao.ColumnDao;
        import javax.naming.NamingException;

public class columnDeleteOk implements Action {

        @Override
        public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

            String no = request.getParameter("no");

            String msg="";
            String url="";

            ColumnDao dao;
            try {
                dao = new ColumnDao();
                int result = dao.deleteOk(no);
                if(result > 0){
                    msg="delete success";
                    url="BoardList.go";
                }else{
                    msg="delete fail";
                    url="BoardList.go";
                }
            } catch (NamingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            request.setAttribute("board_msg",msg);
            request.setAttribute("board_url",url);


            ActionForward forward = new ActionForward();
            forward.setRedirect(false); // forward
            forward.setPath("/WEB-INF/views/redirect/redirect.jsp");

            return forward;
        }
    }
