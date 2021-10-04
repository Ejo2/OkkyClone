package kr.or.bit.user.service;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.QnADao;
import kr.or.bit.user.dto.Comments;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

public class QnACommentListService implements Action {
    ActionForward forward = null;
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String no = request.getParameter("no");//글번호
        System.out.println("no = " + no);
        try {
            QnADao qnADao = new QnADao();
            List<Comments> replylist = qnADao.replylist(no); //이 글에대한 댓글 목록 가져오기
            System.out.println("replylist.size() = " + replylist.size());
            JSONArray arr = new JSONArray(); //json배열 생성
            for (int i=0; i<replylist.size(); i++){
                JSONObject json = new JSONObject(); //json 객체 생성
                Comments comments = replylist.get(i); //조회해온 댓글 하나하나 json 객체에 담는 과정
                json.put("no",comments.getNo());
                json.put("rno",comments.getRno());
                json.put("id",comments.getId().toString());
                json.put("cont",comments.getRcont().toString());
                json.put("date",comments.getRdate().toString());
                arr.add(json);//[{no:1,rno:10,id:a...}  , {no:1,rno:11,id:a...} , {no:1,rno:12,id:a...}]
            }
            response.setContentType("application/json"); //한글처리
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.print(arr); //ajax랑 친구! 값을 내려주겠다
        } catch (NamingException | IOException e) {
            e.printStackTrace();
        }

        return forward;
    }
}
