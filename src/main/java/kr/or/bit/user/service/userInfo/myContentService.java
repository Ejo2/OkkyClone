package kr.or.bit.user.service.userInfo;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kr.or.bit.user.action.Action;
import kr.or.bit.user.action.ActionForward;
import kr.or.bit.user.dao.userDao;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

/*
 
 */
public class myContentService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
        int bno = Integer.parseInt(request.getParameter("bno"));
        int no = Integer.parseInt(request.getParameter("no"));
        
        System.out.println("bno 찍히는 것만 보자"+bno);
        System.out.println("id 찍히는 것만 보자" + no);
        
        String url = "";
    
        if (bno == 100){ //100번 칼럼
            url = "/BoardContent.go?no"+no;
            
        }else if (bno == 200){ //200번 큐앤
            url = "/QnAContent.qo?no="+no;
    
        }else if (bno == 300){ //300번 스터디
            url = "/StudyDetail.so?no="+no;
    
        }else if (bno == 400){ //400번 구인
            url = "";
        }
        
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        
        forward.setPath(url);
        return forward;
    }
    
}

























