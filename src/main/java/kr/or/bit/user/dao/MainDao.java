package kr.or.bit.user.dao;

import kr.or.bit.user.dto.MainContentsDto;
import kr.or.bit.utils.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MainDao {

    //Study 게시글 정보 가져오기
    public ArrayList<MainContentsDto> getSBoardList() {
        ArrayList<MainContentsDto> sBoardList = null;


        PreparedStatement pstmt = null;
        String sql = "select * from(select rownum rn, no,id, title,hit,writedate,good, st_categorynum, st_category, sido,exp ,nickname from ( select b.no ,b.id, title,hit,writedate,good, s.st_categorynum, sc.st_category, sido,exp,nickname from board b inner join b_study s on b.no = s.no inner join member m on b.id = m.id inner join study_category sc on s.st_categorynum = sc.st_categorynum where removedok =0 and closeok=0 order by no desc))  ";
        try {
            Connection conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            sBoardList = new ArrayList<MainContentsDto>();
            while (rs.next()) {
                MainContentsDto mcd = new MainContentsDto();
                mcd.setRn(rs.getInt("rn"));
                mcd.setNo(rs.getInt("no"));
                mcd.setId(rs.getString("id"));
                mcd.setTitle(rs.getString("title"));
                mcd.setHit(rs.getInt("hit"));
                mcd.setWritedate(rs.getTimestamp("writedate"));
                mcd.setGood(rs.getInt("good"));

                mcd.setSt_categorynum(rs.getInt("st_categorynum"));
                mcd.setSido(rs.getString("sido"));
                mcd.setExp(rs.getString("exp"));
                mcd.setNickname(rs.getString("nickname"));
                mcd.setSt_category(rs.getString("st_category"));
                sBoardList.add(mcd);
            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sBoardList;
    }

    //그외 board 게시글 가져오기 //최신순(글번 역순)
    public ArrayList<MainContentsDto> getBoardList() {
        ArrayList<MainContentsDto> sBoardList = null;


        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM (select rownum rn,no, bno, id , title, cont, writedate, good, hit, nickname " +
                "from ( SELECT no, bno, m.id as id , title, cont, writedate, good, hit,nickname " +
                "FROM board b inner join member m on b.id=m.id " +
                "where removedok !=1 ORDER BY no DESC ))";
        try {
            Connection conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            sBoardList = new ArrayList<MainContentsDto>();
            while (rs.next()) {
                MainContentsDto mcd = new MainContentsDto();
                mcd.setRn(rs.getInt("rn"));

                mcd.setNo(rs.getInt("no"));
                mcd.setBno(rs.getInt("bno"));
                mcd.setId(rs.getString("id"));
                mcd.setTitle(rs.getString("title"));
                mcd.setCont(rs.getString("cont"));
                mcd.setWritedate(rs.getTimestamp("writedate"));
                mcd.setGood(rs.getInt("good"));
                mcd.setHit(rs.getInt("hit"));
                mcd.setNickname(rs.getString("nickname"));

                sBoardList.add(mcd);
            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return sBoardList;
    }

    //그외 board 게시글 가져오기 //조회수 순
    public ArrayList<MainContentsDto> getBoardListHit() {
        ArrayList<MainContentsDto> getBoardListHit = null;


        PreparedStatement pstmt = null;
        String sql = "SELECT * FROM (select no, bno, id , title, writedate, hit, nickname " +
                "from ( SELECT no, bno, m.id as id , title, writedate, hit,nickname  " +
                "FROM board b inner join member m on b.id=m.id  " +
                "where removedok !=1 ORDER BY hit DESC ))";
        try {

            Connection conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            getBoardListHit = new ArrayList<MainContentsDto>();
            while (rs.next()) {
                MainContentsDto mcd = new MainContentsDto();
                mcd.setNo(rs.getInt("no"));
                mcd.setBno(rs.getInt("bno"));
                mcd.setId(rs.getString("id"));
                mcd.setTitle(rs.getString("title"));
                mcd.setWritedate(rs.getTimestamp("writedate"));
                mcd.setHit(rs.getInt("hit"));
                mcd.setNickname(rs.getString("nickname"));

                getBoardListHit.add(mcd);
            }
            System.out.println(getBoardListHit);
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);

            ConnectionHelper.close(conn);

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return getBoardListHit;
    }















}
