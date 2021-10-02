package kr.or.bit.user.dao;

import com.sun.xml.internal.ws.util.xml.DummyLocation;
import kr.or.bit.user.dto.boardDto;
import kr.or.bit.user.dto.userDto;
import kr.or.bit.utils.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 
 */
public class userDao{
    
    public int join(userDto dto){
        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;
        try{
            conn = ConnectionHelper.getConnection("oracle");
            
            String sql = "INSERT INTO MEMBER(ID, NICKNAME, PW, EMAIL, PHOTO) VALUES (?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getNickname());
            pstmt.setString(3, dto.getPw());
            pstmt.setString(4, dto.getEmail());
            pstmt.setString(5, dto.getPhoto());
            
            resultrow = pstmt.executeUpdate();
            
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
            
        }
        return resultrow;
    }
    
    public userDto login(String id, String pw){
        Connection conn = ConnectionHelper.getConnection("oracle");
        userDto dto = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try{
            String sql = "SELECT ID,PW FROM MEMBER WHERE ID=? AND PW=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();
            if (rs.next()){
                dto = new userDto();
                dto.setId(rs.getString("id"));
                dto.setPw(rs.getString("pw"));
                
                
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            ConnectionHelper.close(conn);
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);
        }
        return dto;
    }
    
    public List<boardDto> getUserDetailBoardList(Object sessionId, int cpage, int pagesize) throws SQLException{
        Connection conn = ConnectionHelper.getConnection("oracle");
        PreparedStatement pstmt = null;
        String sql = "SELECT  ROWNUM ,NO, BNO, ID, TITLE, CONT, HIT, WRITEDATE, GOOD, REMOVEDOK, SCRAPNUM FROM (SELECT * FROM BOARD WHERE ROWNUM<=?) WHERE ID=? AND ROWNUM>=?";
        pstmt = conn.prepareStatement(sql);
        
        int start = cpage * pagesize - (pagesize - 1);
        System.out.println(start);
        int end = cpage * pagesize;
        System.out.println(end);
        
        System.out.println("sessionId : " + sessionId);
        pstmt.setInt(1, end);
        pstmt.setObject(2, sessionId);
        pstmt.setInt(3, start);
        
        System.out.println("확인");
        ResultSet rs = pstmt.executeQuery();
        
        ArrayList<boardDto> writeBoardList = new ArrayList<>();
        while (rs.next()){
            boardDto dto = new boardDto();
            dto.setNo(rs.getInt("no"));
            dto.setBno(rs.getInt("bno"));
            dto.setId(rs.getString("id"));
            dto.setTitle(rs.getString("title"));
            dto.setCont(rs.getString("cont"));
            dto.setHit(rs.getInt("hit"));
            dto.setWriteDate(rs.getDate("writedate"));
            dto.setRemovedOk(rs.getInt("removedok"));
            dto.setGood(rs.getInt("good"));
            dto.setScrapNum(rs.getInt("scrapnum"));
            writeBoardList.add(dto);
            
        }
        System.out.println("내가 쓴 게시물 리스트" + writeBoardList);
        ConnectionHelper.close(rs);
        ConnectionHelper.close(conn);
        ConnectionHelper.close(pstmt);
        
        return writeBoardList;
    }
    
    public userDto getUserInfoList(Object sessionId) throws SQLException{
        Connection conn = ConnectionHelper.getConnection("oracle");
        PreparedStatement pstmt = null;
        String sql = "SELECT ID,EMAIL,PW,NICKNAME,PHOTO FROM MEMBER WHERE ID=?";
        pstmt = conn.prepareStatement(sql);
        
        System.out.println("sessionId : " + sessionId);
        pstmt.setObject(1, sessionId);
        
        
        ResultSet rs = pstmt.executeQuery();
        
        
        userDto dto = new userDto();
        
        if (rs.next()){
            dto.setId(rs.getString("id"));
            dto.setNickname(rs.getString("nickname"));
            dto.setPw(rs.getString("pw"));
            dto.setEmail(rs.getString("email"));
            dto.setPhoto(rs.getString("photo"));
        }
        ConnectionHelper.close(rs);
        ConnectionHelper.close(conn);
        ConnectionHelper.close(pstmt);
        
        return dto;
    }
    
