package kr.or.bit.user.service.study;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.Study_Board;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class StudyDetailService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

        ActionForward forward = null;
        int no = Integer.parseInt(request.getParameter("no"));
        try {
            StudyDao dao = new StudyDao();
            int hitUp = dao.hitupPost(no);
            Study_Board sb = dao.getBoardByNo(no); //게시글 번호로 게시글 안의 자료 가져오기
            String cateName = dao.getCategorynameByNum(no);

            int replyCount = dao.countReplyByNo(no);//특정게시글에 달린 댓글 수 세기

            ArrayList<userDto> userlist = new ArrayList<userDto>();
            userDao ud = new userDao();
            userlist = ud.selectAllUserDto();
            request.setAttribute("userlist",userlist);//user아이디와 글쓴이 매핑-> 사진 찾아오려고


            request.setAttribute("sb", sb); //board 데이터
            request.setAttribute("cateName", cateName); //카테고리 이름
            request.setAttribute("replyCount",replyCount); //게시글에 딸린 댓글수

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/study/study_read.jsp");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return forward;
    }
}
