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
public class profileChangeService implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
    
        HttpSession session = request.getSession();
        String myId = (String) session.getAttribute("id");
        String msg = "";
        String url = "";
        
        String path = "/upload";
        ServletContext context = request.getSession().getServletContext();
        String uploadpath = context.getRealPath(path);
        System.out.println("업로드 패스!"+uploadpath);
        int result = 0;
        try{
        
        
            //cos.jar 파일에서 제공하는 MultipartRequest 객체 사용
        
            //업로드 파일에 대한 기본 정보 세팅
            int size = 1024 * 1024 * 10; //10M 네이버 계산기
            String name = "";
            String title = "";
            String filename1 = "";
            String filename2 = "";
            String orifilename1 = "";
            String orifilename2 = "";
        
        
            MultipartRequest multi = new MultipartRequest(
                    request, //기존에 있는  request 객체의 주소값
                    uploadpath, //실 저장 경로 (배포경로)
                    size, //10M
                    "UTF-8",
                    new DefaultFileRenamePolicy() //파일 중복(upload 폴더 안에:a.jpg -> a_1.jpg(업로드 파일 변경) )
            ); //파일 업로드 완료
        
        
            //여기까지 수행하면 upload 폴더에 파일이 저장
    
            Enumeration filenames = multi.getFileNames();
    
            String file1 = (String) filenames.nextElement();
            filename1 = multi.getFilesystemName(file1);
            orifilename1 = multi.getOriginalFileName(file1);
    //////////////////////////////////////////////////////////////////
            userDao dao = new userDao();
            result = dao.setPhoto(myId, orifilename1);
            if (result > 0){
                msg = "프로필 사진 수정완료";
                url = "userInfoChange.do";
            }else{
                msg = "프로필 사진 수정실패";
                url = "userInfoChange.do";
            }
            request.setAttribute("filename", orifilename1);
    
        }catch (Exception e){
            e.printStackTrace();
        }
        request.setAttribute("board_msg", msg);
        request.setAttribute("board_url", url);
    
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("/WEB-INF/views/redirect/redirect.jsp");
        
        return forward;
    }
    
}

