    public List<boardDto> getUserScrapList(Object sessionId) throws SQLException{
        Connection conn = ConnectionHelper.getConnection("oracle");
        PreparedStatement pstmt = null;
        String sql = "SELECT TITLE FROM BOARD WHERE BOARD.NO IN (SELECT SCRAP.NO FROM SCRAP WHERE ID = ?)";
        pstmt = conn.prepareStatement(sql);
        
        System.out.println("sessionId : " + sessionId);
        pstmt.setObject(1, sessionId);
        
        ResultSet rs = pstmt.executeQuery();
        List<boardDto> userScrapList = new ArrayList<>();
        
        while (rs.next()){
            
            boardDto dto = new boardDto();
            dto.setTitle(rs.getString("title"));
            userScrapList.add(dto);
            
        }
        
        ConnectionHelper.close(rs);
        ConnectionHelper.close(conn);
        ConnectionHelper.close(pstmt);
        
        
        return userScrapList;
    }
    
    public List<boardDto> getTotalBoardList(Object sessionId) throws SQLException{
        Connection conn = ConnectionHelper.getConnection("oracle");
        PreparedStatement pstmt = null;
        String sql = "SELECT NO, BNO, ID, TITLE, CONT, HIT, WRITEDATE, GOOD, REMOVEDOK, SCRAPNUM FROM BOARD WHERE ID=?";
        pstmt = conn.prepareStatement(sql);
        
        
        System.out.println("sessionId : " + sessionId);
        
        pstmt.setObject(1, sessionId);
        
        System.out.println("확인");
        ResultSet rs = pstmt.executeQuery();
        
        ArrayList<boardDto> writeBoardList = new ArrayList<>();
        while (rs.next()){
            
            boardDto dto = new boardDto();
            dto.setNo(rs.getInt("no"));
            dto.setBno(rs.getInt("bno"));
            dto.setId(rs.getString("id"));
            dto.setTitle(rs.getString("title"));
            dto.setCont(rs.getString("cont"));
            dto.setHit(rs.getInt("hit"));
            dto.setWriteDate(rs.getDate("writedate"));
            dto.setRemovedOk(rs.getInt("removedok"));
            dto.setGood(rs.getInt("good"));
            dto.setScrapNum(rs.getInt("scrapnum"));
            writeBoardList.add(dto);
            
        }
        System.out.println("내가 쓴 게시물 리스트" + writeBoardList);
        
        ConnectionHelper.close(rs);
        ConnectionHelper.close(conn);
        ConnectionHelper.close(pstmt);
        
        return writeBoardList;
    }
    
    public int updateUserNickname(String nickname, String id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int result = 0;
        
        try{
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "UPDATE MEMBER SET NICKNAME=? WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nickname);
            pstmt.setString(2, id);
            
            result = pstmt.executeUpdate();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            ConnectionHelper.close(rs);
            ConnectionHelper.close(conn);
            ConnectionHelper.close(pstmt);
            
        }
        
        return result;
    }
    
    public int updateUserEmail(String email, String myId){
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        int result = 0;
        
        try{
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "UPDATE MEMBER SET EMAIL=? WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, myId);
            
            result = pstmt.executeUpdate();
            
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            ConnectionHelper.close(conn);
            ConnectionHelper.close(pstmt);
        }
        return result;
    }
    
    public int updateUserPwd(String myId,String changedPwd){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;
        try{
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "UPDATE MEMBER SET PW=? WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
    
            pstmt.setString(1, changedPwd);
            pstmt.setString(2, myId);
            result = pstmt.executeUpdate();
            
        }catch (Exception e){
    
            System.out.println(e.getMessage());
        }finally{
            ConnectionHelper.close(rs);
            ConnectionHelper.close(conn);
            ConnectionHelper.close(pstmt);
        
        }
        
        
        return result;
    }
    
    public int deleteUser(String myId){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;
        try{
            conn = ConnectionHelper.getConnection("oracle");
            
    
            String sql2 = "DELETE  FROM SCRAP WHERE id=?";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, myId);
    
            result += pstmt.executeUpdate();
            System.out.println("반영된 삭제 행의 갯수" + result);
    
            String sql = "DELETE FROM BOARD WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, myId);
    
            result += pstmt.executeUpdate();
            System.out.println("반영된 삭제 행의 갯수" + result);
            
            String sql3 = "delete FROM MEMBER WHERE id=?";
            pstmt = conn.prepareStatement(sql3);
            pstmt.setString(1, myId);
    
            result += pstmt.executeUpdate();
            System.out.println("반영된 삭제 행의 갯수" + result);
            
        }catch (Exception e){
    
            System.out.println(e.getMessage());
        }finally{
            ConnectionHelper.close(rs);
            ConnectionHelper.close(conn);
            ConnectionHelper.close(pstmt);
        }
        
        return result;
    }
    
    
}

























