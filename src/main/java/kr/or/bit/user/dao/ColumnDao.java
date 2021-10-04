package kr.or.bit.user.dao;

import kr.or.bit.user.dto.Board;
import kr.or.bit.user.dto.Comments;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ColumnDao{
    DataSource ds = null;
    
    public ColumnDao() throws NamingException{
        Context context = new InitialContext();
        ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
    }
    
    //글쓰기(원본글)
    public int writeok(Board board){
        System.out.println("board = " + board);
        Connection conn = null;
        PreparedStatement pstmt = null;
        int row = 0;
        try{
            conn = ds.getConnection();
            String sql = "INSERT INTO BOARD(NO, BNO, ID, TITLE, CONT, HIT, GOOD, REMOVEDOK, SCRAPNUM)" +
                    " VALUES(BOARD_NO.NEXTVAL,100,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            
            /*pstmt.setString(1, board.getId());*/
            
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getTitle());
            pstmt.setString(3, board.getCont());
            pstmt.setInt(4, board.getHit());
            pstmt.setInt(5, board.getGood());
            pstmt.setInt(6, board.getRemovedOk());
            pstmt.setInt(7, board.getScrapNum());
            
            row = pstmt.executeUpdate();
            
        }catch (Exception e){
        }finally{
            try{
                pstmt.close();
                conn.close();//반환하기
            }catch (Exception e2){
                System.out.println("DAO = " + e2.getMessage());
            }
        }
        return row;
    }
    
    //게시물 목록보기
    public List<Board> colList(int cpage, int pagesize){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Board> collist = null;
        try{
            conn = ds.getConnection();
            String sql = "SELECT * " +
                    "FROM " +
                    " (SELECT ROWNUM rn,NO, bno, id , title, cont, writedate, good, hit, removedok, scrapnum, nickname " +
                    " FROM ( SELECT NO, bno, m.id AS id , title, cont, writedate, good, hit, removedok, scrapnum,nickname FROM board b INNER JOIN member m ON b.id=m.id WHERE removedok !=1 and bno=100 ORDER BY NO DESC ) "
                    + " WHERE rownum <= ?) " +
                    "WHERE rn >= ?";
            pstmt = conn.prepareStatement(sql);
            
            int start = cpage * pagesize - (pagesize - 1); //1 * 5 - (5 - 1) >> 1
            int end = cpage * pagesize; // 1 * 5 >> 5
            
            System.out.println("start = " + start);
            System.out.println("end = " + end);
            
            
            pstmt.setInt(1, end);
            pstmt.setInt(2, start);
            
            rs = pstmt.executeQuery();
            collist = new ArrayList<Board>();
            while (rs.next()){
                System.out.println("반복중: " + rs.getInt("no") + ", " + rs.getString("title") + rs.getString("id"));
                Board colBoard = new Board();
                colBoard.setNo(rs.getInt("no"));
                colBoard.setBno(rs.getInt("bno"));
                colBoard.setTitle(rs.getString("title"));
                colBoard.setId(rs.getString("id"));
                colBoard.setCont(rs.getString("cont"));
                colBoard.setWritedate(rs.getDate("writedate"));
                colBoard.setRemovedOk(rs.getInt("removedok"));
                colBoard.setGood(rs.getInt("good"));
                colBoard.setScrapNum(rs.getInt("scrapnum"));
                colBoard.setHit(rs.getInt("hit"));
                collist.add(colBoard);
                System.out.println("리스트" + colBoard);
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("오류 :" + e.getMessage());
        }finally{
            try{
                pstmt.close();
                rs.close();
                conn.close();//반환
            }catch (Exception e2){
            }
        }
        return collist;
    }
    
    //총 댓글 건수 구하기
    public int totalReplyCount(int no){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalReply = 0;
        try{
            conn = ds.getConnection(); //dbcp 연결객체 얻기
            String sql = "SELECT COUNT(*) cnt FROM COMMENTS WHERE REMOVEDOK !=1 AND NO=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()){
                totalReply = rs.getInt("cnt");
                System.out.println("총 댓글 건수= " + totalReply);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                rs.close();
                conn.close();//반환  connection pool 에 반환하기
            }catch (Exception e){
            }
        }
        return totalReply;
    }
    
    
    //게시물 총 건수 구하기
    public int totalBoardCount(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalcount = 0;
        try{
            conn = ds.getConnection(); //dbcp 연결객체 얻기
            String sql = "SELECT COUNT(*) cnt FROM BOARD WHERE REMOVEDOK != 1"; //1(삭제)이 아닌것을 가져옴
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()){
                totalcount = rs.getInt("cnt");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                rs.close();
                conn.close();//반환  connection pool 에 반환하기
            }catch (Exception e){
            
            }
        }
        return totalcount;
    }
    
    //게시물 상세보기
    public Board columnContent(int no){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Board board = new Board();
        
        try{
            conn = ds.getConnection();
            String sql = "SELECT NO, bno, m.id AS id, title, cont, writedate, good, hit, removedok, scrapnum ,m.nickname AS nickname " +
                    "FROM board b" +
                    "     INNER JOIN" +
                    "     member m" +
                    "     ON b.id = m.id " +
                    "WHERE NO=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            System.out.println("게시글" + no);
            
            rs = pstmt.executeQuery();
            while (rs.next()){
                board.setBno(rs.getInt("bno"));
                board.setId(rs.getString("id"));
                board.setTitle(rs.getString("title"));
                board.setCont(rs.getString("cont"));
                board.setHit(rs.getInt("hit"));
                board.setWritedate(rs.getDate("writedate"));
                board.setGood(rs.getInt("good"));
                board.setRemovedOk(rs.getInt("removedOk"));
                board.setScrapNum(rs.getInt("scrapNum"));
                
                System.out.println(board.toString());
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("content: " + e.getMessage());
        }finally{
            try{
                pstmt.close();
                rs.close();
                conn.close();//반환하기
            }catch (Exception e2){
            }
        }
        return board;
    }
    
    //게시글 수정하기 화면(답글)
    public Board columnEditContent(String no){
        return this.columnContent(Integer.parseInt(no));
        //조회화면 동일 (기존에 있는 함수 재활용)
    }
    
    //게시글 수정하기 처리
    public int columnEdit(Board boarddata){
        int no = boarddata.getNo();
        String id = boarddata.getId();
        String title = boarddata.getTitle();
        String cont = boarddata.getCont();
        
        System.out.println("게시판번호 불러오기= " + no);
        System.out.println("게시판아이디= " + id);
        System.out.println("cont = " + cont);
        System.out.println("게시판아이디= " + id);
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int row = 0;
        
        try{
            conn = ds.getConnection();
            String sql_idx = "SELECT NO FROM board WHERE NO=?";
            String sql_udpate = "UPDATE BOARD SET " +
                    " TITLE=? , CONT=? WHERE NO=?";
            pstmt = conn.prepareStatement(sql_idx);
            pstmt.setInt(1, no);
            
            rs = pstmt.executeQuery();
            
            //판단 (데이터 있다며 : 수정가능 , 없다면 : 수정불가
            if (rs.next()){
                System.out.println("테스트 =" + rs.getInt("no"));
                //경고
                //pstmt.close();
                //업데이트
                pstmt = conn.prepareStatement(sql_udpate);
                pstmt.setString(1, title);
                pstmt.setString(2, cont);
                pstmt.setInt(3, no);
                row = pstmt.executeUpdate();
            }
        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }finally{
            try{
                pstmt.close();
                rs.close();
                conn.close();//반환
            }catch (Exception e2){
            }
        }
        return row;
    }
    
    
    //게시글 조회수 증가
    public boolean getReadNum(String no){
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try{
            conn = ds.getConnection();
            String sql = "UPDATE BOARD SET HIT = HIT + 1 WHERE NO =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, no);
            
            int row = pstmt.executeUpdate();
            if (row > 0){
                result = true;
            }
            
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                conn.close();//반환
            }catch (Exception e){
            }
        }
        return result;
    }
    
    //게시글 삭제하기
    public int deleteOk(int no){
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        System.out.println("삭제ok");
        int row = 0;
        try{
            conn = ds.getConnection();
            String sql = "UPDATE BOARD SET REMOVEDOK = 1 " +  // 삭제(1)라면 해당 board의 removedok을 1로 업데이트
                    " WHERE NO =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            
            row = pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                conn.close();//반환
            }catch (Exception e){
            }
        }
        return row;
    }
    
    //댓글 insert
    public int columnReplyWrite(Comments comments){
        
        System.out.println("게시판 insert" + comments);
        Connection conn = null;
        PreparedStatement pstmt = null;
        int row = 0;
        try{
            conn = ds.getConnection();
            String sql = "INSERT INTO COMMENTS(RNO, ID, RCONT, NO, REMOVEDOK) " +
                    " VALUES(COMMENTS_RNO.NEXTVAL,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, comments.getId());
            pstmt.setString(2, comments.getRcont());
            pstmt.setInt(3, comments.getNo());
            pstmt.setInt(4, comments.getRemovedOk());
            
            row = pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                conn.close();//반환
            }catch (Exception e){
            }
        }
        return row;
    }
    
    //댓글리스트 출력
    public List<Comments> replylist(String no){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<Comments> list = null;
        
        try{
            conn = ds.getConnection();
            String reply_sql = "SELECT * FROM COMMENTS WHERE NO =? AND removedok !=1  ORDER BY NO DESC";
            //댓글이 0인것만 최신순으로 리스트 출력
            pstmt = conn.prepareStatement(reply_sql);
            pstmt.setString(1, no);
            
            rs = pstmt.executeQuery();
            
            list = new ArrayList<>();
            while (rs.next()){
                Comments reList = new Comments();
                reList.setRno(rs.getInt("rno"));
                reList.setNo(rs.getInt("no"));
                reList.setId(rs.getString("id"));
                reList.setRcont(rs.getString("rcont"));
                reList.setRemovedOk(rs.getInt("removedOK"));
                reList.setRdate(rs.getDate("rdate"));
                list.add(reList);
                System.out.println("댓글 목록" + list);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                rs.close();
                conn.close();//반환
            }catch (Exception e){
            }
        }
        return list;
    }
    
    //게시물 추천
    public int recommend(int no, int goodVal){
        System.out.println("no = " + no);
        System.out.println("goodVal = " + goodVal);
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int row = 0;
        try{
            conn = ds.getConnection();
            String sql = "UPDATE BOARD SET GOOD = GOOD+ ? " +
                    " WHERE NO=?";  //추천 업데이트 good+goodVal
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, goodVal);
            pstmt.setInt(2, no);
            
            row = pstmt.executeUpdate();
            
            System.out.println("row = " + row);
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                conn.close();//반환
            }catch (Exception e){
            }
        }
        return row;
    }
    
    //댓글 삭제
    public int columnReplyDelete(int rno){
        System.out.println("댓글 번호" + rno);
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        int row = 0;
        try{
            conn = ds.getConnection();
            String sql = "UPDATE COMMENTS SET REMOVEDOK = 1 " +  // 삭제(1)라면 해당 board의 removedok을 1로 업데이트
                    " WHERE RNO =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, rno);
            
            row = pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            try{
                pstmt.close();
                conn.close();//반환
            }catch (Exception e){
            }
        }
        return row;
    }
    
    
}
