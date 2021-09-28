<%--
  Created by IntelliJ IDEA.
  User: sn022
  Date: 2021-09-27
  Time: 오후 7:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*" %>
<%
      request.setCharacterEncoding("UTF-8");
      String sName;
      
      String accessKey = "57ZHVpeFbUxqlaVapckledfKUIGL43YL424bfpXt6OfMIWVrcwW"; // 발급받은 accessKey";
      StringBuffer response2 = new StringBuffer();
      try {
            String text = "web";
            String rText = URLEncoder.encode(text, "UTF-8");
            String apiURL = "https://oapi.saramin.co.kr/job-search?access-key="+accessKey+"&keyword="+ rText;
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Accept", "application/json");
            
            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode: "+responseCode);
            if(responseCode==200) { // 정상 호출
                  br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                  br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            String inputLine;
            
            while ((inputLine = br.readLine()) != null) {
                  response2.append(inputLine);
            }
            br.close();
            System.out.println("여기야"+response2);
            sName = new String(response2.toString().getBytes("8859_1"), "utf-8");
            System.out.println("sName : "+sName);
      } catch (Exception e) {
            System.out.println(e);
      }

%>
<html>
      <jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<body>
<div class="main">
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
      <div id ="list-article" class="content scaffold-list recruit-list" role="main">
            <div class="nav" role="navigation">
                  <a class="create btn btn-success btn-wide pull-right" href="/articles/recruit/create"><i class="fa fa-pencil"></i> 구인 등록</a>
            
                  <h4>구인</h4>
                  <form id="category-filter-form" name="category-filter-form" method="get" action="/articles/recruit">
                  </form>
                  <div class="job-filter-container">
                        <div class="job-filter-btns">
                              <div class="job-filter-btn" data-type="position">포지션 및 스킬</div>
                              <div class="job-filter-btn" data-type="pay">급여</div>
                              <div class="job-filter-btn" data-type="location">지역</div>
                              <div class="job-filter-btn" data-type="extra">기타 상세</div>
                        </div>
                        <div class="job-filter-search">
                              <div class="input-group input-group-sm">
                                    <input type="search" name="query" id="search-field" class="form-control" placeholder="검색어" value="">
                                    <span class="input-group-btn">
						<button class="btn btn-default" id="search-btn"><i class="fa fa-search"></i></button>
					</span>
                              </div>
                        </div>
                  </div>
            </div>
            <div style="margin-top: 25px">
                  <div class="panel panel-default recruit-panel">
                        <%--테이블--%>
                              <ul class="list-group" id="joblist">
                              
                              </ul>
                  </div>
            </div>
      </div>
<%--      <div id="job-filter-modal" class="contract">--%>
<%--            <div class="job-filter-modal-container">--%>
<%--                  <div class="job-filter-modal-top">--%>
<%--                        <div class="job-filter-modal-item-title active" data-type="position">포지션 및 스킬</div>--%>
<%--                        <div class="job-filter-modal-item-title" data-type="pay">급여</div>--%>
<%--                        <div class="job-filter-modal-item-title" data-type="location">지역</div>--%>
<%--                        <div class="job-filter-modal-item-title" data-type="extra">기타 상세</div>--%>
<%--                  </div>--%>
<%--                  <div class="job-filter-modal-body">--%>
<%--                        <div class="job-filter-modal-item" data-type="position">--%>
<%--                              <div class="filter-item">--%>
<%--                                    <div class="filter-item-title">포지션</div>--%>
<%--                                    <div class="filter-item-content">--%>
<%--                                          <div class="filter-select-wrapper" data-name="group">--%>
<%--                                                <div class="filter-select active" data-group-id="1" data-value="1">개발</div>--%>
<%--                                                <div class="filter-select" data-group-id="2" data-value="2">기획</div>--%>
<%--                                                <div class="filter-select" data-group-id="3" data-value="3">디자인</div>--%>
<%--                                                <div class="filter-select" data-group-id="4" data-value="4">마케팅</div>--%>
<%--                                                <div class="filter-select" data-group-id="5" data-value="5">기타</div>--%>
<%--                                          </div>--%>
<%--                                          <div class="filter-select-wrapper" data-group="1" data-name="jobDuty">--%>
<%--                                                <div class="filter-select" data-value="35">백엔드개발</div>--%>
<%--                                                <div class="filter-select" data-value="36">프론트엔드개발</div>--%>
<%--                                                <div class="filter-select" data-value="8">모바일개발</div>--%>
<%--                                                <div class="filter-select" data-value="11">풀스택개발</div>--%>
<%--                                                <div class="filter-select" data-value="10">임베디드개발</div>--%>
<%--                                                <div class="filter-select" data-value="37">PC어플리케이션개발</div>--%>
<%--                                                <div class="filter-select" data-value="2">DBA</div>--%>
<%--                                                <div class="filter-select" data-value="38">TA</div>--%>
<%--                                                <div class="filter-select" data-value="39">AA</div>--%>
<%--                                                <div class="filter-select" data-value="13">기타개발</div>--%>
<%--                                                <div class="filter-select" data-value="40">퍼블리셔</div>--%>
<%--                                                <div class="filter-select" data-value="7">QA</div>--%>
<%--                                          </div>--%>
<%--                                          <div class="filter-select-wrapper off" data-group="2" data-name="jobDuty">--%>
<%--                                                <div class="filter-select" data-value="17">전략기획</div>--%>
<%--                                                <div class="filter-select" data-value="18">서비스기획</div>--%>
<%--                                                <div class="filter-select" data-value="19">UI/UX 기획</div>--%>
<%--                                                <div class="filter-select" data-value="20">사업기획</div>--%>
<%--                                                <div class="filter-select" data-value="21">PM</div>--%>
<%--                                          </div>--%>
<%--                                          <div class="filter-select-wrapper off" data-group="3" data-name="jobDuty">--%>
<%--                                                <div class="filter-select" data-value="22">웹디자인</div>--%>
<%--                                                <div class="filter-select" data-value="23">UI 디자인</div>--%>
<%--                                                <div class="filter-select" data-value="24">디자인</div>--%>
<%--                                                <div class="filter-select" data-value="25">모바일디자인</div>--%>
<%--                                                <div class="filter-select" data-value="26">서비스디자인</div>--%>
<%--                                                <div class="filter-select" data-value="27">UX 디자인</div>--%>
<%--                                          </div>--%>
<%--                                          <div class="filter-select-wrapper off" data-group="4" data-name="jobDuty">--%>
<%--                                                <div class="filter-select" data-value="28">영업</div>--%>
<%--                                                <div class="filter-select" data-value="29">마케팅</div>--%>
<%--                                                <div class="filter-select" data-value="30">Growth Hacker</div>--%>
<%--                                                <div class="filter-select" data-value="31">Digital Marketer</div>--%>
<%--                                                <div class="filter-select" data-value="32">전략수석</div>--%>
<%--                                          </div>--%>
<%--                                          <div class="filter-select-wrapper off" data-group="5" data-name="jobDuty">--%>
<%--                                                <div class="filter-select" data-value="33">MD</div>--%>
<%--                                                <div class="filter-select" data-value="34">기타</div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="filter-active-tags"></div>--%>
<%--                              </div>--%>
<%--                              <div class="filter-item">--%>
<%--                                    <div class="filter-item-title">직책</div>--%>
<%--                                    <div class="filter-item-content">--%>
<%--                                          <div class="filter-select-wrapper filter-select-minimize" data-name="rank">--%>
<%--                                                <div class="filter-select" data-value="0">PM</div>--%>
<%--                                                <div class="filter-select" data-value="1">PL</div>--%>
<%--                                                <div class="filter-select" data-value="2">팀장</div>--%>
<%--                                                <div class="filter-select" data-value="3">팀원</div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                              </div>--%>
<%--                              <div class="filter-item">--%>
<%--                                    <div class="filter-item-title">스킬</div>--%>
<%--                                    <div class="filter-item-content">--%>
<%--                                          <input type="text" name="filter.skill" required="required" value="" placeholder="스킬을 입력해주세요." class="form-control tag-input form-dynamic" style="display: none;"><div class="bootstrap-tagsinput"><span class="twitter-typeahead" style="position: relative; display: inline-block;"><input type="text" class="tt-hint" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" dir="ltr" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0);"><span class="twitter-typeahead" style="position: relative; display: inline-block;"><input type="text" class="tt-input tt-hint" autocomplete="off" spellcheck="false" dir="ltr" style="position: absolute; vertical-align: top; background: none 0% 0% / auto repeat scroll padding-box border-box rgba(0, 0, 0, 0); top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1;" readonly="" tabindex="-1"><input type="text" placeholder="스킬을 입력해주세요." class="tt-input" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;"><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><div class="tags-dropdown" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;"></div></span><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, Dotdum; font-size: 14px; font-style: normal; font-variant: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;"><div class="tt-dataset tt-dataset-0"></div></div></span></div>--%>
<%--                                    </div>--%>
<%--                              </div>--%>
<%--                        </div>--%>
<%--                        <div class="job-filter-modal-item off" data-type="pay">--%>
<%--                              <div class="filter-item">--%>
<%--                                    <div class="filter-item-title">최소급여</div>--%>
<%--                                    <div class="filter-item-content flow-wrap">--%>
<%--                                          <div class="filter-select-wrapper" data-name="minPay">--%>
<%--                                                <div class="filter-select" data-value="300">300만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="400">400만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="500">500만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="600">600만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="700">700만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="800">800만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="900">900만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="1000">1000만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="1100">1100만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="1200">1200만 이상</div>--%>
<%--                                                <div class="filter-select" data-value="1300">1300만 이상</div>--%>
<%--                                          </div>--%>
<%--                                          <div class="filter-input-wrapper">--%>
<%--                                                <div class="filter-input-line">--%>
<%--                                                      <input type="checkbox" id="pay-self-checkbox">--%>
<%--                                                      <label for="pay-self-checkbox" style="font-weight: bold">직접입력</label>--%>
<%--                                                </div>--%>
<%--                                                <div class="filter-input-line">--%>
<%--                                                      <input type="number" id="pay-self-input" disabled="" value="">--%>
<%--                                                      <label>만 이상</label>--%>
<%--                                                </div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                              </div>--%>
<%--                        </div>--%>
<%--                        <div class="job-filter-modal-item off" data-type="location">--%>
<%--                              <div class="filter-item">--%>
<%--                                    <div class="filter-item-content">--%>
<%--                                          <div class="filter-select-wrapper" data-name="city">--%>
<%--                                                <div class="filter-select" data-value="">전체</div>--%>
<%--                                                <div class="filter-select" data-value="서울">서울</div>--%>
<%--                                                <div class="filter-select" data-value="부산">부산</div>--%>
<%--                                                <div class="filter-select" data-value="대구">대구</div>--%>
<%--                                                <div class="filter-select" data-value="인천">인천</div>--%>
<%--                                                <div class="filter-select" data-value="광주">광주</div>--%>
<%--                                                <div class="filter-select" data-value="대전">대전</div>--%>
<%--                                                <div class="filter-select" data-value="울산">울산</div>--%>
<%--                                                <div class="filter-select" data-value="세종">세종</div>--%>
<%--                                                <div class="filter-select" data-value="강원">강원</div>--%>
<%--                                                <div class="filter-select" data-value="경기">경기</div>--%>
<%--                                                <div class="filter-select" data-value="경남">경남</div>--%>
<%--                                                <div class="filter-select" data-value="경북">경북</div>--%>
<%--                                                <div class="filter-select" data-value="전남">전남</div>--%>
<%--                                                <div class="filter-select" data-value="전북">전북</div>--%>
<%--                                                <div class="filter-select" data-value="충남">충남</div>--%>
<%--                                                <div class="filter-select" data-value="충북">충북</div>--%>
<%--                                                <div class="filter-select" data-value="제주">제주</div>--%>
<%--                                          </div>--%>
<%--                                          <div class="filter-select-wrapper" data-name="district">--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="filter-active-tags"></div>--%>
<%--                              </div>--%>
<%--                        </div>--%>
<%--                        <div class="job-filter-modal-item off" data-type="extra">--%>
<%--                              <div class="filter-item-wrapper">--%>
<%--                                    <div class="filter-item">--%>
<%--                                          <div class="filter-item-title">경력</div>--%>
<%--                                          <div class="filter-item-content">--%>
<%--                                                <div class="filter-select-wrapper" data-name="minCareer" data-value="">--%>
<%--                                                      <div data-value="99" class="filter-select">무관</div>--%>
<%--                                                      <div data-value="0" class="filter-select">--%>
<%--                                                            신입											</div>--%>
<%--                                                      <div data-value="1" class="filter-select">--%>
<%--                                                            1년 이상											</div>--%>
<%--                                                      <div data-value="2" class="filter-select">--%>
<%--                                                            2년 이상											</div>--%>
<%--                                                      <div data-value="3" class="filter-select">--%>
<%--                                                            3년 이상											</div>--%>
<%--                                                      <div data-value="4" class="filter-select">--%>
<%--                                                            4년 이상											</div>--%>
<%--                                                      <div data-value="5" class="filter-select">--%>
<%--                                                            5년 이상											</div>--%>
<%--                                                      <div data-value="6" class="filter-select">--%>
<%--                                                            6년 이상											</div>--%>
<%--                                                      <div data-value="7" class="filter-select">--%>
<%--                                                            7년 이상											</div>--%>
<%--                                                      <div data-value="8" class="filter-select">--%>
<%--                                                            8년 이상											</div>--%>
<%--                                                      <div data-value="9" class="filter-select">--%>
<%--                                                            9년 이상											</div>--%>
<%--                                                      <div data-value="10" class="filter-select">--%>
<%--                                                            10년 이상											</div>--%>
<%--                                                      <div data-value="11" class="filter-select">--%>
<%--                                                            11년 이상											</div>--%>
<%--                                                      <div data-value="12" class="filter-select">--%>
<%--                                                            12년 이상											</div>--%>
<%--                                                      <div data-value="13" class="filter-select">--%>
<%--                                                            13년 이상											</div>--%>
<%--                                                      <div data-value="14" class="filter-select">--%>
<%--                                                            14년 이상											</div>--%>
<%--                                                      <div data-value="15" class="filter-select">--%>
<%--                                                            15년 이상											</div>--%>
<%--                                                </div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="filter-item">--%>
<%--                                          <div class="filter-item-title">학력</div>--%>
<%--                                          <div class="filter-item-content">--%>
<%--                                                <div class="filter-select-wrapper" data-name="academicBackground">--%>
<%--                                                      <div data-value="1" class="filter-select">--%>
<%--                                                            무관											</div>--%>
<%--                                                      <div data-value="2" class="filter-select">--%>
<%--                                                            고졸 이상											</div>--%>
<%--                                                      <div data-value="3" class="filter-select">--%>
<%--                                                            전문학사 이상											</div>--%>
<%--                                                      <div data-value="4" class="filter-select">--%>
<%--                                                            학사 이상											</div>--%>
<%--                                                      <div data-value="5" class="filter-select">--%>
<%--                                                            석사 이상											</div>--%>
<%--                                                      <div data-value="6" class="filter-select">--%>
<%--                                                            박사 이상											</div>--%>
<%--                                                </div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                              </div>--%>
<%--                              <div class="filter-item-wrapper">--%>
<%--                                    <div class="filter-item">--%>
<%--                                          <div class="filter-item-title">근무시작일</div>--%>
<%--                                          <div class="filter-item-content">--%>
<%--                                                <div class="filter-select-wrapper" data-name="startDate">--%>
<%--                                                      <div class="filter-select" data-value="0">2주 이내</div>--%>
<%--                                                      <div class="filter-select" data-value="1">1개월 이내</div>--%>
<%--                                                      <div class="filter-select" data-value="2">2개월 이내</div>--%>
<%--                                                      <div class="filter-select" data-value="3">3개월 이내</div>--%>
<%--                                                </div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="filter-item">--%>
<%--                                          <div class="filter-item-title">근무방식</div>--%>
<%--                                          <div class="filter-item-content">--%>
<%--                                                <div class="filter-select-wrapper" data-name="workingCondition">--%>
<%--                                                      <div data-value="1" class="filter-select">--%>
<%--                                                            상근											</div>--%>
<%--                                                      <div data-value="3" class="filter-select">--%>
<%--                                                            재택											</div>--%>
<%--                                                      <div data-value="4" class="filter-select">--%>
<%--                                                            협의											</div>--%>
<%--                                                </div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                              </div>--%>
<%--                              <div class="filter-item-wrapper">--%>
<%--                                    <div class="filter-item">--%>
<%--                                          <div class="filter-item-title">업무방식</div>--%>
<%--                                          <div class="filter-item-content">--%>
<%--                                                <div class="filter-select-wrapper" data-name="workType">--%>
<%--                                                      <div class="filter-select" data-value="0">SI</div>--%>
<%--                                                      <div class="filter-select" data-value="1">SM</div>--%>
<%--                                                      <div class="filter-select" data-value="2">SI 이후 SM 진행</div>--%>
<%--                                                </div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="filter-item">--%>
<%--                                          <div class="filter-item-title">분야</div>--%>
<%--                                          <div class="filter-item-content">--%>
<%--                                                <div class="filter-select-wrapper" data-name="businessField">--%>
<%--                                                      <div data-value="0" class="filter-select">--%>
<%--                                                            금융 											</div>--%>
<%--                                                      <div data-value="1" class="filter-select">--%>
<%--                                                            제조 											</div>--%>
<%--                                                      <div data-value="2" class="filter-select">--%>
<%--                                                            공공 											</div>--%>
<%--                                                      <div data-value="3" class="filter-select">--%>
<%--                                                            인터넷 / 서비스 											</div>--%>
<%--                                                      <div data-value="4" class="filter-select">--%>
<%--                                                            커머스 / 쇼핑 											</div>--%>
<%--                                                      <div data-value="5" class="filter-select">--%>
<%--                                                            통신 											</div>--%>
<%--                                                      <div data-value="6" class="filter-select">--%>
<%--                                                            게임 											</div>--%>
<%--                                                      <div data-value="7" class="filter-select">--%>
<%--                                                            유통 											</div>--%>
<%--                                                      <div data-value="8" class="filter-select">--%>
<%--                                                            물류 											</div>--%>
<%--                                                      <div data-value="9" class="filter-select">--%>
<%--                                                            교육											</div>--%>
<%--                                                      <div data-value="10" class="filter-select">--%>
<%--                                                            의료 											</div>--%>
<%--                                                      <div data-value="11" class="filter-select">--%>
<%--                                                            방송											</div>--%>
<%--                                                </div>--%>
<%--                                          </div>--%>
<%--                                    </div>--%>
<%--                              </div>--%>
<%--                        </div>--%>
<%--                  </div>--%>
<%--                  <div class="job-filter-modal-bottom">--%>
<%--                        <div id="job-filter-modal-reset"><i class="fa fa-repeat" aria-hidden="true"></i>&nbsp;선택초기화</div>--%>
<%--                        <div id="job-filter-modal-confirm">검 색</div>--%>
<%--                  </div>--%>
<%--                  <div class="job-filter-close-btn"><i class="fa fa-times" aria-hidden="true" style="color:#8A8A8A;"></i></div>--%>
<%--            </div>--%>
<%--      </div>--%>
      <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</div>
</body>

<script src="/assets/js/application.js"></script>
</html>