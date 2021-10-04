package kr.or.bit.user.service.study;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyCategoryDao;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dao.userDao;
import kr.or.bit.user.dto.StudyCriteria;
import kr.or.bit.user.dto.Study_Board;
import kr.or.bit.user.dto.Study_category;
import kr.or.bit.user.dto.userDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class StudyPagingWithSearchService implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        int pageNum = Integer.parseInt(request.getParameter("page"));
        String sr = request.getParameter("search");
        String search = "%"+request.getParameter("search") +"%"; //쿼리용으로 따로 제작한거

        ActionForward forward = null;
        StudyCriteria sc = new StudyCriteria();

        if(search.equals("")){
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = null;
            try {
                out = response.getWriter();
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.print("<script>");
            out.print("alert('비정상적');");
            out.print("</script>");
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/StudyPaging.so?page=1");

        }else{
            StudyCategoryDao dao2 = new StudyCategoryDao();
            List<Study_category> categoryList = dao2.getCategoryList();
            request.setAttribute("categoryList", categoryList); //sort 창 때문에

            ArrayList<userDto> userlist = new ArrayList<userDto>();
            userDao ud = new userDao();
            userlist = ud.selectAllUserDto();
            request.setAttribute("userlist",userlist);//어트리뷰트 2 : user아이디와 글쓴이 매핑-> 사진 찾아오려고

            try{
                StudyDao dao = new StudyDao();
                List<Study_Board> boardlist = dao.getBoardListByPageNumWithSearch(pageNum,search);

                request.setAttribute("boardlist", boardlist);

                long post = dao.countPostWithSearch(search);

                /////////////boardCriteria 세팅//////////////
                sc.setTotalPost(post);
                //sc.setPostPerPage(); --생성자 5
                sc.setTotalPage((int) Math.ceil(sc.getTotalPost() / 5.0));
                sc.setCurrentPage(pageNum);
                //bc.setPagePerBlock(); --생성자 3
                sc.setTotalBlock((int) Math.ceil((double) (sc.getTotalPage()) / (double) (sc.getPagePerBlock())));


                //bc.setCurrentBlock(); --생성자(1 , 프론트 단에서 세팅)
                if (sc.getCurrentPage() > sc.getPagePerBlock()){
                    for (int i = 1; i <= sc.getTotalBlock(); i++){
                        if (sc.getCurrentPage() >= i * sc.getPagePerBlock() + 1 && sc.getCurrentPage() <= sc.getPagePerBlock() * (i + 1)){
                            sc.setCurrentBlock(i + 1);
                            i = sc.getTotalBlock() + 1;
                        }
                    }
                }
                request.setAttribute("StudyCriteria", sc);
                request.setAttribute("search",sr);
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("/WEB-INF/views/study/study_sort.jsp");

            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
        return forward;
    }
}
