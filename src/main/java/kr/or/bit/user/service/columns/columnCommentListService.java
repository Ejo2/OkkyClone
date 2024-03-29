package kr.or.bit.user.service.columns;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.ColumnDao;
import kr.or.bit.user.dto.Comments;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class columnCommentListService  implements Action {
    ActionForward forward = null;
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String no = request.getParameter("no");//글번호
        System.out.println("no = " + no);
        try {
            ColumnDao columnDao = new ColumnDao();
            List<Comments> replylist = columnDao.replylist(no);
            System.out.println("replylist.size() = " + replylist.size());
            JSONArray arr = new JSONArray();
            for (int i=0; i<replylist.size(); i++){
                JSONObject json = new JSONObject();
                Comments comments = replylist.get(i);
                json.put("no",comments.getNo());
                json.put("rno",comments.getRno());
                json.put("id",comments.getId().toString());
                json.put("cont",comments.getRcont().toString());
                json.put("date",comments.getRdate().toString());
                arr.add(json);
            }
            response.setContentType("application/json"); //한글처리
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.print(arr);
        } catch (NamingException | IOException e) {
            e.printStackTrace();
        }

        return forward;
    }
}
