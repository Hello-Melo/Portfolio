<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="/WEB-INF/views/layouts/header.jsp" %>
  
  
  <!-- 수업시간표 -->

<div class="p-5 mb-4 bg-light rounded-3">
    <div class="d-flex justify-content-center">
      <h1 class="display-5 fw-bold"><spring:message code="board.schedule" /></h1>
    </div>
  </div>

        <div class="container">
            <table class="table table-striped table-hover table-bordered" style="text-align: center;">
                <thead class="tblue">
                <tr  class="fw-bold"style="color: white;">
                    <th scope="col">Open</th>
                    <th scope="col">수련대상</th>
                    <th scope="col">수련시간</th>
                    <th scope="col">기타</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>유치부</td>
                    <td>01:00 ~ 02:00</td>
                    <td rowspan="7"  class="table-default">
                        <div >
                            주 3회 - 110,000원<br>
                            주 5회 - 130,000원
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>유치부/초등부</td>
                    <td>02:00 ~ 03:00</td>
                    
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>초등부</td>
                    <td>03:00 ~ 04:00</td>
                    
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>초등부</td>
                    <td>04:00 ~ 05:00</td>
                    
                </tr>
                <tr>
                    <th scope="row">5</th>
                    <td>중등부</td>
                    <td>06:00 ~ 07:00</td>
                    
                </tr>
                <tr>
                    <th scope="row">6</th>
                    <td>고등부</td>
                    <td>07:00 ~ 08:00</td>
                
                </tr>
                <tr>
                    <th scope="row">7</th>
                    <td>고등/성인부</td>
                    <td>08:00 ~ 09:00</td>
                  
                </tr>
                </tbody>
            </table>
        </div>

        <br>
        <div>
            <div>
                <p class="fs-5 fw-bold">태권도로 우리 아이 몸과 마음을 건강하게 키우세요!</p>
                <p class="fs-6">사랑으로 가르치는 봉곡 태권도장 <br>
                         아이들에게 튼튼한 신체와 건강한 정신을 가르치는 하루 한시간!</p>
            </div>
            <br>
            <div class="container" >
                    <div class="d-flex justify-content-between">
                        <div>
                            <img src="${contextPath}/resources/imgs/empty.png" alt=""><br>
                            <p>신체 발달</p>
                        </div> 
                        <span>|</span>
                        <div>
                            <img src="${contextPath}/resources/imgs/empty.png" alt=""><br>
                            <p>운동 발달</p>
                        </div> 
                        <span>|</span>
                        <div>
                            <img src="${contextPath}/resources/imgs/empty.png" alt=""><br>
                            <p>뇌운동 활성화</p>
                        </div> 
                        <span>|</span>
                        <div>
                            <img src="${contextPath}/resources/imgs/empty.png" alt=""><br>
                            <p>사회성 발달</p>
                        </div> 
                    </div>
            </div>
        </div>

        <br>
        <div class="container">
        <div class="p-5 mb-4 bg-light rounded-3">
            <div class="d-flex justify-content-around">
              <div>
                <p>#안심귀가 #승하차교육 #교통안전교육</p>
                <p>
                    - 아이 걱정을 덜어드립니다.<br>
                    - 안전운전!<br>
                    - 자녀 실시간 , 하원 알림 서비스!<br>
                    - 봉곡동 전지역 운행!<br>
                </p>
            </div>
            <div>
                <img src="${contextPath}/resources/imgs/bus-removebg-preview.png" alt="">
            </div>
            </div>
          </div>
        </div>

  
  
    <%@ include file="/WEB-INF/views/layouts/footer.jsp" %>