# OKKY-Clone-Web-Project

### 프로젝트 주제

> OKKY(개발자 커뮤니티 사이트) clone📝

## 0.

* 기술 스택<br>
  Web Server: Apache Tomcat 9.0<br>
  Database: Oracle 11g <br>
  Backend: Java, Servlet 4.0<br>
  Frontend: Bootstrap, Javascript, css3, html5, jQuery<br>
* 프로젝트 기간 : 2021. 9.26 ~ 2021.10.6
* 프로젝트 참여 인원 : 5인

## 1. 주요 기능

>

- 회원 가입 & 로그인 기능
- 게시판, 댓글 CRUD
- 위치기반 스터디 분류 기능
- 외부 API(사람인) JSON 데이터 필터링에 따라 리스트 동적생성 

## 2. 요구되는 페이지

>

- **메인 페이지**
  <br>
    1. Best 게시글 
    2. 공채 속보
    3. Q&A 게시판 최신 게시글 
    4. 스터디 게시판 최신 게시글 
    5. 칼럼 게시판 인기 게시글 
    6. API(geolication) 접속 위치 기반의 스터디 추천
 <br>
- **회원가입 페이지 & 로그인 페이지**
<br>
- **마이페이지**<br>
    1. 내가 작성한 게시물 리스트 
<br>
- **마이페이지-정보수정**<br>
  1. 닉네임 변경 
  2. 이메일주소(메일 인증)
  3. 비밀번호 변경, 회원탈퇴 
<br>
- **스터디 게시판**<br>
  지역, 유형, 경력, 마감 여부에 따른 글 작성이 가능하다. 페이징, 게시글 CRUD, 댓글 CRUD가 가능하다. 
<br>
- **칼럼 & QnA 게시판**<br>
  페이징, 게시글 CRUD, 댓글 CRUD가 가능하다.
<br>
- **구인게시판**<br>
    1. 소분류로 정규직, 계약직 페이지를 갖는다. 
    2. 사람인 API를 통해 얻은 JSON 데이터를 토대로 게시글을 보여준다. 
    3. 모달창으로 위 데이터 내 검색 기능이 가능하다. 
       1. 다중 선택 가능 조건 - 직군, 지역
       2. 단일 선택 가능 조건 - 경력, 학력, 급여

    4. 페이징이 가능하다. 
<br>


