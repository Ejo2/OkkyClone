<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<% //사람인api JSON으로 받아오기
    System.out.println("111312516588888811");
    String accessKey = "57ZHVpeFbUxqlaVapckledfKUIGL43YL424bfpXt6OfMIWVrcwW"; // 발급받은 accessKey";
    StringBuffer apiData = new StringBuffer();
    String job_mid_cd= request.getParameter("job_mid_cd");
    String job_cd= request.getParameter("job_cd");
    String edu_lv= request.getParameter("edu_lv");
    String loc_cd= request.getParameter("loc_cd");
    String queryString= request.getParameter("data");
    System.out.println("job_mid_cd="+job_mid_cd.replace("undefined", "")+
            "&job_cd="+job_cd.replace("undefined", "") +
            "&edu_lv="+edu_lv.replace("undefined", "") +
            "&loc_cd="+loc_cd.replace("undefined", ""));
    System.out.println("job_mid_cd="+job_mid_cd+ "&job_cd="+job_cd + "&edu_lv="+edu_lv + "&loc_cd="+loc_cd);
    System.out.println("data" + request.getParameter("data"));
    System.out.println("queryString" + queryString);

    try {
//        String text = "web";
//        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key="+accessKey+"&keyword="+ text;
//TODO 기본셋팅 개발자 구인이게
        // String text = "&count=10&job_cd="+queryString;
        String text = "&count=110&"+ "job_mid_cd="+job_mid_cd.replace("undefined", "")+
                "&job_cd="+job_cd.replace("undefined", "") +
                "&edu_lv="+edu_lv.replace("undefined", "") +
                "&loc_cd="+loc_cd.replace("undefined", "");
        //    String text = queryString;
        //edu_lv="++"&loc_cd="++"&job_mid_cd="++"&job_cd="+ "
        // 여기서 받아서 count=5 / ob_mid_cd=4,12 이런 식으로 주소검색 해가지고 API 데이터 선택적으로 가져오려고!
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


