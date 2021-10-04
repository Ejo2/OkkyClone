package kr.or.bit.user.dao;

import kr.or.bit.user.dto.Board;
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
            String sql = "SELECT ID,PW,PHOTO,NICKNAME,EMAIL FROM MEMBER WHERE ID=? AND PW=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();
            if (rs.next()){
                dto = new userDto();
                dto.setId(rs.getString("id"));
                dto.setPw(rs.getString("pw"));
                dto.setPhoto(rs.getString("photo"));
                dto.setEmail(rs.getString("email"));
                dto.setNickname(rs.getString("nickname"));
                
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
    
    public List<Board> getUserDetailBoardList(Object sessionId, int cpage, int pagesize) {
        System.out.println("cpage" + cpage+"pagesize"+pagesize);
        
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List<Board> writeBoard = new ArrayList<>();
        
        try{
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "SELECT * FROM (SELECT  ROWNUM rn ,NO, BNO, id, TITLE, CONT, HIT, WRITEDATE, GOOD, REMOVEDOK, SCRAPNUM,NICKNAME FROM (SELECT NO,BNO,M.ID AS id ,TITLE , CONT , WRITEDATE , GOOD ,HIT , REMOVEDOK , SCRAPNUM , NICKNAME FROM BOARD b INNER JOIN MEMBER M ON M.ID = b.ID WHERE REMOVEDOK !=1 ORDER BY NO DESC ) WHERE id=? AND ROWNUM <= ? )  WHERE rn >= ?";
            
            pstmt = conn.prepareStatement(sql);
            
            int start = cpage * pagesize - (pagesize - 1);
            System.out.println(start);
            int end = cpage * pagesize;
            System.out.println(end);
            
            System.out.println("sessionId : " + sessionId + "확인");
            pstmt.setObject(1, sessionId);
            pstmt.setInt(2, end);
            pstmt.setInt(3, start);
            
            System.out.println("확인");
            rs = pstmt.executeQuery();
            
        
            
            while (rs.next()){
                System.out.println("rsnext 타는지 확인");
                Board dto = new Board();
                dto.setNo(rs.getInt("no"));
                dto.setBno(rs.getInt("bno"));
                dto.setId(rs.getString("id"));
                dto.setTitle(rs.getString("title"));
                dto.setCont(rs.getString("cont"));
                dto.setHit(rs.getInt("hit"));
                dto.setWritedate(rs.getDate("writedate"));
                dto.setRemovedOk(rs.getInt("removedok"));
                dto.setGood(rs.getInt("good"));
                dto.setScrapNum(rs.getInt("scrapnum"));
                
                System.out.println("dto::::" + dto);
                
                writeBoard.add(dto);
                
            }
            System.out.println("내가 쓴 게시물 리스트" + writeBoard);
            
        }catch (Exception e){
            System.out.println("에러뜸???");
            System.out.println(e.getMessage());
            
        }finally{
            System.out.println("닫힘???");
            ConnectionHelper.close(rs);
            ConnectionHelper.close(conn);
            ConnectionHelper.close(pstmt);
            System.out.println("다 닫힘??");
        }
        
        
        System.out.println("writeBoard@@@@@ :: " + writeBoard);
        
        
        return writeBoard;
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
        String sql = "SELECT NO, BNO, ID, TITLE, CONT, HIT, WRITEDATE, GOOD, REMOVEDOK, SCRAPNUM FROM BOARD WHERE ID=? and REMOVEDOK!=1";
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
    
    public int updateUserPwd(String myId, String changedPwd){
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
            
            
            String sql2 = "DELETE  FROM SCRAP WHERE ID=?";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, myId);
            
            result += pstmt.executeUpdate();
            System.out.println("반영된 삭제 행의 갯수" + result);
            
            String sql = "DELETE FROM BOARD WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, myId);
            
            result += pstmt.executeUpdate();
            System.out.println("반영된 삭제 행의 갯수" + result);
            
            String sql3 = "DELETE FROM MEMBER WHERE ID=?";
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
    
    
    public int setPhoto(String myId, String orifilename){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        int result = 0;
        
        try{
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "UPDATE MEMBER SET PHOTO = ? WHERE ID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, orifilename);
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

    //예솔 필요해서 함수 추가!(10월 4일 오후 10시)
    public ArrayList<userDto> selectAllUserDto(){
        ArrayList<userDto> userList = new ArrayList<userDto>();
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try{
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "select * from member";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()){
                userDto ud = new userDto();
                ud.setId(rs.getString("id"));
                ud.setNickname(rs.getString("nickname"));
                ud.setPhoto(rs.getString("photo"));
                userList.add(ud);
            }

        }catch (Exception e){
            System.out.println("에러뜸???");
            System.out.println(e.getMessage());

        }finally{
            System.out.println("닫힘???");
            ConnectionHelper.close(rs);
            ConnectionHelper.close(conn);
            ConnectionHelper.close(pstmt);
            System.out.println("다 닫힘??");
        }
        return userList;
    }
















}

























