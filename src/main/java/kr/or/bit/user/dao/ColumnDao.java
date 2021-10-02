package kr.or.bit.user.dao;

import kr.or.bit.user.dto.Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

public class ColumnDao {
    DataSource ds = null;

    public ColumnDao() throws NamingException {
        Context context = new InitialContext();
        ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
    }

    //글쓰기(원본글)
    public int writeok(Board board) {
        System.out.println("board = " + board);
        Connection conn = null;
        PreparedStatement pstmt = null;
        int row = 0;
        try {
            conn = ds.getConnection();
            String sql = "insert into board(no, bno, id, title, cont, hit, good, removedok, scrapnum)" +
                    " values(board_no.nextval,100,'admin',?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);

            /*pstmt.setString(1, board.getId());*/

            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getCont());
            pstmt.setInt(3, board.getHit());
            pstmt.setInt(4, board.getGood());
            pstmt.setInt(5, board.getRemovedOk());
            pstmt.setInt(6, board.getScrapNum());

            row = pstmt.executeUpdate();

        } catch (Exception e) {
        } finally {
            try {
                pstmt.close();
                conn.close();//반환하기
            } catch (Exception e2) {
                System.out.println("DAO = " + e2.getMessage());
            }
        }
        return row;
    }

    //게시물 목록보기
    public List<Board> colList(int cpage, int pagesize) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Board> collist = null;
        try {
            conn = ds.getConnection();
            String sql = "select no, bno, id, title, cont, writedate, good, hit, removedok, scrapnum from Board";
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            collist = new ArrayList<Board>();
            while (rs.next()) {
                System.out.println("반복중..: " + rs.getInt("no") + ", " + rs.getString("title") + rs.getString("id"));
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
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("오류 :" + e.getMessage());
        } finally {
            try {
                pstmt.close();
                rs.close();
                conn.close();//반환
            } catch (Exception e2) {
            }
        }
        return collist;
    }

    //게시물 총 건수 구하기
    public int totalBoardCount() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalcount = 0;
        try {
            conn = ds.getConnection(); //dbcp 연결객체 얻기
            String sql="select count(*) cnt from Board";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                totalcount = rs.getInt("cnt");
            }
        }catch (Exception e) {

        }finally {
            try {
                pstmt.close();
                rs.close();
                conn.close();//반환  connection pool 에 반환하기
            }catch (Exception e) {

            }
        }
        return totalcount;
    }

    //게시물 상세보기
    public Board columnContent(int no) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Board board = new Board();

        try {
            conn = ds.getConnection();
            String sql = "select no, bno, id, title, cont, writedate, good, hit, removedok, scrapnum from board where no=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            System.out.println("글글글" + no);

            rs = pstmt.executeQuery();
            while (rs.next()) {
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
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("content: " + e.getMessage());
        } finally {
            try {
                pstmt.close();
                rs.close();
                conn.close();//반환하기
            } catch (Exception e2) {
            }
        }
        return board;
    }

    //게시글 수정하기 화면(답글)
    public Board columnEditContent(String no) {
        return this.columnContent(Integer.parseInt(no));
        //조회화면 동일 (기존에 있는 함수 재활용)
    }
    //게시글 수정하기 처리
    public int columnEdit(HttpServletRequest boarddata) {
        String no = boarddata.getParameter("no");
        String id = boarddata.getParameter("id");
        String title = boarddata.getParameter("title");
        String cont = boarddata.getParameter("cont");

        System.out.println("게시판번호 불러오기= " + no);
        System.out.println("게시판아이디= " + id);

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int row = 0;

        try {
            conn = ds.getConnection();
            String sql_idx = "select no from board where no=?";
            String sql_udpate = "update board set id=?" +
                    " ,title=? , cont=? where no=?";
            pstmt = conn.prepareStatement(sql_idx);
            pstmt.setInt(1, Integer.parseInt(no));

            rs = pstmt.executeQuery();

            //판단 (데이터 있다며 : 수정가능 , 없다면 : 수정불가
            if (rs.next()) {
                System.out.println("테스트 =" + rs.getInt("no"));
                //경고
                //pstmt.close();
                //업데이트
                pstmt = conn.prepareStatement(sql_udpate);
                pstmt.setString(1, id);
                pstmt.setString(2, title);
                pstmt.setString(3, cont);
                pstmt.setString(4, no);
                row = pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        } finally {
            try {
                pstmt.close();
                rs.close();
                conn.close();//반환
            } catch (Exception e2) {
            }
        }
        return row;
    }


    //게시글 조회수 증가
    public boolean getReadNum(String no) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ds.getConnection();
            String sql="update board set hit = hit + 1 where no =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, no);

            int row = pstmt.executeUpdate();
            if(row > 0 ) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                pstmt.close();
                conn.close();//반환
            }catch (Exception e) {
            }
        }
        return result;
    }

    //게시글 삭제하기
    public int deleteOk(String no) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int row = 0;
        try {
            conn = ds.getConnection();

            String sql_reply = "delete from comments where no_fk=?";

            String sql_board="delete from board where no=?";

            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if(rs.next()) { //삭제글은 존재
                    conn.setAutoCommit(false);//개발자가 rollback , commit 강제
                    //댓글삭제
                    pstmt = conn.prepareStatement(sql_reply);
                    pstmt.setString(1,no);
                    pstmt.executeUpdate();

                    //게시글 삭제 (원본글 , 답글)
                    pstmt = conn.prepareStatement(sql_board);
                    pstmt.setString(1,no);
                    row = pstmt.executeUpdate();

                    if(row > 0) {
                        conn.commit(); //두개의 delete 실반영
                    }

            }else { //삭제하는 글이 존재하지 않는 경우
                row = 0;
            }

        } catch (Exception e) {
            //rollback
            //예외가 발생하면
            try {
                conn.rollback();
            } catch (SQLException e1) {

                e1.printStackTrace();
            }
        }finally {
            try {
                pstmt.close();
                rs.close();
                conn.close();//반환
            } catch (Exception e2) {

            }
        }
        return row;
    }



}