[comment]: <> (![]&#40;https://images.velog.io/images/chawani/post/75ce4a13-868a-4993-8343-47551e608b61/flow.PNG&#41;)

[comment]: <> (위에서 정의한 페이지들의 흐름)

[comment]: <> (## 3. 필요한 데이터베이스 정보)

[comment]: <> (>)

[comment]: <> (- **회원 정보**<br>)

[comment]: <> (  아이디<br>)

[comment]: <> (  비밀번호<br>)

[comment]: <> (  닉네임<br>)

[comment]: <> (  팀원 평가 누적 점수<br>)

[comment]: <> (  이메일 주소<br>)

[comment]: <> (- **게시글 정보**<br>)

[comment]: <> (  게시글 아이디<br>)

[comment]: <> (  게시자 아이디<br>)

[comment]: <> (  스터디 카테고리<br>)

[comment]: <> (  스터디 지역<br>)

[comment]: <> (  게시글 제목<br>)

[comment]: <> (  게시글 내용<br>)

[comment]: <> (  게시 일자<br>)

[comment]: <> (  모집중인지 판별<br>)

[comment]: <> (  현재 수용 인원<br>)

[comment]: <> (  수용 가능 인원<br>)

[comment]: <> (  스터디 기간<br>)

[comment]: <> (  스터디그룹 아이디<br>)

[comment]: <> (- **댓글 정보&#40;댓글은 스터디합류 신청 기능&#41;**<br>)

[comment]: <> (  댓글 아이디<br>)

[comment]: <> (  댓글을 등록한 회원 아이디<br>)

[comment]: <> (  댓글을 등록한 게시글 아이디<br>)

[comment]: <> (  댓글 등록 날짜<br>)

[comment]: <> (  댓글을 등록한 회원이 스터디에 합류하기로 확정되었는지 확인<br>)

[comment]: <> (- **스터디그룹 정보**<br>)

[comment]: <> (  스터디그룹 아이디<br>)

[comment]: <> (  스터디그룹이 파생된 게시글 아이디<br>)

[comment]: <> (  스터디 기간<br>)

[comment]: <> (  스터디 시작 날짜<br>)

[comment]: <> (- **리뷰 정보**<br>)

[comment]: <> (  리뷰가 속해있는 스터디그룹 아이디<br>)

[comment]: <> (  리뷰를 게시한 회원 아이디<br>)

[comment]: <> (  몇주차 리뷰인지 확인할 데이터<br>)

[comment]: <> (  리뷰 내용<br>)

[comment]: <> (![]&#40;https://images.velog.io/images/chawani/post/9ae93c6c-1a71-4e97-8670-95d95fa74e79/erd.PNG&#41;)

[comment]: <> (ERD로 표현<Br>)

[comment]: <> (<br>)

[comment]: <> (변경사항:<Br>)

[comment]: <> (Member테이블에 amount컬럼을 추가하여 총 몇 명에게 평가받았는지를 저장하였다.<br>)

[comment]: <> (Review테이블에 review_id를 추가하여 그것을 primary key로 설정하였다.)

[comment]: <> (## 4. 구현 결과)

[comment]: <> (>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256323-4da07580-e337-11eb-8104-4b14bd5c0a8d.png&#41;)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256505-76c10600-e337-11eb-9b11-f271a1a42c9c.png&#41;)

[comment]: <> (<br>)

[comment]: <> (- 메인페이지이자 게시판 기능을 가진 화면이다. 스터디를 만들고 싶은 사람들이 글을 올리면 목록에 보여진다. 게시글의 목록은 스터디 카테고리 분류에 따라 나눠서 조회할 수 있도록 하였다.)

[comment]: <> (- 로그인이 되지 않은 상태에서 글쓰기나 스터디 모집글에 접근할 경우 로그인 페이지로 넘어가도록 하였다. Spring Security를 사용하여 접근 권한을 제한하였다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256629-95bf9800-e337-11eb-824a-7ae2ecd921e3.png&#41;)

[comment]: <> (<br>)

[comment]: <> (- 로그인 후에는 글쓰기/게시글 조회/마이페이지/로그아웃 기능이 활성화된다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256698-a6700e00-e337-11eb-9d09-e08cf99e8570.png&#41;)

[comment]: <> (<br>)

[comment]: <> (게시글을 눌러 글을 조회해 보았다.)

[comment]: <> (- 본인이 등록한 글에서는 댓글창이 활성화 되지 않는다. 오직 다른 회원에 의해서만 신청 댓글을 받을 수 있기 때문이다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256804-c3a4dc80-e337-11eb-8d45-6a36e0b38e1e.png&#41;)

[comment]: <> (<br>)

[comment]: <> (다른 회원으로 로그인 하여 참여 신청 댓글을 달았다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256844-cc95ae00-e337-11eb-8a0f-3224837097e5.png&#41;)

[comment]: <> (<br>)

[comment]: <> (- 게시자 계정에서 내가 쓴 글을 조회하면 신청 댓글 수락 버튼이 활성화된다. 오직 게시자 계정만이 신청 댓글의 수락하기 버튼이 보인다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256911-dae3ca00-e337-11eb-93af-bd7ad4774605.png&#41;)

[comment]: <> (<br>)

[comment]: <> (- 수락하기 버튼을 누르면 취소하기가 가능한데, 이는 스터디 그룹 최종 생성 전 스터디원의 구성을 바꿀 수 있음을 의미한다.)

[comment]: <> (- 취소하기 후에 다시 수락하기도 가능하다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125256995-efc05d80-e337-11eb-8f6c-3d17d2b07dc2.png&#41;)

[comment]: <> (<br>)

[comment]: <> (- 마이페이지에서 스터디 팀 개설을 완료시킬 수 있다.)

[comment]: <> (- 내가 개설한 스터디 리스트와 참여 신청 댓글을 달았던 스터디 리스트를 보여준다.)

[comment]: <> (- 내가 개설한 스터디 목록에서 관리 버튼을 누르게되면 참여를 수락했던 팀원들 목록을 보여준다.)

[comment]: <> (- 내가 개설한 스터디 목록에서 팀 개설을 완료시켰다면 관리버튼이 리뷰버튼으로 바뀌게 된다.)

[comment]: <> (- 스터디 개설자가 팀 개설을 완료시키지 않았다면 참여 신청한 스터디 리스트의 버튼이 생성 대기중으로 뜨고, 개설을 완료시켰다면 리뷰 버튼으로 바뀌게 된다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125257060-023a9700-e338-11eb-8a69-647761c7eaea.png&#41;)

[comment]: <> (<br>)

[comment]: <> (팀 개설 완료 후 마이페이지로 돌아오면 리뷰버튼으로 전환된다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125257158-1aaab180-e338-11eb-8d8e-582b96ddefc7.png&#41;)

[comment]: <> (<br>)

[comment]: <> (- 리뷰페이지에는 처음 모집게시글을 올릴 때 설정했던 스터디 기간의 주 수만큼 리뷰칸이 생성된다.)

[comment]: <> (- 한 주가 끝날때마다 팀원별로 리뷰를 등록하여 피드백을 받을 수 있다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125257225-2b5b2780-e338-11eb-8c2a-85be6942e7db.png&#41;)

[comment]: <> (<br>)

[comment]: <> (- 리뷰를 위한 팀원 리스트는 스터디에 참여한 팀원 중 본인을 제외하여 넣었다.)

[comment]: <> (- 별점은 1점부터 5점까지 줄 수 있으며 한 회원에 대한 별점은 모든 스터디에 대한 누적 평균 점수이다.)

[comment]: <> (- 나의 활동 별점은 마이페이지에서 확인이 가능하다.<br>)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125257294-3ca43400-e338-11eb-94b8-c354a64b9179.png&#41;)

[comment]: <> (![image]&#40;https://user-images.githubusercontent.com/60432062/125257307-42017e80-e338-11eb-86f9-ea6ce68a0e4b.png&#41;)
