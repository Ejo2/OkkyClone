<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<% //사람인api JSON으로 받아오기
    String accessKey = "57ZHVpeFbUxqlaVapckledfKUIGL43YL424bfpXt6OfMIWVrcwW"; // 발급받은 accessKey";
    StringBuffer apiData = new StringBuffer();
    try {
//        String text = "web";
//        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key="+accessKey+"&keyword="+ text;
//TODO count, job_mid_cd 등 검색 값에 따라 변경되게 설정해서 유동적 검색 가능하도록
        String text = "&count=5&job_mid_cd=4,12";
        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key=" + accessKey + text;

        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Accept", "application/json");

        int responseCode = con.getResponseCode();
        BufferedReader br;
        System.out.println(responseCode);
        if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        while ((inputLine = br.readLine()) != null) {
            apiData.append(inputLine);
        }
        br.close();
    } catch (Exception e) {
        System.out.println(e);
    }
%>
<%=apiData%>


