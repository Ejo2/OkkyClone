package kr.or.bit.user.dao;

import kr.or.bit.user.dto.Study_category;
import kr.or.bit.utils.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudyCategoryDao {
    public ArrayList<Study_category> getCategoryList() { //스터디 카테고리 전부 불러오는 함수
        ArrayList<Study_category> categorylist = new ArrayList<Study_category>();
        PreparedStatement pstmt = null;
        String sql="select st_categorynum, st_category from study_category order by st_categorynum";


        try {
            Connection conn = ConnectionHelper.getConnection("oracle");
            pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {
                Study_category sc = new Study_category();
                sc.setSt_categorynum(Integer.parseInt(rs.getString("st_categorynum")));
                sc.setSt_category(rs.getString("st_category"));
                categorylist.add(sc);


            }
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);

        } catch (SQLException e) {
            System.out.println("DAO단에서 문제 발생!");
            e.printStackTrace();
        }

        return categorylist;
    }


}
