<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/common/okky-head.jsp"/>
<body>
<div class="main">
      <jsp:include page="/WEB-INF/common/okky-aside.jsp"></jsp:include>
      <!----------------------------------------------------------------------------------------------->
      <%-- jobs의 세부카테고리 표기 nav
          <div class="sidebar-category-nav">
              <h3 class="sub-title">Jobs</h3>
              <ul class="nav">
                  <li>
                      <a href="/articles/recruit?filter.jobType=CONTRACT">구인 <span
                              class="label label-primary label">계약직</span><span class="nav-indicator"><span
                              class="nav-selected-dot"></span></span></a>
                      <a href="/articles/recruit?filter.jobType=FULLTIME">구인 <span
                              class="label label-success label">정규직</span><span class="nav-indicator"><span
                              class="nav-selected-dot"></span></span></a>
                  </li>
                  <li><a href="/articles/resumes" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">구직</span>
                      <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
              </ul>
          </div>--%>
      <div id="list-article" class="content scaffold-list recruit-list" role="main">
            <div class="nav" role="navigation">
                  <a class="create btn btn-success btn-wide pull-right" href="/articles/recruit/create">
                        <i class="fa fa-pencil"></i> 구인 등록</a>
                  
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
                                    <input type="search" name="query" id="search-field" class="form-control" placeholder="검색어"
                                           value=""/>
                                    <span class="input-group-btn">
						<button class="btn btn-default" id="search-btn"><i class="fa fa-search"></i></button>
					</span>
                              </div>
                        </div>
                  </div>
            </div>
            
            <!-- 공지사항 start -->
            <div class="okkys-choice">
                  <div class="panel panel-default">
                        <!-- Table -->
                        <ul class="list-group">
                              <li class="list-group-item list-group-item-question list-group-has-note clearfix">
                                    
                                    
                                    <div class="list-title-wrapper clearfix">
                                          <div class="list-tag clearfix">
                                                <span class="list-group-item-text article-id">#524319</span>
                                                <a href="/articles/notice" class="list-group-item-text item-tag label label-info"><i
                                                        class="fa fa-comments"></i> 공지사항</a>
                                                
                                                
                                                <a href="/articles/tagged/OKKY"
                                                   class="list-group-item-text item-tag label label-gray ">OKKY</a>
                                                <a href="/articles/tagged/%EA%B5%AC%EC%9D%B8"
                                                   class="list-group-item-text item-tag label label-gray ">구인</a>
                                                <a href="/articles/tagged/Jobs"
                                                   class="list-group-item-text item-tag label label-gray ">Jobs</a>
                                                <a href="/articles/tagged/%ED%9A%8C%EC%82%AC"
                                                   class="list-group-item-text item-tag label label-gray ">회사</a>
                                                <a href="/articles/tagged/%EB%93%B1%EB%A1%9D"
                                                   class="list-group-item-text item-tag label label-gray ">등록</a>
                                          </div>
                                          
                                          <h5 class="list-group-item-heading list-group-item-evaluate">
                                                <a href="/article/524319">
                                                      OKKY 구인 게시물 관련 공지사항
                                                </a>
                                          </h5>
                                    </div>
                                    
                                    <div class="list-summary-wrapper clearfix">
                                          <div class="list-group-item-summary clearfix">
                                                <ul>
                                                      <li class=""><i class="item-icon fa fa-comment "></i> 4</li>
                                                      <li class="">
                                                            <i class="item-icon fa fa-thumbs-up"></i> 4
                                                      </li>
                                                      <li class=""><i class="item-icon fa fa-eye"></i> 36k</li>
                                                </ul>
                                          </div>
                                    
                                    </div>
                                    
                                    <div class="list-group-item-author clearfix">
                                          
                                          
                                          <div class="avatar clearfix avatar-list ">
                                                <a href="/user/info/45597" class='avatar-photo'><img
                                                        src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30"/></a>
                                                <div class="avatar-info">
                                                      <a class="nickname" href="/user/info/45597" title="OKKY">OKKY</a>
                                                      <div class="activity"><span class="fa fa-flash"></span> 2k</div>
                                                      <div class="date-created">
                                                            <span class="timeago" title="2018-11-22T14:15:18">2018-11-22 14:15:18</span>
                                                      </div>
                                                </div>
                                          </div>
                                    </div>
                              </li>
                        </ul>
                  </div>
            </div>
            <!-- 공지사항 end -->
            
            <div class="okkys-choice">
                  <div class="panel panel-default recruit-panel">
                        
                        
                        <ul class="list-group">
                              <!-- Table -->
                              <li class="list-group-item-flex contract" id="list-group-items" style="display:none;">
                                    <div class="list-title-wrapper-flex">
                                          <div class="list-position-info">
                                                <div class="list-position-info-box list-position-info-title">
                                                      <a class="title-link" href="/recruit/1055976">
                                                            <span class="position">근무지역 미정</span>
                                                            <span class="project">공고제목</span>
                                                      </a>
                                                </div>
                                                <div class="list-position-info-wrapper">
                                                      <div class="list-position-info-box">
                                                            <div class="list-position-info-item">
                                                                  <i class="fa fa-krw" aria-hidden="true"></i>
                                                                  <target class="salary-name">연봉 미정</target>
                                                            </div>
                                                            <div class="list-position-info-item">
                                                                  <i class="fa fa-graduation-cap" aria-hidden="true"></i>
                                                                  <target class="required-education-level-name">학력조건 미정</target>
                                                            </div>
                                                      </div>
                                                      <div class="list-position-info-box">
                                                            <div class="list-position-info-item">
                                                                  <i class="fa fa-briefcase" aria-hidden="true"></i>
                                                                  <target class="experience-level-name">경력조건 미정</target>
                                                            </div>
                                                            <div class="list-position-info-item">
                                                                  <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                                  <target class="job-type-name">근무형태 미정</target>
                                                            </div>
                                                      </div>
                                                      <div class="list-position-info-box">
                                                            <div class="list-position-info-item">
                                                                  <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                                  <target class="location-name">근무지역 미정</target>
                                                            </div>
                                                            <div class="list-position-info-item">
                                                                  <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                                                  <target class="expiration-timestamp">마감일자 미정</target>
                                                            </div>
                                                      </div>
                                                </div>
                                          </div>
                                    </div>
                                    <div class="list-company-info">
                                          <a href="/company/info/173" class="avatar-photo avatar-company">
                                                <img src="//file.okky.kr/logo/1500253256111.png">
                                          </a>
                                          <a class="company-nickname nickname" href="/company/info/173">회사명 비공개</a>
                                    </div>
                              </li>
                        </ul>
                  
                  </div>
                  
                  <div class="text-center">
                  
                  
                  </div>
            </div>
            
            <!-- 모달창 start-->
            <div id="job-filter-modal" class="contract off">
                  <div class="job-filter-modal-container">
                        <div class="job-filter-modal-top">
                              <div class="job-filter-modal-item-title" data-type="position">포지션 및 스킬</div>
                              <div class="job-filter-modal-item-title" data-type="pay">급여</div>
                              <div class="job-filter-modal-item-title" data-type="location">지역</div>
                              <div class="job-filter-modal-item-title" data-type="extra">기타 상세</div>
                        </div>
                        <div class="job-filter-modal-body">
                              
                              <div class="job-filter-modal-item active" data-type="position">
                                    <div class="filter-item">
                                          <div class="filter-item-title">포지션</div>
                                          <div class="filter-item-content">
                                                <div class="filter-select-wrapper" data-name="group">
                                                      <div class="filter-select" data-group-id="1" data-value="1">개발</div>
                                                      <div class="filter-select" data-group-id="2" data-value="2">기획</div>
                                                      <div class="filter-select" data-group-id="3" data-value="3">디자인</div>
                                                      <div class="filter-select" data-group-id="4" data-value="4">마케팅</div>
                                                      <div class="filter-select" data-group-id="5" data-value="5">기타</div>
                                                </div>
                                                <div class="filter-select-wrapper" data-group="1" data-name="jobDuty">
                                                      <div class="filter-select" data-value="35">백엔드개발</div>
                                                      <div class="filter-select" data-value="36">프론트엔드개발</div>
                                                      <div class="filter-select" data-value="8">모바일개발</div>
                                                      <div class="filter-select" data-value="11">풀스택개발</div>
                                                      <div class="filter-select" data-value="10">임베디드개발</div>
                                                      <div class="filter-select" data-value="37">PC어플리케이션개발</div>
                                                      <div class="filter-select" data-value="2">DBA</div>
                                                      <div class="filter-select" data-value="38">TA</div>
                                                      <div class="filter-select" data-value="39">AA</div>
                                                      <div class="filter-select" data-value="13">기타개발</div>
                                                      <div class="filter-select" data-value="40">퍼블리셔</div>
                                                      <div class="filter-select" data-value="7">QA</div>
                                                </div>
                                                <div class="filter-select-wrapper off" data-group="2" data-name="jobDuty">
                                                      <div class="filter-select" data-value="17">전략기획</div>
                                                      <div class="filter-select" data-value="18">서비스기획</div>
                                                      <div class="filter-select" data-value="19">UI/UX 기획</div>
                                                      <div class="filter-select" data-value="20">사업기획</div>
                                                      <div class="filter-select" data-value="21">PM</div>
                                                </div>
                                                <div class="filter-select-wrapper off" data-group="3" data-name="jobDuty">
                                                      <div class="filter-select" data-value="22">웹디자인</div>
                                                      <div class="filter-select" data-value="23">UI 디자인</div>
                                                      <div class="filter-select" data-value="24">디자인</div>
                                                      <div class="filter-select" data-value="25">모바일디자인</div>
                                                      <div class="filter-select" data-value="26">서비스디자인</div>
                                                      <div class="filter-select" data-value="27">UX 디자인</div>
                                                </div>
                                                <div class="filter-select-wrapper off" data-group="4" data-name="jobDuty">
                                                      <div class="filter-select" data-value="28">영업</div>
                                                      <div class="filter-select" data-value="29">마케팅</div>
                                                      <div class="filter-select" data-value="30">Growth Hacker</div>
                                                      <div class="filter-select" data-value="31">Digital Marketer</div>
                                                      <div class="filter-select" data-value="32">전략수석</div>
                                                </div>
                                                <div class="filter-select-wrapper off" data-group="5" data-name="jobDuty">
                                                      <div class="filter-select" data-value="33">MD</div>
                                                      <div class="filter-select" data-value="34">기타</div>
                                                </div>
                                          </div>
                                          <div class="filter-active-tags"></div>
                                    </div>
                                    
                                    <!--삭제-->
                                    <div class="filter-item">
                                          <div class="filter-item-title">직책</div>
                                          <div class="filter-item-content">
                                                <div class="filter-select-wrapper filter-select-minimize" data-name="rank">
                                                      <div class="filter-select" data-value="0">PM</div>
                                                      <div class="filter-select" data-value="1">PL</div>
                                                      <div class="filter-select" data-value="2">팀장</div>
                                                      <div class="filter-select" data-value="3">팀원</div>
                                                </div>
                                          </div>
                                    </div>
                                    <div class="filter-item">
                                          <div class="filter-item-title">스킬</div> <!--가능할지도.. -->
                                          <div class="filter-item-content">
                                                <input type="text" name="filter.skill" required="required" value=""
                                                       placeholder="스킬을 입력해주세요." class="form-control tag-input form-dynamic">
                                          </div>
                                    </div>
                              </div>
                              <!--삭제-->
                              
                              <!-- 연봉조건 -->
                              <div class="job-filter-modal-item off" data-type="pay">
                                    <div class="filter-item">
                                          <div class="filter-item-title">최소연봉</div>
                                          <div class="filte-item-content flow-wrap">
                                                <div class="filter-select-wrapper" data-name="minPay">
                                                      <div class="filter-select" data-value="300">300만 이상</div>
                                                      <div class="filter-select" data-value="400">400만 이상</div>
                                                      <div class="filter-select" data-value="500">500만 이상</div>
                                                      <div class="filter-select" data-value="600">600만 이상</div>
                                                      <div class="filter-select" data-value="700">700만 이상</div>
                                                      <div class="filter-select" data-value="800">800만 이상</div>
                                                      <div class="filter-select" data-value="900">900만 이상</div>
                                                      <div class="filter-select" data-value="1000">1000만 이상</div>
                                                      <div class="filter-select" data-value="1100">1100만 이상</div>
                                                      <div class="filter-select" data-value="1200">1200만 이상</div>
                                                      <div class="filter-select" data-value="1300">1300만 이상</div>
                                                </div>
                                                <div class="filter-input-wrapper">
                                                      <div class="filter-input-line">
                                                            <input type="checkbox" id="pay-self-checkbox">
                                                            <label for="pay-self-checkbox" style="font-weight: bold">직접입력</label>
                                                      </div>
                                                      <div class="filter-input-line">
                                                            <input type="number" id="pay-self-input" disabled value="">
                                                            <label>만 이상</label>
                                                      </div>
                                                </div>
                                          </div>
                                    </div>
                              </div>
                              
                              <!-- 근무지역 -->
                              <div class="job-filter-modal-item off" data-type="location">
                                    <div class="filter-item">
                                          <div class="filter-item-content">
                                                <div class="filter-select-wrapper" data-name="city">
                                                      <div class="filter-select" data-value="">전체</div>
                                                      <div class="filter-select" data-value="서울">서울</div>
                                                      <div class="filter-select" data-value="부산">부산</div>
                                                      <div class="filter-select" data-value="대구">대구</div>
                                                      <div class="filter-select" data-value="인천">인천</div>
                                                      <div class="filter-select" data-value="광주">광주</div>
                                                      <div class="filter-select" data-value="대전">대전</div>
                                                      <div class="filter-select" data-value="울산">울산</div>
                                                      <div class="filter-select" data-value="세종">세종</div>
                                                      <div class="filter-select" data-value="강원">강원</div>
                                                      <div class="filter-select" data-value="경기">경기</div>
                                                      <div class="filter-select" data-value="경남">경남</div>
                                                      <div class="filter-select" data-value="경북">경북</div>
                                                      <div class="filter-select" data-value="전남">전남</div>
                                                      <div class="filter-select" data-value="전북">전북</div>
                                                      <div class="filter-select" data-value="충남">충남</div>
                                                      <div class="filter-select" data-value="충북">충북</div>
                                                      <div class="filter-select" data-value="제주">제주</div>
                                                </div>
                                                <div class="filter-select-wrapper" data-name="district">
                                                </div>
                                          </div>
                                          <div class="filter-active-tags"></div>
                                    </div>
                              </div>
                              
                              <!-- 경력조건 -->
                              <div class="job-filter-modal-item off" data-type="extra">
                                    <div class="filter-item-wrapper">
                                          <div class="filter-item">
                                                <div class="filter-item-title">경력</div>
                                                <div class="filter-item-content">
                                                      <div class="filter-select-wrapper" data-name="minCareer" data-value="">
                                                            <div data-value="99" class="filter-select">무관</div>
                                                            <div data-value="0" class="filter-select">
                                                                  신입
                                                            </div>
                                                            <div data-value="1" class="filter-select">
                                                                  1년 이상
                                                            </div>
                                                            <div data-value="2" class="filter-select">
                                                                  2년 이상
                                                            </div>
                                                            <div data-value="3" class="filter-select">
                                                                  3년 이상
                                                            </div>
                                                            <div data-value="4" class="filter-select">
                                                                  4년 이상
                                                            </div>
                                                            <div data-value="5" class="filter-select">
                                                                  5년 이상
                                                            </div>
                                                            <div data-value="6" class="filter-select">
                                                                  6년 이상
                                                            </div>
                                                            <div data-value="7" class="filter-select">
                                                                  7년 이상
                                                            </div>
                                                            <div data-value="8" class="filter-select">
                                                                  8년 이상
                                                            </div>
                                                            <div data-value="9" class="filter-select">
                                                                  9년 이상
                                                            </div>
                                                            <div data-value="10" class="filter-select">
                                                                  10년 이상
                                                            </div>
                                                            <div data-value="11" class="filter-select">
                                                                  11년 이상
                                                            </div>
                                                            <div data-value="12" class="filter-select">
                                                                  12년 이상
                                                            </div>
                                                            <div data-value="13" class="filter-select">
                                                                  13년 이상
                                                            </div>
                                                            <div data-value="14" class="filter-select">
                                                                  14년 이상
                                                            </div>
                                                            <div data-value="15" class="filter-select">
                                                                  15년 이상
                                                            </div>
                                                      </div>
                                                </div>
                                          </div>
                                          
                                          <!-- 학력조건 -->
                                          <div class="filter-item">
                                                <div class="filter-item-title">학력</div>
                                                <div class="filter-item-content">
                                                      <div class="filter-select-wrapper" data-name="academicBackground">
                                                            <div data-value="1" class="filter-select">
                                                                  무관
                                                            </div>
                                                            <div data-value="2" class="filter-select">
                                                                  고졸 이상
                                                            </div>
                                                            <div data-value="3" class="filter-select">
                                                                  전문학사 이상
                                                            </div>
                                                            <div data-value="4" class="filter-select">
                                                                  학사 이상
                                                            </div>
                                                            <div data-value="5" class="filter-select">
                                                                  석사 이상
                                                            </div>
                                                            <div data-value="6" class="filter-select">
                                                                  박사 이상
                                                            </div>
                                                      </div>
                                                </div>
                                          </div>
                                    </div>
                                    
                                    <!-- 근무조건 -->
                                    <div class="filter-item-wrapper">
                                          
                                          <div class="filter-item">
                                                <div class="filter-item-title">근무시작일</div>
                                                <div class="filter-item-content">
                                                      <div class="filter-select-wrapper" data-name="startDate">
                                                            <div class="filter-select" data-value="0">2주 이내</div>
                                                            <div class="filter-select" data-value="1">1개월 이내</div>
                                                            <div class="filter-select" data-value="2">2개월 이내</div>
                                                            <div class="filter-select" data-value="3">3개월 이내</div>
                                                      </div>
                                                </div>
                                          </div>
                                          
                                          <div class="filter-item">
                                                <div class="filter-item-title">근무방식</div> <!--계약프리그런거가능 -->
                                                <div class="filter-item-content">
                                                      <div class="filter-select-wrapper" data-name="workingCondition">
                                                            <div data-value="1" class="filter-select">
                                                                  상근
                                                            </div>
                                                            <div data-value="3" class="filter-select">
                                                                  재택
                                                            </div>
                                                            <div data-value="4" class="filter-select">
                                                                  협의
                                                            </div>
                                                      </div>
                                                </div>
                                          </div>
                                    </div>
                                    
                                    <div class="filter-item-wrapper">
                                          
                                          <div class="filter-item">
                                                <div class="filter-item-title">업무방식</div>
                                                <div class="filter-item-content">
                                                      <div class="filter-select-wrapper" data-name="workType">
                                                            <div class="filter-select" data-value="0">SI</div>
                                                            <div class="filter-select" data-value="1">SM</div>
                                                            <div class="filter-select" data-value="2">SI 이후 SM 진행</div>
                                                      </div>
                                                </div>
                                          </div>
                                          
                                          <div class="filter-item">
                                                <div class="filter-item-title">분야</div>
                                                <div class="filter-item-content">
                                                      <div class="filter-select-wrapper" data-name="businessField">
                                                            <div data-value="0" class="filter-select">
                                                                  금융
                                                            </div>
                                                            <div data-value="1" class="filter-select">
                                                                  제조
                                                            </div>
                                                            <div data-value="2" class="filter-select">
                                                                  공공
                                                            </div>
                                                            <div data-value="3" class="filter-select">
                                                                  인터넷 / 서비스
                                                            </div>
                                                            <div data-value="4" class="filter-select">
                                                                  커머스 / 쇼핑
                                                            </div>
                                                            <div data-value="5" class="filter-select">
                                                                  통신
                                                            </div>
                                                            <div data-value="6" class="filter-select">
                                                                  게임
                                                            </div>
                                                            <div data-value="7" class="filter-select">
                                                                  유통
                                                            </div>
                                                            <div data-value="8" class="filter-select">
                                                                  물류
                                                            </div>
                                                            <div data-value="9" class="filter-select">
                                                                  교육
                                                            </div>
                                                            <div data-value="10" class="filter-select">
                                                                  의료
                                                            </div>
                                                            <div data-value="11" class="filter-select">
                                                                  방송
                                                            </div>
                                                      </div>
                                                </div>
                                          </div>
                                    </div>
                              </div>
                        </div>
                        <div class="job-filter-modal-bottom">
                              <div id="job-filter-modal-reset"><i class="fa fa-repeat" aria-hidden="true"></i>&nbsp;선택초기화
                              </div>
                              <div id="job-filter-modal-confirm">검 색</div>
                        </div>
                        <div class="job-filter-close-btn">
                              <i class="fa fa-times" aria-hidden="true" style="color:#8A8A8A;"></i>
                        </div>
                  </div>
            </div>
      
      </div>
      <!----------------------------------------------------------------------------------------------->
      <jsp:include page="/WEB-INF/common/okky-footer.jsp"></jsp:include>
