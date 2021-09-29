<%--
  Created by IntelliJ IDEA.
  User: sn022
  Date: 2021-09-27
  Time: 오후 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<% //사람인api JSON으로 받아오기
    String accessKey = "57ZHVpeFbUxqlaVapckledfKUIGL43YL424bfpXt6OfMIWVrcwW"; // 발급받은 accessKey";
    StringBuffer apiData = new StringBuffer();
    try {
//        String text = "web";
//        String apiURL = "https://oapi.saramin.co.kr/job-search?access-key="+accessKey+"&keyword="+ text;

        String text = "&count=110&job_mid_cd=2,15";
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
        System.out.println("여기야" + apiData);
    } catch (Exception e) {
        System.out.println(e);
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%=apiData%>
</body>
<script>
    // 20210927205915
    // http://localhost:8090/OkkyClone_war_exploded/saraminJSON.jsp

    let cData = {
        "jobs": {
            "count": 110,
            "start": 0,
            "total": "28327",
            "job": [
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232704&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2208749985&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)헬로서치"
                        }
                    },
                    "position": {
                        "title": "(대기업 IT사) IT전략 / IT 인프라 팀장급 채용 (2명)",
                        "industry": {
                            "code": "111",
                            "name": "시설관리·경비·용역"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,16",
                            "name": "IT개발·데이터,기획·전략"
                        },
                        "job-code": {
                            "code": "81,89,98,100,101,102,104,116,1658,1684,127",
                            "name": "서치펌,헤드헌팅,기술지원,유지보수,IT컨설팅,SE(시스템엔지니어),SI개발,ICT컨설팅,네트워크,빅데이터,데이터분석,ISP,인프라"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 10,
                            "max": 17,
                            "name": "경력 10~17년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "서치펌,헤드헌팅",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232704",
                    "posting-timestamp": "1632734241",
                    "modification-timestamp": "1632734241",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232703&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1388195951&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주) 캐어유"
                        }
                    },
                    "position": {
                        "title": "[캐어유] 웹디자이너 경력 모집",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "102330",
                            "name": "경기 > 안양시 동안구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1488,1502,1504,1529,1614",
                            "name": "소프트웨어개발,모바일디자인,웹디자인,일러스트레이터,UI/UX디자인,PhotoShop"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 10,
                            "name": "경력 3~10년"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232703",
                    "posting-timestamp": "1632734237",
                    "modification-timestamp": "1632734237",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232699&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3148209115&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "과학기술연합대학원대학교"
                        }
                    },
                    "position": {
                        "title": "2022학년도 전기 1차 신입생 선발 모집요강 I-CORE(계약학과)",
                        "industry": {
                            "code": "601",
                            "name": "초중고·대학"
                        },
                        "location": {
                            "code": "105040",
                            "name": "대전 > 유성구"
                        },
                        "job-type": {
                            "code": "12",
                            "name": "교육생"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,9,11,19,22",
                            "name": "IT개발·데이터,연구·R&D,생산,교육,건설·건축"
                        },
                        "job-code": {
                            "code": "129,801,810,811,812,814,815,819,821,832,833,846,847,1013,1014,1024,1032,1033,1034,1035,1068,1125,1134,1887,1897,1919,2040,2071,2136,2169,2177,2178,276",
                            "name": "교육기관,대학교,자율주행,연구원,R&D,R&D기획,고분자,기술연구,기후변화,로봇설계,무인항공기/드론,신소재,신재생에너지,전자파,기계설계,기구설계,전기설계,자동제어,장비제어,전기제어,전자제어,선박엔진,계측제어,에너지관리,과학,메카트로닉스,지구과학,전기기사,해양조사,R"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "교육기관,대학교",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232699",
                    "posting-timestamp": "1632734197",
                    "modification-timestamp": "1632742642",
                    "opening-timestamp": "1633359600",
                    "expiration-timestamp": "1635494400",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232697&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7218101274&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)더길"
                        }
                    },
                    "position": {
                        "title": "IT개발·데이터(머신러닝&컴퓨터비전) 채용",
                        "industry": {
                            "code": "307",
                            "name": "하드웨어·장비"
                        },
                        "location": {
                            "code": "105040",
                            "name": "대전 > 유성구"
                        },
                        "job-type": {
                            "code": "1,10,2",
                            "name": "정규직,계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "109,133",
                            "name": "AS,유지보수,장비구축,하드웨어,머신러닝,컴퓨터비전"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 8,
                            "name": "경력 1~8년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "AS,유지보수,장비구축,하드웨어",
                    "salary": {
                        "code": "15",
                        "name": "3,600~3,800만원"
                    },
                    "id": "41232697",
                    "posting-timestamp": "1632734171",
                    "modification-timestamp": "1632734262",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633013999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232681&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2118645334&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)지어소프트"
                        }
                    },
                    "position": {
                        "title": "JAVA / Spring 웹 신입/경력 개발자 구인",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101150",
                            "name": "서울 > 서초구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,235,276,291",
                            "name": "DBMS,소프트웨어개발,웹개발,Java,R,Spring"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 5,
                            "max": 15,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "DBMS,소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232681",
                    "posting-timestamp": "1632734066",
                    "modification-timestamp": "1632734586",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232680&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4108150690&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "비타민하우스(주)"
                        }
                    },
                    "position": {
                        "title": "온라인사업본부 웹디자이너 채용",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1488,1491,1499,1502,1549",
                            "name": "쇼핑몰,전자상거래,모바일디자인,배너디자인,앱디자인,웹디자인,상세페이지"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "쇼핑몰,전자상거래",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232680",
                    "posting-timestamp": "1632734061",
                    "modification-timestamp": "1632734536",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232675&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2048623235&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)에이엠컴퍼니"
                        }
                    },
                    "position": {
                        "title": "[(주)에이엠컴퍼니] 마케팅팀 웹디자이너 채용",
                        "industry": {
                            "code": "205",
                            "name": "섬유·의류·패션"
                        },
                        "location": {
                            "code": "101110",
                            "name": "서울 > 동대문구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1491,1502,1504,1529,1549,1614",
                            "name": "디스플레이,섬유,의류·의상,패션,배너디자인,웹디자인,일러스트레이터,UI/UX디자인,상세페이지,PhotoShop"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "디스플레이,섬유,의류·의상,패션",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232675",
                    "posting-timestamp": "1632734041",
                    "modification-timestamp": "1632734041",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232664&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1578801341&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)루나"
                        }
                    },
                    "position": {
                        "title": "[경력무관] 시각 디자이너 채용",
                        "industry": {
                            "code": "511",
                            "name": "디자인·설계"
                        },
                        "location": {
                            "code": "110070",
                            "name": "경남 > 밀양시"
                        },
                        "job-type": {
                            "code": "1,10,2",
                            "name": "정규직,계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1496",
                            "name": "디자인회사,시각디자인,환경디자인"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "디자인회사,시각디자인,환경디자인",
                    "salary": {
                        "code": "9",
                        "name": "2,400~2,600만원"
                    },
                    "id": "41232664",
                    "posting-timestamp": "1632734001",
                    "modification-timestamp": "1632735153",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232663&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2140992062&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "유비스 코리아"
                        }
                    },
                    "position": {
                        "title": "초우량유통대기업 TA 과장급",
                        "industry": {
                            "code": "801",
                            "name": "판매(매장종류별)"
                        },
                        "location": {
                            "code": "101130",
                            "name": "서울 > 마포구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,201,246",
                            "name": "면세점,쇼핑몰,백엔드/서버개발,AWS,Linux"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 12,
                            "name": "경력 5~12년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "면세점,쇼핑몰",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232663",
                    "posting-timestamp": "1632733992",
                    "modification-timestamp": "1632733992",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232652&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2668700237&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)비드넷씨엔씨"
                        }
                    },
                    "position": {
                        "title": "[비드넷 씨엔씨] 신입/경력 JAVA 프로그래머 모집",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101010,101020,101030,101040,101080",
                            "name": "서울 > 강남구,서울 > 강동구,서울 > 강북구,서울 > 강서구,서울 > 금천구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,235",
                            "name": "SI·시스템통합,SM,소프트웨어개발,웹개발,Java"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "SI·시스템통합,SM,소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232652",
                    "posting-timestamp": "1632733923",
                    "modification-timestamp": "1632733922",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635692399",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232649&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=8198700308&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)넥스트이엔씨"
                        }
                    },
                    "position": {
                        "title": "2021 하반기 일러스트&사무보조 경력무관 채용",
                        "industry": {
                            "code": "903",
                            "name": "환경·설비"
                        },
                        "location": {
                            "code": "102500",
                            "name": "경기 > 하남시"
                        },
                        "job-type": {
                            "code": "2,5,9",
                            "name": "계약직,아르바이트,프리랜서"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "4,15",
                            "name": "총무·법무·사무,디자인"
                        },
                        "job-code": {
                            "code": "405,1600",
                            "name": "상하수도,폐수처리,환경,사무보조,일러스트"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "상하수도,폐수처리,환경",
                    "salary": {
                        "code": "101"
                    },
                    "id": "41232649",
                    "posting-timestamp": "1632733907",
                    "modification-timestamp": "1632736070",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232645&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2108165986&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)제이스타일"
                        }
                    },
                    "position": {
                        "title": "온라인 여성의류 브랜드 쇼핑몰 웹디자이너 모집(재택근무)",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "9",
                            "name": "프리랜서"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1502,1549,1559",
                            "name": "쇼핑몰,오픈마켓,전자상거래,웹디자인,상세페이지,여성의류"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "쇼핑몰,오픈마켓,전자상거래",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232645",
                    "posting-timestamp": "1632733890",
                    "modification-timestamp": "1632733890",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633445999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232628&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2140992062&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "유비스 코리아"
                        }
                    },
                    "position": {
                        "title": "초우량유통대기업 데이터분석 과장급",
                        "industry": {
                            "code": "803",
                            "name": "유통·무역·상사"
                        },
                        "location": {
                            "code": "101130",
                            "name": "서울 > 마포구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,18",
                            "name": "IT개발·데이터,구매·자재·물류"
                        },
                        "job-code": {
                            "code": "82,116,227,276,289,1761",
                            "name": "상사,수입유통,유통업,데이터분석가,빅데이터,Hadoop,R,Spark,유통관리"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 9,
                            "max": 15,
                            "name": "경력 9~15년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "상사,수입유통,유통업",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232628",
                    "posting-timestamp": "1632733831",
                    "modification-timestamp": "1632733831",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232617&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2108165986&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)제이스타일"
                        }
                    },
                    "position": {
                        "title": "온라인 여성의류 브랜드 쇼핑몰 콘텐츠 영상편집자 모집",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "2",
                            "name": "계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "13,15",
                            "name": "미디어·문화·스포츠,디자인"
                        },
                        "job-code": {
                            "code": "1373,1603,1604,1559",
                            "name": "쇼핑몰,영상편집,파이널컷,프리미어,여성의류"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "쇼핑몰",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232617",
                    "posting-timestamp": "1632733791",
                    "modification-timestamp": "1632733791",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633445999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232615&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7398600174&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "샤워플러스(주)"
                        }
                    },
                    "position": {
                        "title": "2021년 샤워플러스 공채 하반기 신입&경력 웹디자인 정규직 공고",
                        "industry": {
                            "code": "208",
                            "name": "생활용품·소비재·사무"
                        },
                        "location": {
                            "code": "102120",
                            "name": "경기 > 남양주시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1502,1614",
                            "name": "생활용품,웹디자인,PhotoShop"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 1,
                            "max": 3,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "생활용품",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232615",
                    "posting-timestamp": "1632733770",
                    "modification-timestamp": "1632733770",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232614&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2108165986&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)제이스타일"
                        }
                    },
                    "position": {
                        "title": "온라인 여성의류 브랜드 쇼핑몰 웹/컨텐츠 디자이너 모집",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "2",
                            "name": "계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1502,1515,1559",
                            "name": "쇼핑몰,웹디자인,콘텐츠디자인,여성의류"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "쇼핑몰",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232614",
                    "posting-timestamp": "1632733765",
                    "modification-timestamp": "1632733765",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633445999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232607&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2108165986&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)제이스타일"
                        }
                    },
                    "position": {
                        "title": "온라인 여성의류 브랜드 쇼핑몰 웹디자이너 모집",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1502,1559",
                            "name": "쇼핑몰,웹디자인,여성의류,포토샵"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "쇼핑몰",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232607",
                    "posting-timestamp": "1632733740",
                    "modification-timestamp": "1632733740",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633445999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232604&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2208749985&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)헬로서치"
                        }
                    },
                    "position": {
                        "title": "[대기업 IT사] 빅데이터 엔지니어 채용",
                        "industry": {
                            "code": "305",
                            "name": "포털·인터넷·컨텐츠"
                        },
                        "location": {
                            "code": "101000,101010,102000",
                            "name": "서울 > 서울전체,서울 > 강남구,경기 > 경기전체"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "106,148,201,235,257,259,263,116",
                            "name": "종합포털,커뮤니티,컨텐츠제공,데이터마이닝,DW,AWS,Java,MySQL,NoSQL,OracleDB,빅데이터"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 0,
                            "name": "경력5년↑"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "종합포털,커뮤니티,컨텐츠제공",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232604",
                    "posting-timestamp": "1632733727",
                    "modification-timestamp": "1632733727",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232601&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3123005680&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "유니맘"
                        }
                    },
                    "position": {
                        "title": "그래픽디자인·CG, 웹디자인 담당자 채용 공고",
                        "industry": {
                            "code": "201",
                            "name": "전기·전자·제어"
                        },
                        "location": {
                            "code": "102390",
                            "name": "경기 > 오산시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1484,1502,1504,1614,1587",
                            "name": "전자,그래픽디자인,웹디자인,일러스트레이터,PhotoShop,CG"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "전자",
                    "salary": {
                        "code": "11",
                        "name": "2,800~3,000만원"
                    },
                    "id": "41232601",
                    "posting-timestamp": "1632733721",
                    "modification-timestamp": "1632733721",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633705199",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232591&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1078624267&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)다누시스"
                        }
                    },
                    "position": {
                        "title": "[다누시스] 연구소 C/C++  개발 경력 채용",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "102070",
                            "name": "경기 > 광명시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "167,182,205,206,246,253",
                            "name": "소프트웨어개발,솔루션업체,S/W,Windows,C++,C언어,Linux,MFC"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 15,
                            "name": "경력 5~15년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232591",
                    "posting-timestamp": "1632733655",
                    "modification-timestamp": "1632733655",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232582&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5458100671&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)아이엔에쓰"
                        }
                    },
                    "position": {
                        "title": "[오창LG] 정규직 개발자(신입,경력)",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "114130",
                            "name": "충북 > 청주시 흥덕구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,184,199,204,235,263,310",
                            "name": "소프트웨어개발,웹개발,.NET,ASP,C#,Java,OracleDB,VisualBasic"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232582",
                    "posting-timestamp": "1632733624",
                    "modification-timestamp": "1632733624",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232579&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5458100671&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)아이엔에쓰"
                        }
                    },
                    "position": {
                        "title": "[세종]JAVA 개발,운영",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "118000",
                            "name": "세종 > 세종특별자치시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,184,199,204,235,263,310",
                            "name": "소프트웨어개발,웹개발,.NET,ASP,C#,Java,OracleDB,VisualBasic"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232579",
                    "posting-timestamp": "1632733608",
                    "modification-timestamp": "1632733608",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232576&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2678800085&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "이쎌(주)"
                        }
                    },
                    "position": {
                        "title": "하드웨어, 펌웨어 개발자 채용",
                        "industry": {
                            "code": "307",
                            "name": "하드웨어·장비"
                        },
                        "location": {
                            "code": "102470",
                            "name": "경기 > 파주시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "139,153",
                            "name": "펌웨어,하드웨어,H/W"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 4,
                            "max": 0,
                            "name": "경력4년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "펌웨어,하드웨어",
                    "salary": {
                        "code": "14",
                        "name": "3,400~3,600만원"
                    },
                    "id": "41232576",
                    "posting-timestamp": "1632733567",
                    "modification-timestamp": "1632733567",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232560&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4058601552&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)한국클라우드"
                        }
                    },
                    "position": {
                        "title": "(주)한국클라우드 솔루션 개발 관련 자바 개발직군 경력직 모집",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101080",
                            "name": "서울 > 금천구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,229,235,236,118,136",
                            "name": "SI·시스템통합,SM,소프트웨어개발,웹개발,HTML,Java,Javascript,솔루션,클라우드"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 2,
                            "max": 0,
                            "name": "경력2년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "SI·시스템통합,SM,소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232560",
                    "posting-timestamp": "1632733490",
                    "modification-timestamp": "1632733490",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232554&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4318801818&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)굿닥"
                        }
                    },
                    "position": {
                        "title": "[굿닥] 병/의원 전자차트 프로그램 운영 담당자 채용 (신입가능)",
                        "industry": {
                            "code": "305",
                            "name": "포털·인터넷·컨텐츠"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,7,8,21",
                            "name": "IT개발·데이터,운전·운송·배송,영업·판매·무역,고객상담·TM"
                        },
                        "job-code": {
                            "code": "89,118,633,692,719,720,756,757,758,759,760,761,1981,1984,1993",
                            "name": "컨텐츠제공,유지보수,솔루션,납품운전원,기술영업,솔루션기술영업,시스템영업,가맹점관리,가맹점영업,거래처관리,거래처납품,거래처영업,고객관리,기술상담,전화상담"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "컨텐츠제공",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232554",
                    "posting-timestamp": "1632733441",
                    "modification-timestamp": "1632733441",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633705199",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232551&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4318801818&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)굿닥"
                        }
                    },
                    "position": {
                        "title": "[굿닥] 시니어 프로덕트 디자이너 채용",
                        "industry": {
                            "code": "305",
                            "name": "포털·인터넷·컨텐츠"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1488,1502,1527,1529,1609,1623",
                            "name": "컨텐츠제공,모바일디자인,웹디자인,BX디자인,UI/UX디자인,Figma,Zeplin"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 0,
                            "name": "경력5년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "컨텐츠제공",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232551",
                    "posting-timestamp": "1632733421",
                    "modification-timestamp": "1632733421",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1633705199",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232547&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7568601275&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "팜네이트(주)"
                        }
                    },
                    "position": {
                        "title": "온라인 쇼핑몰 - 웹디자이너 채용",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "102330",
                            "name": "경기 > 안양시 동안구"
                        },
                        "job-type": {
                            "code": "1,10,2",
                            "name": "정규직,계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,15",
                            "name": "IT개발·데이터,디자인"
                        },
                        "job-code": {
                            "code": "209,229,1488,1502,1529",
                            "name": "쇼핑몰,전자상거래,CSS,HTML,모바일디자인,웹디자인,UI/UX디자인"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 1,
                            "max": 3,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "쇼핑몰,전자상거래",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232547",
                    "posting-timestamp": "1632733418",
                    "modification-timestamp": "1632733418",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232536&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2048628002&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "드림프리덤(주)"
                        }
                    },
                    "position": {
                        "title": "각 부서별 신입·경력 정규직 채용",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "101180",
                            "name": "서울 > 송파구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,3,4,5,8,10,12,14,15,16,18",
                            "name": "IT개발·데이터,회계·세무·재무,총무·법무·사무,인사·노무·HRD,영업·판매·무역,서비스,상품기획·MD,마케팅·홍보·조사,디자인,기획·전략,구매·자재·물류"
                        },
                        "job-code": {
                            "code": "89,92,142,209,222,229,236,246,250,257,268,279,281,332,335,352,364,366,388,409,442,448,449,453,700,701,741,747,758,767,769,783,786,950,1277,1412,1413,1425,1429,1432,1437,1600,1614,1623,1629,1633,1635,1659,1663,1664,1665,1670,1674,1755,1791",
                            "name": "Phone,모바일,통신,유지보수,프론트엔드,API,CSS,Git,HTML,Javascript,Linux,MariaDB,MySQL,PHP,ReactJS,Redux,CFO,더존,연결회계,재무기획,재무회계,사무직,서류관리,복리후생,인사기획,인사행정,조직문화,영업지원,영업직,통신기기판매,핸드폰판매,거래처관리,매장관리,매출관리,유통영업,정산관리,요금정산,CS관리,마케팅기획,마케팅전략,디지털마케팅,브랜드마케팅,온라인마케팅,퍼포먼스마케팅,일러스트,PhotoShop,Zeplin,사업기획,서비스기획,사업개발,시장조사,신사업기획,신사업발굴,자료조사,타당성검토,재고관리,출고/출하,모바일개통,개통지원일반업무"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 0,
                            "max": 0,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "Phone,모바일,통신",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232536",
                    "posting-timestamp": "1632733373",
                    "modification-timestamp": "1632736261",
                    "opening-timestamp": "1632668400",
                    "expiration-timestamp": "1633964399",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232525&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2208174333&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "지미디어(주)"
                        }
                    },
                    "position": {
                        "title": "IOT 서비스 플랫폼 개발자 채용",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "102190",
                            "name": "경기 > 성남시 분당구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,92,118,167,240,256,258,292,312,156",
                            "name": "SI·시스템통합,소프트웨어개발,솔루션업체,웹개발,프론트엔드,솔루션,S/W,JSP,MyBatis,Node.js,SpringBoot,Vue.js,IoT"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "SI·시스템통합,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232525",
                    "posting-timestamp": "1632733332",
                    "modification-timestamp": "1632733336",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232511&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1061134430&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "제니스커머스"
                        }
                    },
                    "position": {
                        "title": "디자인팀 포토샵/일러스트레이터 경력직 모집",
                        "industry": {
                            "code": "803",
                            "name": "유통·무역·상사"
                        },
                        "location": {
                            "code": "102500",
                            "name": "경기 > 하남시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1502,1504,1614,1600",
                            "name": "유통업,웹디자인,일러스트레이터,PhotoShop,일러스트"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "유통업",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232511",
                    "posting-timestamp": "1632733265",
                    "modification-timestamp": "1632733265",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "2019567600",
                    "close-type": {
                        "code": "3",
                        "name": "상시채용"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232505&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3012551967&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "ds소프트"
                        }
                    },
                    "position": {
                        "title": "인공지능 개발자",
                        "industry": {
                            "code": "302",
                            "name": "웹에이젼시"
                        },
                        "location": {
                            "code": "114130",
                            "name": "충북 > 청주시 흥덕구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,229,235,268,272",
                            "name": "웹에이전시,웹개발,HTML,Java,PHP,Python"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 15,
                            "name": "경력 5~15년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "웹에이전시",
                    "salary": {
                        "code": "16",
                        "name": "3,800~4,000만원"
                    },
                    "id": "41232505",
                    "posting-timestamp": "1632733254",
                    "modification-timestamp": "1632733254",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635692399",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232493&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1378611555&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "세화파렛텍(주)"
                        }
                    },
                    "position": {
                        "title": "웹디자이너/상세페이지 제작/마케팅/신입 및 경력사원  모집",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "102020,102030,102040,102050,102110,108000,108010,108070",
                            "name": "경기 > 고양시,경기 > 고양시 덕양구,경기 > 고양시 일산동구,경기 > 고양시 일산서구,경기 > 김포시,인천 > 인천전체,인천 > 강화군,인천 > 서구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,14,15,16",
                            "name": "IT개발·데이터,마케팅·홍보·조사,디자인,기획·전략"
                        },
                        "job-code": {
                            "code": "229,1421,1428,1432,1463,1502,1605,1614,1635,1549",
                            "name": "쇼핑몰,오픈마켓,HTML,광고마케팅,바이럴마케팅,온라인마케팅,이벤트프로모션,웹디자인,플래시,PhotoShop,서비스기획,상세페이지"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "쇼핑몰,오픈마켓",
                    "salary": {
                        "code": "9",
                        "name": "2,400~2,600만원"
                    },
                    "id": "41232493",
                    "posting-timestamp": "1632733227",
                    "modification-timestamp": "1632733227",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232491&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2200782041&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "에이스파트너스"
                        }
                    },
                    "position": {
                        "title": "글로벌 컨설팅펌 - HCM 컨설턴트 (3~15년)",
                        "industry": {
                            "code": "313",
                            "name": "IT컨설팅"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "98",
                            "name": "ERP,IT컨설팅,Oracle,SAP"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 15,
                            "name": "경력 3~15년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "ERP,IT컨설팅,Oracle,SAP",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232491",
                    "posting-timestamp": "1632733214",
                    "modification-timestamp": "1632733214",
                    "opening-timestamp": "1632733200",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232483&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2200782041&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "에이스파트너스"
                        }
                    },
                    "position": {
                        "title": "글로벌 컨설팅펌 - SAP MM/SD 컨설턴트 (3~15년)",
                        "industry": {
                            "code": "313",
                            "name": "IT컨설팅"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "98,168",
                            "name": "ERP,SAP,SCM,IT컨설팅"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 15,
                            "name": "경력 3~15년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "ERP,SAP,SCM",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232483",
                    "posting-timestamp": "1632733179",
                    "modification-timestamp": "1632733179",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232478&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4531900680&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "디자인공간"
                        }
                    },
                    "position": {
                        "title": "인테리어 실장 경력무관 채용(정규직&계약직)",
                        "industry": {
                            "code": "902",
                            "name": "실내·인테리어·조경"
                        },
                        "location": {
                            "code": "110040",
                            "name": "경남 > 김해시"
                        },
                        "job-type": {
                            "code": "1,2",
                            "name": "정규직,계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15,22",
                            "name": "디자인,건설·건축"
                        },
                        "job-code": {
                            "code": "1497,2096,2134,2170",
                            "name": "건축설계·CAD,리모델링,샤시·베란다,실내건축,인테리어,실내디자인,인테리어공사,홈인테리어"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "건축설계·CAD,리모델링,샤시·베란다,실내건축,인테리어",
                    "salary": {
                        "code": "104"
                    },
                    "id": "41232478",
                    "posting-timestamp": "1632733164",
                    "modification-timestamp": "1632734011",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "2019567600",
                    "close-type": {
                        "code": "3",
                        "name": "상시채용"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232472&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2018206151&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(학)정화예술대학"
                        }
                    },
                    "position": {
                        "title": "직원  채용(전산정보실)",
                        "industry": {
                            "code": "601",
                            "name": "초중고·대학"
                        },
                        "location": {
                            "code": "101240",
                            "name": "서울 > 중구"
                        },
                        "job-type": {
                            "code": "11,4",
                            "name": "인턴직 (정규직 전환가능),인턴직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,19",
                            "name": "IT개발·데이터,교육"
                        },
                        "job-code": {
                            "code": "89,1802",
                            "name": "대학교,유지보수,교직원"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "대학교",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232472",
                    "posting-timestamp": "1632733150",
                    "modification-timestamp": "1632733150",
                    "opening-timestamp": "1632787200",
                    "expiration-timestamp": "1633680000",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232471&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3148616860&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)애니원"
                        }
                    },
                    "position": {
                        "title": "전산파트 신입/경력 채용",
                        "industry": {
                            "code": "213",
                            "name": "기타제조업"
                        },
                        "location": {
                            "code": "115133",
                            "name": "충남 > 천안시 동남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,89,90,100,104,153,167",
                            "name": "기타제조업,백엔드/서버개발,유지보수,정보보안,SE(시스템엔지니어),네트워크,H/W,S/W"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "기타제조업",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232471",
                    "posting-timestamp": "1632733149",
                    "modification-timestamp": "1632733149",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232469&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4258700869&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)콜라보그라운드"
                        }
                    },
                    "position": {
                        "title": "개발팀, 디자인팀, 마케팅팀, 고객지원팀 채용",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101130",
                            "name": "서울 > 마포구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,16,21",
                            "name": "IT개발·데이터,기획·전략,고객상담·TM"
                        },
                        "job-code": {
                            "code": "84,92,1637,1972",
                            "name": "소프트웨어개발,백엔드/서버개발,프론트엔드,웹기획,상담원"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "소프트웨어개발",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232469",
                    "posting-timestamp": "1632733138",
                    "modification-timestamp": "1632734473",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232467&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4248700376&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)알브이핀"
                        }
                    },
                    "position": {
                        "title": "[FROB] 에이전시 콘텐츠 디자이너 채용 ( 채용시 마감 )",
                        "industry": {
                            "code": "504",
                            "name": "광고·홍보·전시"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "10,16,17,2",
                            "name": "계약직 (정규직 전환가능),기간제,무기계약직,계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "14,15,16",
                            "name": "마케팅·홍보·조사,디자인,기획·전략"
                        },
                        "job-code": {
                            "code": "1412,1413,1419,1425,1426,1429,1435,1436,1449,1502,1515,1517,1629",
                            "name": "광고기획사,광고대행사,광고영업,마케팅기획,마케팅전략,SNS마케팅,디지털마케팅,모바일마케팅,브랜드마케팅,콘텐츠마케팅,콘텐츠에디터,검색광고,웹디자인,콘텐츠디자인,패키지디자인"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "광고기획사,광고대행사,광고영업",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232467",
                    "posting-timestamp": "1632733136",
                    "modification-timestamp": "1632735597",
                    "opening-timestamp": "1632668400",
                    "expiration-timestamp": "1638025199",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232459&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7908101891&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)비포플레이"
                        }
                    },
                    "position": {
                        "title": "B4play에서 프론트엔드 개발자를 모집합니다.",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "92",
                            "name": "소프트웨어개발,프론트엔드"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 7,
                            "max": 15,
                            "name": "경력 7~15년"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "소프트웨어개발",
                    "salary": {
                        "code": "18",
                        "name": "5,000~6,000만원"
                    },
                    "id": "41232459",
                    "posting-timestamp": "1632733092",
                    "modification-timestamp": "1632733092",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232456&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3498601868&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "유에이드(주)"
                        }
                    },
                    "position": {
                        "title": "[정규직] 2021하반기 아트&디자인 사업부 공개채용",
                        "industry": {
                            "code": "511",
                            "name": "디자인·설계"
                        },
                        "location": {
                            "code": "101180",
                            "name": "서울 > 송파구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15,19",
                            "name": "디자인,교육"
                        },
                        "job-code": {
                            "code": "1479,1483,1487,1488,1502,1504,1540,1549,1894",
                            "name": "디자인회사,전시·공간디자인,공간디자인,광고디자인,로고디자인,모바일디자인,웹디자인,일러스트레이터,렌더링,상세페이지,디자인"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "디자인회사,전시·공간디자인",
                    "salary": {
                        "code": "10",
                        "name": "2,600~2,800만원"
                    },
                    "id": "41232456",
                    "posting-timestamp": "1632733084",
                    "modification-timestamp": "1632733192",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232451&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7778601665&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)시디어스"
                        }
                    },
                    "position": {
                        "title": "진취적인 PHP 개발자 모집 (신입 지원 가능)",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "101000,101010,101020,101030,101040",
                            "name": "서울 > 서울전체,서울 > 강남구,서울 > 강동구,서울 > 강북구,서울 > 강서구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,15,16",
                            "name": "IT개발·데이터,디자인,기획·전략"
                        },
                        "job-code": {
                            "code": "87,209,235,236,272,1502,1635,1636,1637,1649,1690,268",
                            "name": "B2B,가격비교,쇼핑몰,오픈마켓,전자상거래,웹개발,CSS,Java,Javascript,Python,웹디자인,서비스기획,앱기획,웹기획,PM(프로젝트매니저),UI/UX,PHP"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "B2B,가격비교,쇼핑몰,오픈마켓,전자상거래",
                    "salary": {
                        "code": "17",
                        "name": "4,000~5,000만원"
                    },
                    "id": "41232451",
                    "posting-timestamp": "1632733073",
                    "modification-timestamp": "1632733924",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "2019567600",
                    "close-type": {
                        "code": "3",
                        "name": "상시채용"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232445&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6528701311&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "에이치알서비스 주식회사"
                        }
                    },
                    "position": {
                        "title": "[국내유명기업] 게임 소프트웨어 QA 모집건",
                        "industry": {
                            "code": "111",
                            "name": "시설관리·경비·용역"
                        },
                        "location": {
                            "code": "102190",
                            "name": "경기 > 성남시 분당구"
                        },
                        "job-type": {
                            "code": "10,2",
                            "name": "계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,16,21",
                            "name": "IT개발·데이터,기획·전략,고객상담·TM"
                        },
                        "job-code": {
                            "code": "80,97,99,1624,1981",
                            "name": "서치펌,아웃소싱,파견대행,헤드헌팅,게임개발,GM(게임운영),QA/테스터,게임기획,고객관리"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "서치펌,아웃소싱,파견대행,헤드헌팅",
                    "salary": {
                        "code": "8",
                        "name": "2,200~2,400만원"
                    },
                    "id": "41232445",
                    "posting-timestamp": "1632733054",
                    "modification-timestamp": "1632733054",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232422&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2141262821&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "제네틱상사"
                        }
                    },
                    "position": {
                        "title": "[마케팅팀] 웹디자인/그래픽디자인 경력직 채용",
                        "industry": {
                            "code": "803",
                            "name": "유통·무역·상사"
                        },
                        "location": {
                            "code": "101150",
                            "name": "서울 > 서초구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1484,1502",
                            "name": "상사,수입유통,그래픽디자인,웹디자인"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "상사,수입유통",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232422",
                    "posting-timestamp": "1632732953",
                    "modification-timestamp": "1632732953",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232417&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1148694359&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "주식회사 오픈소스컨설팅"
                        }
                    },
                    "position": {
                        "title": "[오픈소스컨설팅] 프론트엔드 / 백엔드 개발자 채용(경력)",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,87,92,167,201,235,246",
                            "name": "소프트웨어개발,백엔드/서버개발,웹개발,프론트엔드,S/W,AWS,Java,Linux"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 10,
                            "name": "경력 3~10년"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232417",
                    "posting-timestamp": "1632732920",
                    "modification-timestamp": "1632732920",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232412&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7258100786&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "인터골프(주)"
                        }
                    },
                    "position": {
                        "title": "인터골프(주) 설계 현장 감리 사원 구합니다.",
                        "industry": {
                            "code": "213",
                            "name": "기타제조업"
                        },
                        "location": {
                            "code": "110150",
                            "name": "경남 > 창원시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15,22",
                            "name": "디자인,건설·건축"
                        },
                        "job-code": {
                            "code": "1497,2048,2096,2134,2170,2192",
                            "name": "기타제조업,실내디자인,현장관리자,리모델링,인테리어공사,홈인테리어,CAD"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "기타제조업",
                    "salary": {
                        "code": "101"
                    },
                    "id": "41232412",
                    "posting-timestamp": "1632732902",
                    "modification-timestamp": "1632732902",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232406&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1148694359&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "주식회사 오픈소스컨설팅"
                        }
                    },
                    "position": {
                        "title": "[오픈소스컨설팅] 애자일 코치(Aglie Coach) 채용.",
                        "industry": {
                            "code": "313",
                            "name": "IT컨설팅"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,16",
                            "name": "IT개발·데이터,기획·전략"
                        },
                        "job-code": {
                            "code": "98,1639,1642,1654,1671",
                            "name": "IT컨설팅,전략기획,컨설턴트,경영혁신(PI),조직관리"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "IT컨설팅",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232406",
                    "posting-timestamp": "1632732863",
                    "modification-timestamp": "1632732863",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232404&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3598800176&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)미스터멘션"
                        }
                    },
                    "position": {
                        "title": "[여행 스타트업] 프로덕트팀 QA Manager 채용(서울)",
                        "industry": {
                            "code": "108",
                            "name": "호텔·여행·항공"
                        },
                        "location": {
                            "code": "101000,101010",
                            "name": "서울 > 서울전체,서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "99,276",
                            "name": "관광,QA/테스터,R"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 7,
                            "name": "경력 5~7년"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "관광",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232404",
                    "posting-timestamp": "1632732843",
                    "modification-timestamp": "1632738261",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635325200",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232402&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1148694359&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "주식회사 오픈소스컨설팅"
                        }
                    },
                    "position": {
                        "title": "[오픈소스컨설팅] 각 부문 엔지니어 채용(경력)",
                        "industry": {
                            "code": "313",
                            "name": "IT컨설팅"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,89,136,167,174,197,201,246,272",
                            "name": "IT컨설팅,백엔드/서버개발,유지보수,클라우드,S/W,VDI,Apache,AWS,Linux,Python"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "IT컨설팅",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232402",
                    "posting-timestamp": "1632732833",
                    "modification-timestamp": "1632732833",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232395&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1068199659&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)트랜스코스모스코리아"
                        }
                    },
                    "position": {
                        "title": "[경력자 모집] 당사 데이터 분석 및 사업 기획 담당자 모집",
                        "industry": {
                            "code": "111",
                            "name": "시설관리·경비·용역"
                        },
                        "location": {
                            "code": "101000,101010,101050,101130,101200,102000,102040,102070,102140",
                            "name": "서울 > 서울전체,서울 > 강남구,서울 > 관악구,서울 > 마포구,서울 > 영등포구,경기 > 경기전체,경기 > 고양시 일산동구,경기 > 광명시,경기 > 부천시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,14,16,21",
                            "name": "IT개발·데이터,마케팅·홍보·조사,기획·전략,고객상담·TM"
                        },
                        "job-code": {
                            "code": "82,83,98,106,107,116,136,137,148,181,235,272,276,1458,1460,1466,1625,1633,1635,1639,1657,1658,1670,1977,1978,1998,1999,2003",
                            "name": "서치펌,아웃소싱,파견대행,헤드헌팅,데이터분석가,데이터엔지니어,IT컨설팅,데이터마이닝,데이터시각화,빅데이터,클라우드,텍스트마이닝,DW,AI(인공지능),Java,Python,R,설문조사,시장조사,통계/분석,경영기획,사업기획,서비스기획,전략기획,리서치,데이터분석,자료조사,CS매니저,CX매니저,콜통계/분석,통화품질분석,VOC분석"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "서치펌,아웃소싱,파견대행,헤드헌팅",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232395",
                    "posting-timestamp": "1632732819",
                    "modification-timestamp": "1632734654",
                    "opening-timestamp": "1632668400",
                    "expiration-timestamp": "1633618799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232393&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4188138327&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(유)늘푸른씨앤에스"
                        }
                    },
                    "position": {
                        "title": "[전주본사]원격지원팀 정규직 채용",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "113080",
                            "name": "전북 > 완주군"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,8",
                            "name": "IT개발·데이터,영업·판매·무역"
                        },
                        "job-code": {
                            "code": "84,104,153,167,700,756,761",
                            "name": "네트웍구축,무선통신,통신,백엔드/서버개발,네트워크,H/W,S/W,영업지원,가맹점관리,고객관리"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "네트웍구축,무선통신,통신",
                    "salary": {
                        "code": "10",
                        "name": "2,600~2,800만원"
                    },
                    "id": "41232393",
                    "posting-timestamp": "1632732796",
                    "modification-timestamp": "1632732796",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232388&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=8088600577&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)캠프파이어애니웍스"
                        }
                    },
                    "position": {
                        "title": "(주)캠프파이어애니웍스 2021년 조연출 채용공고",
                        "industry": {
                            "code": "510",
                            "name": "캐릭터·애니메이션"
                        },
                        "location": {
                            "code": "101130",
                            "name": "서울 > 마포구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "13,15",
                            "name": "미디어·문화·스포츠,디자인"
                        },
                        "job-code": {
                            "code": "1323,1498",
                            "name": "애니메이션,PD/AD/FD,애니메이터"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "애니메이션",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232388",
                    "posting-timestamp": "1632732783",
                    "modification-timestamp": "1632734505",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1634050799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232384&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4098636145&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "대호아이엔티(주)"
                        }
                    },
                    "position": {
                        "title": "유지보수 사원모집(경력자 우대)",
                        "industry": {
                            "code": "307",
                            "name": "하드웨어·장비"
                        },
                        "location": {
                            "code": "103040",
                            "name": "광주 > 북구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,8,10,19",
                            "name": "IT개발·데이터,영업·판매·무역,서비스,교육"
                        },
                        "job-code": {
                            "code": "89,130,153,758,896,921,1833",
                            "name": "AS,유지보수,장비구축,펌웨어,하드웨어,정보통신,H/W,거래처관리,정비기사,A/S기사,컴퓨터교육"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "AS,유지보수,장비구축,펌웨어,하드웨어",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232384",
                    "posting-timestamp": "1632732755",
                    "modification-timestamp": "1632732919",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1634309999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232381&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1201103516&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "누네안과병원"
                        }
                    },
                    "position": {
                        "title": "[누네안과병원] 전산팀 프로그램 개발 경력자 모집",
                        "industry": {
                            "code": "701",
                            "name": "의료(진료과목별)"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,95,104,184,204,205,206,255,293,311",
                            "name": "병원·진료,안과,백엔드/서버개발,DBA,네트워크,.NET,C#,C++,C언어,MSSQL,SQL,VisualC·C++"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "병원·진료,안과",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232381",
                    "posting-timestamp": "1632732750",
                    "modification-timestamp": "1632732750",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232378&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2848101611&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)지금여기"
                        }
                    },
                    "position": {
                        "title": "일반사무 및 온라인 홍보 마케팅 모집공고",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "108000,108040,108080",
                            "name": "인천 > 인천전체,인천 > 남동구,인천 > 연수구"
                        },
                        "job-type": {
                            "code": "1,10,2",
                            "name": "정규직,계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "4,8,14,15,21",
                            "name": "총무·법무·사무,영업·판매·무역,마케팅·홍보·조사,디자인,고객상담·TM"
                        },
                        "job-code": {
                            "code": "388,402,405,699,700,758,785,1412,1413,1414,1421,1425,1428,1430,1432,1449,1461,1465,1466,1483,1484,1541,1972,1975,1976,1980,1981,1985,1994",
                            "name": "네트웍구축,모바일APP,무선통신,아이폰,안드로이드,사무직,문서작성,사무보조,영업관리,영업지원,거래처관리,점포개발,마케팅기획,마케팅전략,블로그마케팅,광고마케팅,디지털마케팅,바이럴마케팅,비즈니스마케팅,온라인마케팅,검색광고,언론홍보,키워드광고,통계/분석,광고디자인,그래픽디자인,리플렛,상담원,인바운드,텔레마케터,게시판관리,고객관리,단순안내,접수/예약"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "네트웍구축,모바일APP,무선통신,아이폰,안드로이드",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232378",
                    "posting-timestamp": "1632732734",
                    "modification-timestamp": "1632733054",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232374&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5291601613&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "쌤투쌤"
                        }
                    },
                    "position": {
                        "title": "플러터 (Flutter) 모바일 APP 개발자 모집",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "102330",
                            "name": "경기 > 안양시 동안구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "92,220,276",
                            "name": "오픈마켓,프론트엔드,Flutter,R"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "오픈마켓",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232374",
                    "posting-timestamp": "1632732722",
                    "modification-timestamp": "1632733921",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232340&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4208100601&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)네이처톡"
                        }
                    },
                    "position": {
                        "title": "2021년 네이처톡 디자이너 신입채용(경력직우대)",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "103050",
                            "name": "광주 > 서구"
                        },
                        "job-type": {
                            "code": "10,2",
                            "name": "계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1496,1502,1519,1614",
                            "name": "쇼핑몰,오픈마켓,시각디자인,웹디자인,편집디자인,PhotoShop"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "쇼핑몰,오픈마켓",
                    "salary": {
                        "code": "9",
                        "name": "2,400~2,600만원"
                    },
                    "id": "41232340",
                    "posting-timestamp": "1632732582",
                    "modification-timestamp": "1632732582",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1633013999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232332&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1238645492&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)태인유앤디"
                        }
                    },
                    "position": {
                        "title": "[신입/경력]경관계획/경관심의 공공디자인 분야 정규직",
                        "industry": {
                            "code": "511",
                            "name": "디자인·설계"
                        },
                        "location": {
                            "code": "102330",
                            "name": "경기 > 안양시 동안구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15,22",
                            "name": "디자인,건설·건축"
                        },
                        "job-code": {
                            "code": "1484,1496,1504,1587,1614,2095,1480",
                            "name": "환경디자인,그래픽디자인,시각디자인,일러스트레이터,CG,PhotoShop,도시교통,공공디자인"
                        },
                        "experience-level": {
                            "code": 1,
                            "min": 0,
                            "max": 0,
                            "name": "신입"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "환경디자인",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232332",
                    "posting-timestamp": "1632732551",
                    "modification-timestamp": "1632732899",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635519599",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232316&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2118663706&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "로데슈바르즈코리아(주)"
                        }
                    },
                    "position": {
                        "title": "[로데슈바르즈코리아] 유지보수 경력사원 채용",
                        "industry": {
                            "code": "201",
                            "name": "전기·전자·제어"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "81,89",
                            "name": "Hardware,RF,전자,기술지원,유지보수"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 5,
                            "name": "경력 1~5년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "Hardware,RF,전자",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232316",
                    "posting-timestamp": "1632732500",
                    "modification-timestamp": "1632732572",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232314&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6778600731&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "글로벌제주문화 협동조합"
                        }
                    },
                    "position": {
                        "title": "제주도 농업농촌활성화 (디자인) 채용합니다",
                        "industry": {
                            "code": "511",
                            "name": "디자인·설계"
                        },
                        "location": {
                            "code": "116030",
                            "name": "제주 > 서귀포시"
                        },
                        "job-type": {
                            "code": "2",
                            "name": "계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1488,1490,1496,1517",
                            "name": "광고디자인,디자인회사,멀티미디어디자인,시각디자인,환경디자인,모바일디자인,문구디자인,패키지디자인"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "광고디자인,디자인회사,멀티미디어디자인,시각디자인,환경디자인",
                    "salary": {
                        "code": "101"
                    },
                    "id": "41232314",
                    "posting-timestamp": "1632732495",
                    "modification-timestamp": "1632732495",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232301&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1148658159&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)에스씨포인트"
                        }
                    },
                    "position": {
                        "title": "응용프로그램(C/S) 개발관련 직원 채용(C# .Net)",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "2,9",
                            "name": "계약직,프리랜서"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "112,182,184,204,255",
                            "name": "CRM,ERP,소프트웨어개발,솔루션업체,미들웨어,Windows,.NET,C#,MSSQL,RFID"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 8,
                            "max": 15,
                            "name": "경력 8~15년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "CRM,ERP,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232301",
                    "posting-timestamp": "1632732440",
                    "modification-timestamp": "1632732440",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232298&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6388700223&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "베스핀글로벌(주)"
                        }
                    },
                    "position": {
                        "title": "Cloud Solution Architect 영입 (Presales 부문)",
                        "industry": {
                            "code": "313",
                            "name": "IT컨설팅"
                        },
                        "location": {
                            "code": "101000,101010,101060,101150,101240,102000,102070,102140,102180,102220",
                            "name": "서울 > 서울전체,서울 > 강남구,서울 > 광진구,서울 > 서초구,서울 > 중구,경기 > 경기전체,경기 > 광명시,경기 > 부천시,경기 > 성남시,경기 > 수원시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,8",
                            "name": "IT개발·데이터,영업·판매·무역"
                        },
                        "job-code": {
                            "code": "116,136,715,719,720,746,751,796,798,276",
                            "name": "IT컨설팅,빅데이터,클라우드,네트워크영업,솔루션기술영업,시스템영업,해외영업,IT영업,H/W,S/W,R"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "IT컨설팅",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232298",
                    "posting-timestamp": "1632732426",
                    "modification-timestamp": "1632732426",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232294&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6068164892&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)티비에이치글로벌"
                        }
                    },
                    "position": {
                        "title": "(주)티비에이치글로벌 - 미카이브(MekaiV) 니트 디자이너 모집",
                        "industry": {
                            "code": "205",
                            "name": "섬유·의류·패션"
                        },
                        "location": {
                            "code": "101000,101010",
                            "name": "서울 > 서울전체,서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1503,1559,1535",
                            "name": "남성의류,섬유,여성의류,의류·의상,패션,의상디자인,니트"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 6,
                            "name": "경력 3~6년"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "남성의류,섬유,여성의류,의류·의상,패션",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232294",
                    "posting-timestamp": "1632732419",
                    "modification-timestamp": "1632732419",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1634482799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232286&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=8578101267&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)와이엔에스커머스"
                        }
                    },
                    "position": {
                        "title": "디자인(웹디자인, 상세페이지外 부문) 사원채용",
                        "industry": {
                            "code": "803",
                            "name": "유통·무역·상사"
                        },
                        "location": {
                            "code": "102500",
                            "name": "경기 > 하남시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1494,1502,1509,1549",
                            "name": "수입유통,유통업,산업디자인,웹디자인,제품디자인,상세페이지"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "수입유통,유통업",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232286",
                    "posting-timestamp": "1632732393",
                    "modification-timestamp": "1632732514",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232279&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6388700223&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "베스핀글로벌(주)"
                        }
                    },
                    "position": {
                        "title": "Cloud Security Engineer 영입 (클라우드 보안 엔지니어)",
                        "industry": {
                            "code": "313",
                            "name": "IT컨설팅"
                        },
                        "location": {
                            "code": "101000,101010,101150,101160,101240,102000,102070,102140,102180,102220",
                            "name": "서울 > 서울전체,서울 > 강남구,서울 > 서초구,서울 > 성동구,서울 > 중구,경기 > 경기전체,경기 > 광명시,경기 > 부천시,경기 > 성남시,경기 > 수원시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,90,104,136,276",
                            "name": "IT컨설팅,백엔드/서버개발,정보보안,네트워크,클라우드,R"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "IT컨설팅",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232279",
                    "posting-timestamp": "1632732379",
                    "modification-timestamp": "1632732379",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232275&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1288709498&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "크리에이티브오늘(주)"
                        }
                    },
                    "position": {
                        "title": "검색엔진/웹개발/일러스트 정규직 채용 - 경력무관",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "102040",
                            "name": "경기 > 고양시 일산동구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,15",
                            "name": "IT개발·데이터,디자인"
                        },
                        "job-code": {
                            "code": "87,103,1600",
                            "name": "전자상거래,웹개발,검색엔진,일러스트"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "전자상거래",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232275",
                    "posting-timestamp": "1632732359",
                    "modification-timestamp": "1632732359",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232254&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1028142299&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)레디코리아"
                        }
                    },
                    "position": {
                        "title": "레디코리아 개발 부문 신입/경력 채용공고",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101150",
                            "name": "서울 > 서초구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,92,184,194,235,255,263",
                            "name": "소프트웨어개발,솔루션업체,웹개발,프론트엔드,.NET,Ajax,Java,MSSQL,OracleDB"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232254",
                    "posting-timestamp": "1632732285",
                    "modification-timestamp": "1632732389",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635519599",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232251&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2208749985&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)헬로서치"
                        }
                    },
                    "position": {
                        "title": "(대기업 자회사) 화장품패키지 리플렛 굿즈 디자인 대리과장급",
                        "industry": {
                            "code": "207",
                            "name": "화장품·뷰티"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1484,1487,1494,1517,1521,1526,1528,1541",
                            "name": "뷰티,화장품,그래픽디자인,로고디자인,산업디자인,패키지디자인,표지디자인,BI디자인,CI디자인,리플렛"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 10,
                            "name": "경력 3~10년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "뷰티,화장품",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232251",
                    "posting-timestamp": "1632732266",
                    "modification-timestamp": "1632732266",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232241&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4253200461&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "다솜커뮤니케이션즈"
                        }
                    },
                    "position": {
                        "title": "[강남/의료기기] QA (SW Support) 경력채용",
                        "industry": {
                            "code": "703",
                            "name": "제약·보건·바이오"
                        },
                        "location": {
                            "code": "101080",
                            "name": "서울 > 금천구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,8,13",
                            "name": "IT개발·데이터,영업·판매·무역,미디어·문화·스포츠"
                        },
                        "job-code": {
                            "code": "81,98,99,100,101,700,727,796,798,1309,276",
                            "name": "생명공학,의료·보건,의약·제약,기술지원,IT컨설팅,QA/테스터,SE(시스템엔지니어),SI개발,영업지원,의료기기영업,H/W,S/W,테크니컬라이터,R"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 8,
                            "name": "경력 3~8년"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "생명공학,의료·보건,의약·제약",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232241",
                    "posting-timestamp": "1632732236",
                    "modification-timestamp": "1632732236",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232235&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=8558100942&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "주식회사 판"
                        }
                    },
                    "position": {
                        "title": "(주)판 경력직 전시디자이너 모집",
                        "industry": {
                            "code": "902",
                            "name": "실내·인테리어·조경"
                        },
                        "location": {
                            "code": "102140",
                            "name": "경기 > 부천시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1507,1593,1600,1607,1614",
                            "name": "실내건축,전시디자인,3DMax,일러스트,CAD,PhotoShop"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "실내건축",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232235",
                    "posting-timestamp": "1632732204",
                    "modification-timestamp": "1632732204",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232234&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2208755847&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "엔셀 주식회사"
                        }
                    },
                    "position": {
                        "title": "Display 전산/DB/SQL운영, shell 프로그래밍 정규직",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "115100",
                            "name": "충남 > 아산시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,4",
                            "name": "IT개발·데이터,총무·법무·사무"
                        },
                        "job-code": {
                            "code": "84,95,100,154,246,263,293,305,407",
                            "name": "DataMining,소프트웨어개발,솔루션업체,백엔드/서버개발,DBA,SE(시스템엔지니어),IDC,Linux,OracleDB,SQL,Unix,사이트관리"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 1,
                            "max": 5,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "DataMining,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232234",
                    "posting-timestamp": "1632732202",
                    "modification-timestamp": "1632732202",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1633359599",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232217&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1068694305&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)인포그램"
                        }
                    },
                    "position": {
                        "title": "[정규직] 2021 인포그램 하반기 디자이너 채용",
                        "industry": {
                            "code": "504",
                            "name": "광고·홍보·전시"
                        },
                        "location": {
                            "code": "101090,101100,101110,101170,101250,102090,102120",
                            "name": "서울 > 노원구,서울 > 도봉구,서울 > 동대문구,서울 > 성북구,서울 > 중랑구,경기 > 구리시,경기 > 남양주시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "4,13,14,15",
                            "name": "총무·법무·사무,미디어·문화·스포츠,마케팅·홍보·조사,디자인"
                        },
                        "job-code": {
                            "code": "427,1308,1436,1483,1484,1486,1492,1493,1496,1504,1508,1515,1519,1520,1521,1522,1524,1526,1527,1528,1538,1547,1564,1568,1572,1573,1574,1576,1578,1580,1586,1599,1600,1614",
                            "name": "홍보대행사,PowerPoint,크리에이터,콘텐츠에디터,광고디자인,그래픽디자인,디지털디자인,북디자인,브랜드디자인,시각디자인,일러스트레이터,정보디자인,콘텐츠디자인,편집디자인,폰트디자인,표지디자인,프로모션디자인,AD(아트디렉터),BI디자인,BX디자인,CI디자인,드로잉,브로슈어,인포그래픽,제안서,카드뉴스,카탈로그,캘리그라피,타이포그래피,팜플렛,포스터,홍보물,인디자인,일러스트,PhotoShop"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 0,
                            "max": 0,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "홍보대행사",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232217",
                    "posting-timestamp": "1632732157",
                    "modification-timestamp": "1632733309",
                    "opening-timestamp": "1632668400",
                    "expiration-timestamp": "1633877999",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232210&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5638600558&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)디자인그룹칸"
                        }
                    },
                    "position": {
                        "title": "[디자이너] 경력 디자이너 정규직 채용",
                        "industry": {
                            "code": "511",
                            "name": "디자인·설계"
                        },
                        "location": {
                            "code": "104070",
                            "name": "대구 > 수성구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1496,1517,1526,1528",
                            "name": "디자인회사,멀티미디어디자인,시각디자인,환경디자인,패키지디자인,BI디자인,CI디자인"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "디자인회사,멀티미디어디자인,시각디자인,환경디자인",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232210",
                    "posting-timestamp": "1632732127",
                    "modification-timestamp": "1632732127",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232209&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3898700165&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)호원소프트"
                        }
                    },
                    "position": {
                        "title": "호원소프트 개발팀 초급개발자 경력직 채용공고",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "106060",
                            "name": "부산 > 동래구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,92,235",
                            "name": "SI·시스템통합,소프트웨어개발,솔루션업체,웹개발,프론트엔드,Java"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 4,
                            "name": "경력 1~4년"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "SI·시스템통합,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232209",
                    "posting-timestamp": "1632732126",
                    "modification-timestamp": "1632732241",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232203&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1208186581&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "에스넷시스템(주)"
                        }
                    },
                    "position": {
                        "title": "[목동] 인프라 시스템 운영 (경력 3년 이상) 채용",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101190",
                            "name": "서울 > 양천구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,100,153,246,305,127",
                            "name": "NI·네트워크통합,SI·시스템통합,SM,소프트웨어개발,솔루션업체,백엔드/서버개발,SE(시스템엔지니어),H/W,Linux,Unix,인프라"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "NI·네트워크통합,SI·시스템통합,SM,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232203",
                    "posting-timestamp": "1632732097",
                    "modification-timestamp": "1632732097",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1634482799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232201&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=8258100126&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)엘앤제이테크"
                        }
                    },
                    "position": {
                        "title": "대전/세종 정보보안 컨설팅 신입/경력 모집",
                        "industry": {
                            "code": "308",
                            "name": "정보보안·백신"
                        },
                        "location": {
                            "code": "105000,118000",
                            "name": "대전 > 대전전체,세종 > 세종특별자치시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,19",
                            "name": "IT개발·데이터,교육"
                        },
                        "job-code": {
                            "code": "85,90,98,1916",
                            "name": "네트워크보안,보안,보안컨설팅,정보보안,IT컨설팅,정보보호교육"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "네트워크보안,보안,보안컨설팅,정보보안",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232201",
                    "posting-timestamp": "1632732089",
                    "modification-timestamp": "1632734218",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "2019567600",
                    "close-type": {
                        "code": "3",
                        "name": "상시채용"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232200&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=3368801167&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)매쓰마스터"
                        }
                    },
                    "position": {
                        "title": "[에듀테크 스타트업] 프로젝트 매니저(PM) 채용 공고",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "101040",
                            "name": "서울 > 강서구"
                        },
                        "job-type": {
                            "code": "10,2",
                            "name": "계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,4,14,15,16",
                            "name": "IT개발·데이터,총무·법무·사무,마케팅·홍보·조사,디자인,기획·전략"
                        },
                        "job-code": {
                            "code": "80,84,86,87,418,1420,1435,1436,1488,1502,1515,1529,1624,1635,1636,1637,1639,1648,1649,1650",
                            "name": "Phone,모바일,모바일APP,모바일게임,아이폰,게임개발,백엔드/서버개발,앱개발,웹개발,콘텐츠관리,콘텐츠기획,콘텐츠마케팅,콘텐츠에디터,모바일디자인,웹디자인,콘텐츠디자인,UI/UX디자인,게임기획,서비스기획,앱기획,웹기획,전략기획,PL(프로젝트리더),PM(프로젝트매니저),PMO"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 2,
                            "max": 0,
                            "name": "경력2년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "Phone,모바일,모바일APP,모바일게임,아이폰",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232200",
                    "posting-timestamp": "1632732084",
                    "modification-timestamp": "1632732153",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232198&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2208749985&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)헬로서치"
                        }
                    },
                    "position": {
                        "title": "(대기업 자회사) 화장품 패키지 디자인",
                        "industry": {
                            "code": "207",
                            "name": "화장품·뷰티"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1484,1509,1517,1526,1527,1528,1595,1600,1612,1614",
                            "name": "뷰티,화장품,그래픽디자인,제품디자인,패키지디자인,BI디자인,BX디자인,CI디자인,라이노,일러스트,Keyshot,PhotoShop"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 10,
                            "name": "경력 3~10년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "뷰티,화장품",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232198",
                    "posting-timestamp": "1632732078",
                    "modification-timestamp": "1632733560",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232189&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2158719102&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)코리아인"
                        }
                    },
                    "position": {
                        "title": "[서대문/유명리서치업계] 웹프로그래머 채용(신입가능)",
                        "industry": {
                            "code": "1005",
                            "name": "연구소·컨설팅·조사"
                        },
                        "location": {
                            "code": "101000,101010,101140,101200,101240,102000,102020,102110,102140,102180",
                            "name": "서울 > 서울전체,서울 > 강남구,서울 > 서대문구,서울 > 영등포구,서울 > 중구,경기 > 경기전체,경기 > 고양시,경기 > 김포시,경기 > 부천시,경기 > 성남시"
                        },
                        "job-type": {
                            "code": "2,6",
                            "name": "계약직,파견직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "82,83,84,86,87,92,101,106,108,109,182,199,200,204,206,235,236,239,246,255,257,269,272,320",
                            "name": "연구소,조사분석,컨설팅,데이터분석가,데이터엔지니어,백엔드/서버개발,앱개발,웹개발,프론트엔드,SI개발,데이터마이닝,딥러닝,머신러닝,Windows,ASP,ASP.NET,C#,C언어,Java,Javascript,jQuery,Linux,MSSQL,MySQL,PL/SQL,Python,임베디드리눅스"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "연구소,조사분석,컨설팅",
                    "salary": {
                        "code": "11",
                        "name": "2,800~3,000만원"
                    },
                    "id": "41232189",
                    "posting-timestamp": "1632732048",
                    "modification-timestamp": "1632732108",
                    "opening-timestamp": "1632747600",
                    "expiration-timestamp": "1633532399",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232173&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2208733426&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)씨드러닝"
                        }
                    },
                    "position": {
                        "title": "(주)씨드러닝과 함께 할 편집디자이너를 찾습니다.",
                        "industry": {
                            "code": "509",
                            "name": "출판·인쇄·사진"
                        },
                        "location": {
                            "code": "102190",
                            "name": "경기 > 성남시 분당구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1492,1519,1586,1599",
                            "name": "출판사,북디자인,편집디자인,홍보물,인디자인"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 2,
                            "max": 3,
                            "name": "경력 2~3년"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "출판사",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232173",
                    "posting-timestamp": "1632732017",
                    "modification-timestamp": "1632732017",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232171&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1348600739&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)씨쓰리"
                        }
                    },
                    "position": {
                        "title": "전산 관리자",
                        "industry": {
                            "code": "213",
                            "name": "기타제조업"
                        },
                        "location": {
                            "code": "102510",
                            "name": "경기 > 화성시"
                        },
                        "job-type": {
                            "code": "1,10,2",
                            "name": "정규직,계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,11",
                            "name": "IT개발·데이터,생산"
                        },
                        "job-code": {
                            "code": "100,1027",
                            "name": "기타제조업,SE(시스템엔지니어),프로그램설계"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 10,
                            "name": "경력 5~10년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "기타제조업",
                    "salary": {
                        "code": "17",
                        "name": "4,000~5,000만원"
                    },
                    "id": "41232171",
                    "posting-timestamp": "1632732006",
                    "modification-timestamp": "1632732006",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232156&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7428600224&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)여기어때컴퍼니"
                        }
                    },
                    "position": {
                        "title": "[여기어때] 마케팅 데이터분석가 채용 (Jr./Sr)",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,14",
                            "name": "IT개발·데이터,마케팅·홍보·조사"
                        },
                        "job-code": {
                            "code": "82,116,272,276,293,1412,1413,1425",
                            "name": "모바일APP,데이터분석가,빅데이터,Python,R,SQL,마케팅기획,마케팅전략,디지털마케팅"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 4,
                            "max": 20,
                            "name": "경력 4~20년"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "모바일APP",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232156",
                    "posting-timestamp": "1632731970",
                    "modification-timestamp": "1632732013",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232151&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2011772162&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "미담디자인"
                        }
                    },
                    "position": {
                        "title": "주거공간 디자인  경력 및 신입 모집 공고",
                        "industry": {
                            "code": "902",
                            "name": "실내·인테리어·조경"
                        },
                        "location": {
                            "code": "101030",
                            "name": "서울 > 강북구"
                        },
                        "job-type": {
                            "code": "1,10,2",
                            "name": "정규직,계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15,22",
                            "name": "디자인,건설·건축"
                        },
                        "job-code": {
                            "code": "1497,2096",
                            "name": "리모델링,인테리어,실내디자인"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "리모델링,인테리어",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232151",
                    "posting-timestamp": "1632731956",
                    "modification-timestamp": "1632731956",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232144&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5048602843&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)삼정"
                        }
                    },
                    "position": {
                        "title": "(주)삼정 LG전자 온라인 공식대리점 웹디자이너 모집공고",
                        "industry": {
                            "code": "802",
                            "name": "판매(상품품목별)"
                        },
                        "location": {
                            "code": "101210",
                            "name": "서울 > 용산구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,15",
                            "name": "IT개발·데이터,디자인"
                        },
                        "job-code": {
                            "code": "236,1502,1605,1614",
                            "name": "가전·오디오판매,Javascript,웹디자인,플래시,PhotoShop"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 1,
                            "max": 0,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "가전·오디오판매",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232144",
                    "posting-timestamp": "1632731942",
                    "modification-timestamp": "1632731942",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232124&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=7888101597&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "케이토이즈"
                        }
                    },
                    "position": {
                        "title": "PS , AI 등 사용 가능한 SNS 운영 중국인 & 중국어 능력자 모집",
                        "industry": {
                            "code": "504",
                            "name": "광고·홍보·전시"
                        },
                        "location": {
                            "code": "101140",
                            "name": "서울 > 서대문구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "8,12,14,15",
                            "name": "영업·판매·무역,상품기획·MD,마케팅·홍보·조사,디자인"
                        },
                        "job-code": {
                            "code": "699,700,746,1279,1419,1484,1504,1519,1530,1531,1614",
                            "name": "광고기획사,광고영업,전시기획,홍보대행사,영업관리,영업지원,해외영업,SNS,SNS마케팅,그래픽디자인,일러스트레이터,편집디자인,2D디자인,3D디자인,PhotoShop"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "광고기획사,광고영업,전시기획,홍보대행사",
                    "salary": {
                        "code": "101"
                    },
                    "id": "41232124",
                    "posting-timestamp": "1632731877",
                    "modification-timestamp": "1632735038",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232123&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1358182398&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)아주디자인그룹"
                        }
                    },
                    "position": {
                        "title": "인테리어 설계 모집(수원 근무)",
                        "industry": {
                            "code": "901",
                            "name": "건설·건축·토목·시공"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15,22",
                            "name": "디자인,건설·건축"
                        },
                        "job-code": {
                            "code": "1497,2121,2134,2170,2192",
                            "name": "건설회사,실내디자인,실내건축시공,인테리어공사,홈인테리어,CAD"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "건설회사",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232123",
                    "posting-timestamp": "1632731876",
                    "modification-timestamp": "1632731876",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232087&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6938802322&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)어반엘티"
                        }
                    },
                    "position": {
                        "title": "웹개발(Java·JSP/Ajax/XML) 및 SM 인력",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101150",
                            "name": "서울 > 서초구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,194,235,240,318",
                            "name": "SI·시스템통합,SM,소프트웨어개발,솔루션업체,웹개발,Ajax,Java,JSP,XML"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "SI·시스템통합,SM,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232087",
                    "posting-timestamp": "1632731766",
                    "modification-timestamp": "1632732196",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232072&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2982600456&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "케이엔커뮤니케이션"
                        }
                    },
                    "position": {
                        "title": "(신입&경력) 몰토디자인 디자인팀 UI·UX디자인 모집합니다",
                        "industry": {
                            "code": "302",
                            "name": "웹에이젼시"
                        },
                        "location": {
                            "code": "102340",
                            "name": "경기 > 안양시 만안구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1488,1502,1529,1589,1614",
                            "name": "웹에이전시,모바일디자인,웹디자인,UI/UX디자인,GUI,PhotoShop"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "웹에이전시",
                    "salary": {
                        "code": "8",
                        "name": "2,200~2,400만원"
                    },
                    "id": "41232072",
                    "posting-timestamp": "1632731723",
                    "modification-timestamp": "1632731722",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232070&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5038146784&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)아바텍"
                        }
                    },
                    "position": {
                        "title": "(주)AVATEC 구미공장 전산시스템(H/W, S/W, N/W) 관리자 모집",
                        "industry": {
                            "code": "211",
                            "name": "금속·재료·철강·요업"
                        },
                        "location": {
                            "code": "111040",
                            "name": "경북 > 구미시"
                        },
                        "job-type": {
                            "code": "1,10,2",
                            "name": "정규직,계약직 (정규직 전환가능),계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,11",
                            "name": "IT개발·데이터,생산"
                        },
                        "job-code": {
                            "code": "84,90,100,104,153,167,1118,1149,1153",
                            "name": "세라믹스,신소재,백엔드/서버개발,정보보안,SE(시스템엔지니어),네트워크,H/W,S/W,MES"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 4,
                            "max": 0,
                            "name": "경력4년↑"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "세라믹스,신소재",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232070",
                    "posting-timestamp": "1632731716",
                    "modification-timestamp": "1632731716",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232069&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5048163563&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "제일기술(주)"
                        }
                    },
                    "position": {
                        "title": "전자제품 수리기사  모집",
                        "industry": {
                            "code": "201",
                            "name": "전기·전자·제어"
                        },
                        "location": {
                            "code": "104040",
                            "name": "대구 > 동구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,10",
                            "name": "IT개발·데이터,서비스"
                        },
                        "job-code": {
                            "code": "84,104,921",
                            "name": "전자,백엔드/서버개발,네트워크,A/S기사"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "전자",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232069",
                    "posting-timestamp": "1632731708",
                    "modification-timestamp": "1632732876",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232054&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1208186581&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "에스넷시스템(주)"
                        }
                    },
                    "position": {
                        "title": "[베트남] 네트워크 엔지니어 (현지채용)",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "210600",
                            "name": "아시아·중동 > 베트남"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "89,104",
                            "name": "NI·네트워크통합,SI·시스템통합,SM,소프트웨어개발,솔루션업체,유지보수,네트워크"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 0,
                            "name": "경력5년↑"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "NI·네트워크통합,SI·시스템통합,SM,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232054",
                    "posting-timestamp": "1632731661",
                    "modification-timestamp": "1632731661",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1634482799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232039&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1288709498&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "크리에이티브오늘(주)"
                        }
                    },
                    "position": {
                        "title": "포토샵, 온라인광고 정규직 채용합니다 - 경력무관",
                        "industry": {
                            "code": "209",
                            "name": "가구·목재·제지"
                        },
                        "location": {
                            "code": "102040",
                            "name": "경기 > 고양시 일산동구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "14,15",
                            "name": "마케팅·홍보·조사,디자인"
                        },
                        "job-code": {
                            "code": "1432,1502,1614",
                            "name": "제지,온라인마케팅,웹디자인,PhotoShop"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "제지",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232039",
                    "posting-timestamp": "1632731611",
                    "modification-timestamp": "1632731611",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232035&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2158690506&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "맵퍼스"
                        }
                    },
                    "position": {
                        "title": "SW 연구개발 부문 전문연구요원 모집",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101180",
                            "name": "서울 > 송파구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,20",
                            "name": "IT개발·데이터,공공·복지"
                        },
                        "job-code": {
                            "code": "167,205,235,236,272,1944",
                            "name": "소프트웨어개발,S/W,C++,Java,Javascript,Python,병역특례,전문연구요원"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "9",
                            "name": "석사졸업이상"
                        }
                    },
                    "keyword": "소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41232035",
                    "posting-timestamp": "1632731603",
                    "modification-timestamp": "1632731824",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232026&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1268652783&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)룩엔에스"
                        }
                    },
                    "position": {
                        "title": "교통통합관제 시스템 모니터링 주말 근무(토,일) 요원 채용",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "102120",
                            "name": "경기 > 남양주시"
                        },
                        "job-type": {
                            "code": "2,5,9",
                            "name": "계약직,아르바이트,프리랜서"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,104",
                            "name": "웹호스팅,백엔드/서버개발,네트워크"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "웹호스팅",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232026",
                    "posting-timestamp": "1632731569",
                    "modification-timestamp": "1632731569",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232002&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1078714164&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "링솔류션즈"
                        }
                    },
                    "position": {
                        "title": "Network 및 보안장비 엔지니어 채용 공고 (강원도 원주)",
                        "industry": {
                            "code": "308",
                            "name": "정보보안·백신"
                        },
                        "location": {
                            "code": "109090",
                            "name": "강원 > 원주시"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,11",
                            "name": "IT개발·데이터,생산"
                        },
                        "job-code": {
                            "code": "100,104,114,130,1178,276",
                            "name": "네트워크보안,정보보안,SE(시스템엔지니어),네트워크,방화벽,정보통신,라우터,R"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "네트워크보안,정보보안",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232002",
                    "posting-timestamp": "1632731486",
                    "modification-timestamp": "1632731486",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41232001&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1178181256&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)힐링페이퍼"
                        }
                    },
                    "position": {
                        "title": "[힐링페이퍼] 정보보안 전문가 / 엔지니어 모집",
                        "industry": {
                            "code": "308",
                            "name": "정보보안·백신"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "90",
                            "name": "네트워크보안,보안,정보보안"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 15,
                            "name": "경력 5~15년"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "네트워크보안,보안,정보보안",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41232001",
                    "posting-timestamp": "1632731484",
                    "modification-timestamp": "1632731591",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "2019567600",
                    "close-type": {
                        "code": "3",
                        "name": "상시채용"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231998&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1128800219&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주) 소프트랩스"
                        }
                    },
                    "position": {
                        "title": "PHP 개발자 모집 경력무관 채용(정규직&계약직)",
                        "industry": {
                            "code": "302",
                            "name": "웹에이젼시"
                        },
                        "location": {
                            "code": "101080",
                            "name": "서울 > 금천구"
                        },
                        "job-type": {
                            "code": "1,10,16,17,2",
                            "name": "정규직,계약직 (정규직 전환가능),기간제,무기계약직,계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,268",
                            "name": "웹에이전시,웹개발,PHP"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "웹에이전시",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41231998",
                    "posting-timestamp": "1632731476",
                    "modification-timestamp": "1632731476",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231987&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6218186181&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)이디오디자인건축"
                        }
                    },
                    "position": {
                        "title": "[정규직] 디자이너 모집합니다.",
                        "industry": {
                            "code": "511",
                            "name": "디자인·설계"
                        },
                        "location": {
                            "code": "111220",
                            "name": "경북 > 칠곡군"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1483,1496,1504,1533,1541,1560,1584,1586,1614",
                            "name": "광고디자인,디자인회사,시각디자인,일러스트레이터,간판,리플렛,옥외광고,현수막,홍보물,PhotoShop"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 1,
                            "max": 0,
                            "name": "경력1년↑"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "광고디자인,디자인회사",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41231987",
                    "posting-timestamp": "1632731435",
                    "modification-timestamp": "1632731435",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231983&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1138534517&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "케이엘정보통신(주) 대전지점"
                        }
                    },
                    "position": {
                        "title": "[대전] SI구축/통합유지보수 사업수행 및 제안서 (경력)",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "105030",
                            "name": "대전 > 서구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,16",
                            "name": "IT개발·데이터,기획·전략"
                        },
                        "job-code": {
                            "code": "84,89,98,153,167,1642,1649,1690",
                            "name": "SI·시스템통합,SM,솔루션업체,시스템관리,백엔드/서버개발,유지보수,IT컨설팅,H/W,S/W,컨설턴트,PM(프로젝트매니저),UI/UX"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 10,
                            "name": "경력 3~10년"
                        },
                        "required-education-level": {
                            "code": "8",
                            "name": "대학교졸업(4년)이상"
                        }
                    },
                    "keyword": "SI·시스템통합,SM,솔루션업체,시스템관리",
                    "salary": {
                        "code": "14",
                        "name": "3,400~3,600만원"
                    },
                    "id": "41231983",
                    "posting-timestamp": "1632731427",
                    "modification-timestamp": "1632731427",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1634569199",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231981&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=6108177149&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)에이치씨엔씨"
                        }
                    },
                    "position": {
                        "title": "2021 하반기 응용프로그램 개발자 경력/신입 정규직 채용",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "107050",
                            "name": "울산 > 중구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "87,167,184,204,235,236,255,257,263",
                            "name": "DBMS,SI·시스템통합,SM,소프트웨어개발,웹개발,S/W,.NET,C#,Java,Javascript,MSSQL,MySQL,OracleDB"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "DBMS,SI·시스템통합,SM,소프트웨어개발",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41231981",
                    "posting-timestamp": "1632731425",
                    "modification-timestamp": "1632731580",
                    "opening-timestamp": "1632726000",
                    "expiration-timestamp": "2019567600",
                    "close-type": {
                        "code": "3",
                        "name": "상시채용"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231979&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2041444723&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "스위드컴퍼니"
                        }
                    },
                    "position": {
                        "title": "[디자인팀, 마케팅팀] 각 부문 담당자 채용",
                        "industry": {
                            "code": "511",
                            "name": "디자인·설계"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "14,15",
                            "name": "마케팅·홍보·조사,디자인"
                        },
                        "job-code": {
                            "code": "1412,1419,1432,1519",
                            "name": "디자인회사,마케팅기획,SNS마케팅,온라인마케팅,편집디자인"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "디자인회사",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41231979",
                    "posting-timestamp": "1632731416",
                    "modification-timestamp": "1632731416",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231978&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4618600723&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)브링인포"
                        }
                    },
                    "position": {
                        "title": "IT 엔지니어 (백업) 모집(신입/경력)",
                        "industry": {
                            "code": "307",
                            "name": "하드웨어·장비"
                        },
                        "location": {
                            "code": "101180",
                            "name": "서울 > 송파구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "153,167",
                            "name": "유지보수,장비구축,하드웨어,H/W,S/W"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 1,
                            "max": 3,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "유지보수,장비구축,하드웨어",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41231978",
                    "posting-timestamp": "1632731414",
                    "modification-timestamp": "1632732827",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231973&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1138136157&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "금성이엔씨(주)"
                        }
                    },
                    "position": {
                        "title": "마케팅 컨텐츠 디자인 개발 인력 채용",
                        "industry": {
                            "code": "208",
                            "name": "생활용품·소비재·사무"
                        },
                        "location": {
                            "code": "101130",
                            "name": "서울 > 마포구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "14,15",
                            "name": "마케팅·홍보·조사,디자인"
                        },
                        "job-code": {
                            "code": "1412,1419,1432,1435,1483",
                            "name": "생활용품,소비재,마케팅기획,SNS마케팅,온라인마케팅,콘텐츠마케팅,광고디자인"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 2,
                            "max": 0,
                            "name": "경력2년↑"
                        },
                        "required-education-level": {
                            "code": "6",
                            "name": "고등학교졸업이상"
                        }
                    },
                    "keyword": "생활용품,소비재",
                    "salary": {
                        "code": "11",
                        "name": "2,800~3,000만원"
                    },
                    "id": "41231973",
                    "posting-timestamp": "1632731393",
                    "modification-timestamp": "1632731497",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231972&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=4618600723&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)브링인포"
                        }
                    },
                    "position": {
                        "title": "IT 엔지니어 (스토리지) 모집(신입/경력)",
                        "industry": {
                            "code": "307",
                            "name": "하드웨어·장비"
                        },
                        "location": {
                            "code": "101180",
                            "name": "서울 > 송파구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "153,167",
                            "name": "유지보수,장비구축,하드웨어,H/W,S/W"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 1,
                            "max": 3,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "유지보수,장비구축,하드웨어",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41231972",
                    "posting-timestamp": "1632731390",
                    "modification-timestamp": "1632732758",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231967&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1198175653&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)화인폰"
                        }
                    },
                    "position": {
                        "title": "IT기기 S/W 품질 검증 신입사원 채용 - 정규직",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "101080",
                            "name": "서울 > 금천구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "99,167",
                            "name": "모바일,QA/테스터,S/W"
                        },
                        "experience-level": {
                            "code": 1,
                            "min": 0,
                            "max": 0,
                            "name": "신입"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "모바일",
                    "salary": {
                        "code": "98"
                    },
                    "id": "41231967",
                    "posting-timestamp": "1632731376",
                    "modification-timestamp": "1632731376",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1633532399",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231957&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1078714164&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "링솔류션즈"
                        }
                    },
                    "position": {
                        "title": "Network 엔지니어 채용 공고 (서울  가양)",
                        "industry": {
                            "code": "306",
                            "name": "네트워크·통신·모바일"
                        },
                        "location": {
                            "code": "101040",
                            "name": "서울 > 강서구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2,11",
                            "name": "IT개발·데이터,생산"
                        },
                        "job-code": {
                            "code": "100,104,114,130,1178,276",
                            "name": "네트웍구축,통신,SE(시스템엔지니어),네트워크,방화벽,정보통신,라우터,R"
                        },
                        "experience-level": {
                            "code": 3,
                            "min": 2,
                            "max": 0,
                            "name": "신입/경력"
                        },
                        "required-education-level": {
                            "code": "7",
                            "name": "대학졸업(2,3년)이상"
                        }
                    },
                    "keyword": "네트웍구축,통신",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41231957",
                    "posting-timestamp": "1632731355",
                    "modification-timestamp": "1632731355",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635346799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231952&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2041444723&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "스위드컴퍼니"
                        }
                    },
                    "position": {
                        "title": "디자인팀 [일러스트,포토샵] 신입/경력 정규직 사원 채용",
                        "industry": {
                            "code": "509",
                            "name": "출판·인쇄·사진"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "15",
                            "name": "디자인"
                        },
                        "job-code": {
                            "code": "1494,1496,1509,1519,1600",
                            "name": "인쇄·제본,산업디자인,시각디자인,제품디자인,편집디자인,일러스트"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "인쇄·제본",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41231952",
                    "posting-timestamp": "1632731345",
                    "modification-timestamp": "1632731345",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1988118000",
                    "close-type": {
                        "code": "2",
                        "name": "채용시"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231938&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=2118714314&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "(주)필라넷"
                        }
                    },
                    "position": {
                        "title": "필라넷 Microsoft System Engineer 프리랜서 채용 (중국 우시)",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101160",
                            "name": "서울 > 성동구"
                        },
                        "job-type": {
                            "code": "9",
                            "name": "프리랜서"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "100,276",
                            "name": "NI·네트워크통합,SI·시스템통합,소프트웨어개발,솔루션업체,시스템관리,SE(시스템엔지니어),R"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 5,
                            "max": 0,
                            "name": "경력5년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "NI·네트워크통합,SI·시스템통합,소프트웨어개발,솔루션업체,시스템관리",
                    "salary": {
                        "code": "0",
                        "name": "회사내규에 따름"
                    },
                    "id": "41231938",
                    "posting-timestamp": "1632731293",
                    "modification-timestamp": "1632731544",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1635260399",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231928&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=1208186581&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "에스넷시스템(주)"
                        }
                    },
                    "position": {
                        "title": "[기흥/화성] VMware 운영인력 (경력 3년 이상) 채용",
                        "industry": {
                            "code": "301",
                            "name": "솔루션·SI·ERP·CRM"
                        },
                        "location": {
                            "code": "101010",
                            "name": "서울 > 강남구"
                        },
                        "job-type": {
                            "code": "1",
                            "name": "정규직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "2",
                            "name": "IT개발·데이터"
                        },
                        "job-code": {
                            "code": "84,90,98,104,153,167,174,175,276",
                            "name": "NI·네트워크통합,SI·시스템통합,SM,소프트웨어개발,솔루션업체,백엔드/서버개발,정보보안,IT컨설팅,네트워크,H/W,S/W,VDI,VMware,R"
                        },
                        "experience-level": {
                            "code": 2,
                            "min": 3,
                            "max": 0,
                            "name": "경력3년↑"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "NI·네트워크통합,SI·시스템통합,SM,소프트웨어개발,솔루션업체",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41231928",
                    "posting-timestamp": "1632731250",
                    "modification-timestamp": "1632731250",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1634482799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                },
                {
                    "url": "http://www.saramin.co.kr/zf_user/jobs/relay/view?rec_idx=41231920&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                    "active": 1,
                    "company": {
                        "detail": {
                            "href": "http://www.saramin.co.kr/zf_user/company-info/view?csn=5922600872&utm_source=job-search-api&utm_medium=api&utm_campaign=saramin-job-search-api",
                            "name": "자이젠"
                        }
                    },
                    "position": {
                        "title": "여성의류 쇼핑몰 패션MD / 웹디자이너 모십니다(유류비 지급)",
                        "industry": {
                            "code": "304",
                            "name": "쇼핑몰·오픈마켓"
                        },
                        "location": {
                            "code": "108020",
                            "name": "인천 > 계양구"
                        },
                        "job-type": {
                            "code": "1,2",
                            "name": "정규직,계약직"
                        },
                        "job-category": {},
                        "job-mid-code": {
                            "code": "8,12,13,15",
                            "name": "영업·판매·무역,상품기획·MD,미디어·문화·스포츠,디자인"
                        },
                        "job-code": {
                            "code": "702,776,1212,1213,1214,1218,1219,1220,1221,1241,1245,1253,1255,1259,1268,1269,1271,1312,1491,1502,1504,1549,1600,1614,1559",
                            "name": "B2C,쇼핑몰,오픈마켓,전자상거래,영업MD,쇼핑몰관리,기획MD,리테일MD,바잉MD,오프라인MD,온라인MD,유통MD,AMD,상품관리,여성의류,자사몰관리,패션브랜드,패션잡화,편집샵,패션모델,배너디자인,웹디자인,일러스트레이터,상세페이지,일러스트,PhotoShop"
                        },
                        "experience-level": {
                            "code": 0,
                            "min": 0,
                            "max": 0,
                            "name": "경력무관"
                        },
                        "required-education-level": {
                            "code": "0",
                            "name": "학력무관"
                        }
                    },
                    "keyword": "B2C,쇼핑몰,오픈마켓,전자상거래",
                    "salary": {
                        "code": "99",
                        "name": "면접후 결정"
                    },
                    "id": "41231920",
                    "posting-timestamp": "1632731238",
                    "modification-timestamp": "1632731237",
                    "opening-timestamp": "1632729600",
                    "expiration-timestamp": "1637938799",
                    "close-type": {
                        "code": "1",
                        "name": "접수마감일"
                    }
                }
            ]
        }
    }
</script>
</html>
