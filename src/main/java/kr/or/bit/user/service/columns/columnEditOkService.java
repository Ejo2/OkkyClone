package kr.or.bit.user.service.columns;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class columnEditOkService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String no = request.getParameter("no");
        
        System.out.println("에딧 서비스 no" + no);
        
        String msg = "";
        String url = "";
        
        ActionForward forward = null;

        try {
            ColumnDao ColumnDao = new ColumnDao();

            if (no == null || no.trim().equals("")) {
                msg = "글번호 입력 오류";
                url = "BoardList.go";
            }else {
                int result = ColumnDao.columnEdit(request);

                if (result > 0) {
                    msg = "edit success";
                    url = "BoardList.go";
                } else {
                    msg = "edit fail";
                    url = "BoardEdit.go?no=" + no;
                }
            }
            request.setAttribute("board_msg", msg);
            request.setAttribute("board_url", url);

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/redirect/redirect.jsp");

        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return forward;
    }
}