</div>
</body>
<script>
     var contextPath = "";
     var encodedURL = "%2Farticles%2Fquestions";
</script>
<script src="assets/js/application.js" type="text/javascript"></script>
<script src="assets/js/search.js" type="text/javascript"></script>
<script>
     $(function() {
          $('.category-sort-link').click(function(e) {
               $('#category-sort-input').val($(this).data('sort'));
               $('#category-order-input').val($(this).data('order'));
               e.preventDefault();
               $('#category-filter-form')[0].submit();
          });
     });
</script>
<script type="text/javascript">
     $(function() {
          $.ajax({
               url: 'http://localhost:8090/OkkyClone_war_exploded/jobData.do', //json데이터 주소
               type: 'get',
               dataType: 'json',
               success: function(data) {
                    //data길이만큼 돌면서 list를 출력하는 함수
                    $.each(data, function(index, obj) {
                         for (let i = 1; i < obj.job.length; i++) {
//TODO 중복 제거 - data.jobs.job[0]
                              $(".list-group").append($('#list-group-items').attr('style', ('display:""'))); //list 생성
                              $('#list-group-items:eq(0)').attr('style', ('display:none')); //첫번째 공고 숨김
                              
                              $('.title-link:eq(' + i + ')').attr('href', (data.jobs.job[i]["url"])); //타이틀 링크 변경
                              $('.position:eq(' + i + ')').
                                   text((data.jobs.job[i].position["location"].name).replace("&gt;", ">")); //지역
                              $('.project:eq(' + i + ')').text(data.jobs.job[i].position["title"]); //공고제목
                              $('.salary-name:eq(' + i + ')').text(data.jobs.job[i]["salary"].name); //연봉
                              $('.required-education-level-name:eq(' + i + ')').
                                   text(data.jobs.job[i].position["required-education-level"].name); //학력
                              $('.experience-level-name:eq(' + i + ')').
                                   text(data.jobs.job[i].position["experience-level"].name); //경력
                              $('.location-name:eq(' + i + ')').
                                   text((data.jobs.job[i].position["location"].name).replace("&gt;", ">")); //지역
                              $('.job-type-name:eq(' + i + ')').text(data.jobs.job[i].position["job-type"].name); //근무형태
                              let deadline = new Date((data.jobs.job[i]['expiration-timestamp']) * 1000);
                              $('.expiration-timestamp:eq(' + i + ')').text('마감일   ' + deadline.toLocaleDateString()); //마감일
                              $('.list-company-info:eq(' + i + ') a').
                                   attr('href', (data.jobs.job[i].company["detail"].href)) //회사 링크 변경
                              $('.company-nickname:eq(' + i + ')').text((data.jobs.job[i].company["detail"].name)) //회사명 변경
                         }
                         ;
                    });
                    
               }
          });
     });
     
     //모달창
     
     $(".job-filter-btn").click(function() {
          $("#job-filter-modal").prop('class', ('contract'));
          
          $("div").click(function(event) {
               let thisEle = $(event.target);
               // if(thisEle.attr('class') === "job-filter-modal-item-title"){
               //     thisEle.attr('class', 'job-filter-modal-item-title active');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // }
               // else if(thisEle.attr('class') === "job-filter-modal-item off"){
               //     thisEle.attr('class', 'job-filter-modal-item');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // }else if(thisEle.attr('class') === "filter-select-wrapper off"){
               //     thisEle.attr('class', 'filter-select-wrapper');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // }else if(thisEle.attr('class') === "filter-select"){
               //     thisEle.attr('class', 'filter-select active');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // } else if(thisEle.attr('class') === "job-filter-modal-item-title active"){
               //     thisEle.attr('class', 'job-filter-modal-item-title');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // }else if(thisEle.attr('class') === "job-filter-modal-item"){
               //     thisEle.attr('class', 'job-filter-modal-item off');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // }else if(thisEle.attr('class') === "filter-select-wrapper"){
               //     thisEle.attr('class', 'filter-select-wrapper off');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // }else if(thisEle.attr('class') === "filter-select active"){
               //     thisEle.attr('class', 'filter-select');
               //     console.log(thisEle.attr('class'));
               //     return false;
               // }
               switch (thisEle.prop('class')) {
                    case "job-filter-modal-item-title":
                         thisEle.prop('class', 'job-filter-modal-item-title active');
                         console.log('1' + thisEle.prop('class'));
                         break;
                    case "job-filter-modal-item off":
                         thisEle.prop('class', 'job-filter-modal-item');
                         console.log('2' + thisEle.prop('class'));
                         break;
                    case "filter-select-wrapper off":
                         thisEle.prop('class', 'filter-select-wrapper');
                         console.log('3' + thisEle.prop('class'));
                         break;
                    case "filter-select":
                         thisEle.prop('class', 'filter-select active');
                         console.log('4' + thisEle.prop('class'));
                         break;
                    case "job-filter-modal-item-title active":
                         thisEle.prop('class', 'job-filter-modal-item-title');
                         console.log('5' + thisEle.prop('class'));
                         break;
                    case "job-filter-modal-item":
                         thisEle.prop('class', 'job-filter-modal-item off');
                         console.log('6' + thisEle.prop('class'));
                         break;
                    case "filter-select-wrapper":
                         thisEle.prop('class', 'filter-select-wrapper off');
                         console.log('7' + thisEle.prop('class'));
                         break;
                    case "filter-select active":
                         thisEle.prop('class', 'filter-select');
                         console.log('8' + thisEle.prop('class'));
                         break;
               }
               ;
          });
          
          // $("div").click(function(event){
          //     let thisEle = $(event.target);
          //
          //     // if(thisEle.attr('class') === "job-filter-modal-item-title"){
          //     //     thisEle.attr('class', 'job-filter-modal-item-title active');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // }
          //     // else if(thisEle.attr('class') === "job-filter-modal-item off"){
          //     //     thisEle.attr('class', 'job-filter-modal-item');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // }else if(thisEle.attr('class') === "filter-select-wrapper off"){
          //     //     thisEle.attr('class', 'filter-select-wrapper');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // }else if(thisEle.attr('class') === "filter-select"){
          //     //     thisEle.attr('class', 'filter-select active');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // } else if(thisEle.attr('class') === "job-filter-modal-item-title active"){
          //     //     thisEle.attr('class', 'job-filter-modal-item-title');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // }else if(thisEle.attr('class') === "job-filter-modal-item"){
          //     //     thisEle.attr('class', 'job-filter-modal-item off');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // }else if(thisEle.attr('class') === "filter-select-wrapper"){
          //     //     thisEle.attr('class', 'filter-select-wrapper off');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // }else if(thisEle.attr('class') === "filter-select active"){
          //     //     thisEle.attr('class', 'filter-select');
          //     //     console.log(thisEle.attr('class'));
          //     //     return false;
          //     // }
          //
          //     switch (thisEle.attr('class')){
          //         // case "job-filter-modal-item-title": thisEle.prop('class', 'job-filter-modal-item-title active'); console.log('1' + thisEle.prop('class'));
          //         //     break;
          //         // case "job-filter-modal-item off": thisEle.prop('class', 'job-filter-modal-item'); console.log('2' +thisEle.prop('class'));
          //         //     break;
          //         // case "filter-select-wrapper off": thisEle.prop('class', 'filter-select-wrapper'); console.log('3' +thisEle.prop('class'));
          //         //     break;
          //         // case "filter-select": thisEle.prop('class', 'filter-select active'); console.log('4' +thisEle.prop('class'));
          //         //     break;
          //         case "job-filter-modal-item-title active": thisEle.prop('class', 'job-filter-modal-item-title'); console.log('5' +thisEle.prop('class'));
          //             break;
          //         case "job-filter-modal-item": thisEle.prop('class', 'job-filter-modal-item off'); console.log('6' +thisEle.prop('class'));
          //             break;
          //         case "filter-select-wrapper": thisEle.prop('class', 'filter-select-wrapper off'); console.log('7' +thisEle.prop('class'));
          //             break;
          //         case "filter-select active": thisEle.prop('class', 'filter-select'); console.log('8' +thisEle.prop('class'));
          //             break;
          //     };
          // });
          
          // $(".job-filter-close-btn").click(function () {
          //     $("#job-filter-modal").prop('class', ('contract off'));
          // });
     });
     //1. 이벤트 발생객체가 ~~라면 ~~ 실행 2. 해당 이벤트 발생 후 추가 이벤트 발생 객체가~~라면 ~~실행
     
     // console.log($('.job-filter-modal-item-title').data('type'));
     // console.log($('.job-filter-modal-item-title').data('type').attr("class"));
</script>


}
});

});
</script>

</html>

