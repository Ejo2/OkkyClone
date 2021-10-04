package kr.or.bit.user.dao;

import kr.or.bit.user.dto.Comments;
import kr.or.bit.user.dto.Study_Board;
import kr.or.bit.utils.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudyDao {
    ///게시글 쓰기 : 메인게시판 부분////////////////////////////////////////////////////
    public int insertBoard(Study_Board sb) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionHelper.getConnection("oracle");//추가
            //board에 대한 삽입
            String sql1 = "insert into board(no,bno,id,title,cont,hit,good,removedok,scrapnum) values((select nvl(max(no),0) + 1 from board),300,?,?,?,0,0,0,0)";
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, sb.getId());
            pstmt.setString(2, sb.getTitle());
            pstmt.setString(3, sb.getCont());
            resultrow = pstmt.executeUpdate();

            //B_study 에 대한 삽입  : 이건 나중에 따로
            /*String sql2 = "insert into b_study(no,st_categorynum,sido,exp,closeok) values(    ,?,?,?,0)";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, sb.getSt_categorynum());
            pstmt.setString(2,sb.getSido());
            pstmt.setString(3, sb.getExp());
            resultrow = pstmt.executeUpdate();*/


        } catch (Exception e) {
            System.out.println("Insert : " + e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
            try {
                conn.close(); //받환하기
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultrow;
    }

    ///게시글 쓰기 : study 에 필요한 부분만////////////////////////////////////////////////////
    public int insertBoard_join(Study_Board sb, int count) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionHelper.getConnection("oracle");

            String sql2 = "insert into b_study(no,st_categorynum,sido,exp,closeok) values(?,?,?,?,0)";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, count);
            pstmt.setInt(2, sb.getSt_categorynum());
            pstmt.setString(3, sb.getSido());
            pstmt.setString(4, sb.getExp());
            resultrow = pstmt.executeUpdate();


        } catch (Exception e) {
            System.out.println("Insert : " + e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
            try {
                conn.close(); //받환하기
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultrow;
    }

    ///max no 가져오기////////////////////////////////////////////////////
    public int getMaxNo() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;


        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "select max(no) as counting from board";
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();


            while (rs.next()) {
                result = rs.getInt("counting");
                System.out.println("table row갯수 : " + result);

            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);

        } catch (SQLException e) {
            System.out.println("DAO단에서 문제 발생!");
            e.printStackTrace();
        }

        return result;
    }

    ///리스트 단 페이징 처리////////////////////////////////////////////////////
    public ArrayList<Study_Board> getBoardListByPageNum(int pageNum) {
        ArrayList<Study_Board> boardlist = new ArrayList<Study_Board>();
        PreparedStatement pstmt = null;
        String sql = "select * from(select rownum rn,no,id, title,hit,writedate,good,scrapnum,st_categorynum,sido,exp,closeok,removedok from ( select b.no ,id, title,hit,writedate,good,scrapnum,st_categorynum,sido,exp,closeok,removedok from board b join b_study s on b.no = s.no where removedok =0 order by no desc) where rownum <= ?) where rn >= ?";
        int startPost = 0; //rn을 의미함
        if (pageNum == 1) {
            startPost = 1; //1페이지의 첫번째 rn
        } else {
            startPost = 5 * (pageNum - 1) + 1; //해당 페이지의 첫번째 rn
        }
        ;

        try {
            Connection conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startPost + 4);
            pstmt.setInt(2, startPost);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Study_Board sb = new Study_Board();
                sb.setNo(rs.getInt("no"));
                sb.setId(rs.getString("id"));
                sb.setTitle(rs.getString("title"));
                sb.setHit(rs.getInt("hit"));
                sb.setWritedate(rs.getTimestamp("writedate"));
                sb.setGood(rs.getInt("good"));
                sb.setScrapNum(rs.getInt("scrapNum"));
                sb.setSt_categorynum(rs.getInt("st_categorynum"));
                sb.setSido(rs.getString("sido"));
                sb.setExp(rs.getString("exp"));
                sb.setCloseok(rs.getInt("closeok"));
                boardlist.add(sb);
            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boardlist;
    }

    ///table의 게시글 갯수 세기////////////////////////////////////////////////////
    public int countPost() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "select count(*) as counting from board where removedok=0 and bno=300";
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();


            while (rs.next()) {
                result = rs.getInt("counting");
                System.out.println("table row갯수 : " + result);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    //게시글 번호로 게시글상세 가져오기///////////////////////////////////
    public Study_Board getBoardByNo(int no) {
        PreparedStatement pstmt = null;
        String sql = "select b.no ,id, title,hit,writedate,cont,good,scrapnum,st_categorynum,sido,exp,closeok,removedok from board b join b_study s on b.no = s.no where b.no=?";

        Study_Board sb = new Study_Board();

        try {
            Connection conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                sb.setNo(rs.getInt("no"));
                sb.setId(rs.getString("id"));
                sb.setTitle(rs.getString("title"));
                sb.setCont(rs.getString("cont"));
                sb.setHit(rs.getInt("hit"));
                sb.setWritedate(rs.getTimestamp("writedate"));
                sb.setGood(rs.getInt("good"));
                sb.setScrapNum(rs.getInt("scrapNum"));
                sb.setSt_categorynum(rs.getInt("st_categorynum"));
                sb.setSido(rs.getString("sido"));
                sb.setExp(rs.getString("exp"));
                sb.setCloseok(rs.getInt("closeok"));

            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sb;
    }

    //게시글 번호로 스터디 카테고리의 이름을 가져오기///////////////////////////////////
    public String getCategorynameByNum(int no) {
        PreparedStatement pstmt = null;
        String sql = "select no, sub.st_categorynum,st_category from (select b.no ,st_categorynum from board b join b_study s on b.no = s.no) sub join study_category cate on sub.st_categorynum = cate.st_categorynum where no=?";

        String cateName = "";

        try {
            Connection conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                cateName = rs.getString("st_category");
            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cateName;
    }

    //게시글 번호로 글 찾아서 수정하기///////////////////////////////////
    public int updateBoard(Study_Board sb) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "update board set title=? ,cont=? where no=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, sb.getTitle());
            pstmt.setString(2, sb.getCont());
            pstmt.setInt(3, sb.getNo());
            resultrow = pstmt.executeUpdate();

            if (resultrow > 0) {
                System.out.println("반영된 행의 수 : " + resultrow);
            } else {
                System.out.println("반영된 행이 없다");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return resultrow;
    }

    //게시글 번호로 글 찾아서 수정하기 : study 관련 부분만///////////////////////////////////
    public int updateBoard_join(int no, Study_Board sb) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "update b_study set st_categorynum=? ,sido=? ,exp=?, closeok=? where no=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, sb.getSt_categorynum());
            pstmt.setString(2, sb.getSido());
            pstmt.setString(3, sb.getExp());
            pstmt.setInt(4, sb.getCloseok());
            pstmt.setInt(5, sb.getNo());
            resultrow = pstmt.executeUpdate();

            if (resultrow > 0) {
                System.out.println("반영된 행의 수 : " + resultrow);
            } else {
                System.out.println("반영된 행이 없다");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return resultrow;
    }

    //게시글 번호로 글 찾아서 삭제하기(사실은 안보이게 하는거)///////////////////////////////////
    public int deleteBoard(int no) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "update board set removedok=1 where no=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, no);
            resultrow = pstmt.executeUpdate();

            if (resultrow > 0) {
                System.out.println("반영된 행의 수 : " + resultrow);
            } else {
                System.out.println("반영된 행이 없다");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return resultrow;
    }

    //게시글 조회수 늘리기///////////////////////////////////
    public int hitupPost(int no) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "update board set hit=(select nvl(max(hit),0) + 1 from board where no=?) where no=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, no);
            pstmt.setInt(2, no);
            resultrow = pstmt.executeUpdate();

            if (resultrow > 0) {
                System.out.println("반영된 행의 수 : " + resultrow);
            } else {
                System.out.println("반영된 행이 없다");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return resultrow;

    }

    //게시글 좋아요 업앤다운///////////////////////////////////
    public int goodUpAndDown(int no, String type) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        String sql = "";
        try {
            conn = ConnectionHelper.getConnection("oracle");
            if (type.equals("up")) {
                sql = "update board set good=(select nvl(max(good),0) + 1 from board where no=?) where no=?";
            } else if (type.equals("down")) {
                sql = "update board set good=(select nvl(max(good),0) -1 from board where no=?) where no=?";
            }
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, no);
            pstmt.setInt(2, no);
            resultrow = pstmt.executeUpdate();

            if (resultrow > 0) {
                System.out.println("반영된 행의 수 : " + resultrow);
            } else {
                System.out.println("반영된 행이 없다");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return resultrow;
    }

    //댓글 추가하기 ///////////////////////////////////////////////////////////////////////////////////
    public int insertReply(Comments cm) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionHelper.getConnection("oracle");//추가
            //board에 대한 삽입
            String sql1 = "insert into comments(rno,no,id,rcont,removedok) values((select nvl(max(rno),0) + 1 from comments),?,?,?,0)";
            pstmt = conn.prepareStatement(sql1);
            pstmt.setInt(1, cm.getNo());
            pstmt.setString(2, cm.getId());
            pstmt.setString(3, cm.getRcont());
            resultrow = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("Insert : " + e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
            try {
                conn.close(); //받환하기
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultrow;
    }

    ///댓글 리스트////////////////////////////////////////////////////
    public ArrayList<Comments> getCommentsByNo(int no) {

        ArrayList<Comments> commentlist = new ArrayList<Comments>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "select * from comments where removedok=0 and no=? order by rno";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Comments cm = new Comments();
                cm.setRno(rs.getInt("rno"));
                cm.setNo(rs.getInt("no"));
                cm.setId(rs.getString("id"));
                cm.setRcont(rs.getString("rcont"));
                cm.setRdate(rs.getTimestamp("rdate"));

                commentlist.add(cm);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);
        }
        return commentlist;
    }

    ///글번호로 댓글 개수 가져오기////////////////////////////////////////////////////
    public int countReplyByNo(int no) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = 0;

        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "select count(*) as counting from comments where no=? and removedok=0";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            ResultSet rs = pstmt.executeQuery();


            while (rs.next()) {
                result = rs.getInt("counting");
                System.out.println("table row갯수 : " + result);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    //게시글 번호, 댓글번호로 댓글 찾아서 삭제하기(사실은 안보이게 하는거)///////////////////////////////////
    public int DeleteReply(int no, int rno) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "update comments set removedok=1 where no=? and rno=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, no);
            pstmt.setInt(2, rno);
            resultrow = pstmt.executeUpdate();

            if (resultrow > 0) {
                System.out.println("반영된 행의 수 : " + resultrow);
            } else {
                System.out.println("반영된 행이 없다");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return resultrow;
    }

    //좋아요 : 게시글 번호+ 아이디 조합이 있으면 두번 못누르게 찾을 역할
    public int goodLogSearch(int no, String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String sql = "select count(*) as counting from good_manage where no=? and id=?";
        int result = 0;
        Study_Board sb = new Study_Board();

        try {
            conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            pstmt.setString(2, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                result = rs.getInt("counting");
                System.out.println("table row갯수 : " + result);
            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result; //0이면 좋아요 누른적이 없음, 1이면 좋아요 누른적이 있음
    }
    ///좋아요 로그 관리 로직////////////////////////////////////////////////////
    public int insertGood_Manage(int no , String id) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");//추가
            //board에 대한 삽입
            String sql = "insert into good_manage(idx,no,id) values((select nvl(max(idx),0) + 1 from good_manage),?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            pstmt.setString(2, id);
            resultrow = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("Insert : " + e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
            try {
                conn.close(); //반환하기
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultrow;
    }

    //게시글 번호로 글 찾아서 수정하기 : study 관련 부분만///////////////////////////////////
    public int UpdateReply(int rno, String rcont) {
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "update comments set rcont=? where rno=?";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, rcont);
            pstmt.setInt(2,rno);
            resultrow = pstmt.executeUpdate();

            if (resultrow > 0) {
                System.out.println("반영된 행의 수 : " + resultrow);
            } else {
                System.out.println("반영된 행이 없다");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return resultrow;
    }








}
