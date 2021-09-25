package kr.or.bit.user.dao;

import kr.or.bit.user.dto.userDto;
import kr.or.bit.utils.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
    
}

























