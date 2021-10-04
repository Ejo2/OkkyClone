package kr.or.bit.user.service.study;

import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.StudyCategoryDao;
import kr.or.bit.user.dao.StudyDao;
import kr.or.bit.user.dto.StudyCriteria;
import kr.or.bit.user.dto.Study_Board;
import kr.or.bit.user.dto.Study_category;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class StudyPagingService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        
        int pageNum = Integer.parseInt(request.getParameter("page"));
        ActionForward forward = null;
        StudyCriteria sc = new StudyCriteria();

        StudyCategoryDao dao2 = new StudyCategoryDao();
        List<Study_category> categoryList = dao2.getCategoryList();

        request.setAttribute("categoryList", categoryList); //sort 창 때문에

        try{
            StudyDao dao = new StudyDao();
            List<Study_Board> boardlist = dao.getBoardListByPageNum(pageNum);
            
            request.setAttribute("boardlist", boardlist);
            
            long post = dao.countPost();
            
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
            
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/study/study.jsp");
            
        }catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        
        
        return forward;
    }
    
}
