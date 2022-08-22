# 봉곡태권도 홈페이지
  Spring MVC를 이용한 게시판과 회원관리를 구현한 홍보용 웹페이지


Demo : 

### 요약

#### 1. 개발기간 및 개발 인원
    - 2022.07.12 ~ 2022.08.20(약 6주)
    - 1인 개발(참여 및 기여도 100%)
  
#### 2. 개발환경
     - 언어 : JAVA(JDK 11), HTML/CSS, JS
     - 프레임워크 : Spring MVC(5.2), Mybatis(3.5)
     - DB : MySQL(8)
     - IDE : Eclipse 2020-21 / PostMan / Visual Studio Code
     - Libarary : RESTful API(JSON)
   
#### 3. 기획의도
    - 친구가 운영하는 태권도장의 웹 홍보 페이지가 없다는걸 듣고 이를 개선하기 위해
      홈페이지를 제작
    - 이 포트폴리오는 단순 홍보용 페이지가 아니라, 그간 학습한 다양한 기술들을 구현하는
      것이 가장 큰 목적
    - 이후 실제 사용될 홍보용 페이지를 기능을 최소화하여 제공될 예정
  
#### 4. 구현기술
    - Java와 HTML, JS를 기반으로 Spring MVC를 사용해 웹 페이지 제작
    - 게시판 CRUD / CkEditor / 페이징 처리 및 검색 / 댓글 / 파일 업로드 / 카테고리 구분 / 마이 페이지
    - 스프링 시큐리티를 사용한 회원 CRUD / 회원 가입 및 로그인 구현 / 회원 등급 분류 / 가입 승인
    - 스프링 시큐리티를 사용한 각 회원 등급 별 접근 권한 부여
    - 게시판 및 회원가입, 로그인시 Validation 구현
    - 다국어(한/영) 및 예외처리 구현
  
#### 5. 문제점 및 부족했던 점
    - 기획력 부족 : 확실한 계획 없이 즉흥적으로 기술 구현
                  -> 그 결과 코드 꼬임 + 난잡함 발생
      해결방안 : 계획 이외의 기술 추가시 무턱대고 추가하지 않고
                현재 코드에 어떻게 넣을지 고민 먼저하기

    - 창의성 부족 : 대다수의 코드가 연습 및 공부했던 코드의 재사용
                  -> 연습시 구현 결과와 큰 차이가 없음
      해결방안 : 같은 기술이라도 다른 방식으로 구현할 필요성!

    - 모듈화 실패 : JS 코드의 완전 모듈화 실패로 JSP 페이지의 난잡함
                  -> 계획되지 않은 기술의 추가로 깔끔한 모듈화 구현 실패
      해결방안 : 기획력 부족과 같은 문제. 코드 추가 이전 현재의 코드에
                어떻게 추가할지 고민 먼저 하기

    - 화면단 구현 : UI 및 화면을 보기좋게 꾸미는 것에 어려움을 느낌
                  -> 화면 구현이 부트스트랩의 카피본에 불과한점이 아쉬움
      해결방안 : 단기간에 해결이 불가능 할 것으로 판단됨

    - JS의 이해 부족 : 오류 및 코드 꼬임이 가장 많이 일어난 파트
                  -> 프로젝트 시간이 길어진 원인. 낮은 이해력으로 해결에 많은 시간 소요
      해결방안 : 온라인 강의 결제 및 책 구매 후 공부 시작!

    - SQL 테이블 구조 : 새로운 기술을 추가할 때마다 테이블을 반복해서 수정하는 일 발생
                  -> 프로젝트 기간이 길어진 원인2
      해결방안 : 프로젝트의 초기 단계에 기준을 잡아두는 것이 중요하다고 생각됨          
       
             
