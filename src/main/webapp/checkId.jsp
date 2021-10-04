<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
  //아이디 중복검사
  //넘어온 아이디 값 가져오기
  String id = request.getParameter("sid");
  
  //중복된 아이디가 있는지 없는지를 저장할 변수
  boolean check = false;
  
  //데이터베이스 연동을 위한 변수
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  try{
    //오라클 드라이버 클래스를 로드
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
    //Connection 객체 생성. ("JDBC:@DB경로","ID","PW")
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","STUDY","3410");
    
    //아이디가 있는지 확인하기 위한 sql
    String sql = "select * from MEMBER where id = ?";
    
    //sql을 실행할 수 있는 PreparedStatement 객체 생성
    pstmt = con.prepareStatement(sql);
    
    //?에 값 바인딩
    pstmt.setString(1, id);
    
    //sql 실행
    rs = pstmt.executeQuery();
    
    //검색된 아이디가 있거나 아이디가 null이면 사용할 수 없는 아이디 검사.
    if(id == null || rs.next()==true){
      check = false;
    }
    //그렇지 않으면 사용가능한 아이디.
    else {
      check = true;
    }
    
  } catch(Exception e) {
    out.println(e.getMessage());
  }
  finally {
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(con != null) con.close();
  }
  
  if(check){
    out.print("true");
  }else{
    out.print("false");
  }

%>
