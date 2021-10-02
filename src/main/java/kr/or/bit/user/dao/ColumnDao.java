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
    public List<Board> list(int cpage , int pagesize){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Board> list = null;
        try {
            conn = ds.getConnection();
            String sql = "select * from " +
                    "(select rownum rn, no, bno, id, title, cont, hit, writedate, good, removedOk, scrapNum" +
                    " from ( SELECT * FROM Board ) "+
                    " where rownum <= ?" +  //endrow
                    ") where rn >= ?"; //startrow
            pstmt = conn.prepareStatement(sql);
            //공식같은 로직
            int start = cpage * pagesize - (pagesize -1); //1 * 5 - (5 - 1) >> 1
            int end = cpage * pagesize; // 1 * 5 >> 5
            //
            pstmt.setInt(1, end);
            pstmt.setInt(2, start);

            rs = pstmt.executeQuery();
            list = new ArrayList<Board>();
            while(rs.next()) {
                Board board = new Board();
                board.setNo(rs.getInt("no"));
                board.setTitle(rs.getString("title"));
                board.setCont(rs.getString("con"));
                board.setWritedate(rs.getDate("writedate"));

                list.add(board);
            }

        }catch (Exception e) {
            System.out.println("오류 :" + e.getMessage());
        }finally {
            try {
                pstmt.close();
                rs.close();
                conn.close();//반환
            } catch (Exception e2) {
            }
        }
        return list;
    }

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
    public Board getContent(int no) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Board board= null;

        try {
            conn = ds.getConnection();
            String sql="select * from Board where no=?"; //* 하지 말자
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);

            rs = pstmt.executeQuery();
            if(rs.next()) {
                int bno = rs.getInt("bno");
                String title = rs.getString("title");
                String id = rs.getString("id");
                String cont = rs.getString("cont");
                String removedok = rs.getString("removedok");
                String good = rs.getString("good");
                String scrapnum = rs.getString("scrapnum");
                String hit = rs.getString("hit");

                java.sql.Date writedate = rs.getDate("writedate");
                int readnum = rs.getInt("readnum");

            }

        } catch (Exception e) {
            System.out.println("content: " + e.getMessage());
        }finally {
            try {
                pstmt.close();
                rs.close();
                conn.close();//반환하기
            } catch (Exception e2) {
            }
        }
        return board;
    }
}
