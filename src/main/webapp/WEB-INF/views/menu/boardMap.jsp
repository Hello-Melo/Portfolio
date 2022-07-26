<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layouts/header.jsp"%>

<div class="p-5 mb-4 bg-light rounded-3">
    <div class="d-flex justify-content-center">
      <h1 class="display-5 fw-bold">찾아오시는 길</h1>
    </div>
  </div>

<div class="container">
    <div id="map" style="width:100%;height:550px;"></div>
</div>

<br>
        <div class="container">
        <div class="p-5 mb-4 bg-light rounded-3">
            <div class="d-flex justify-content-around">
              <div>
                <p> <h2> 봉곡태권도</h2></p>
                <p>
                    <h4> - 010 . 0101 . 0101 -</h4><br>
                    - 평일 14:00 ~ 20:00<br>
                    - 주소 : 경북 구미시 봉곡동 391<br>
                    - 대표 : 관장 최 정 욱  / 사업자등록번호 : 302 - 11 - 55148 <br>
                </p>
            </div>
            <div>
                <img src="${contextPath}/resources/imgs/logo2-removebg-preview.png" style="width:200px;">
            </div>
            </div>
          </div>
        </div>



<%@ include file="/WEB-INF/views/layouts/footer.jsp"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f54d206e2d27fcf37e009eeeb0a2c40d"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.15078429523667, 128.3163783911749), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(36.15078429523667, 128.3163783911749); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);



var iwContent = '<div  style="padding:5px; text-align : center;">봉곡태권도<br><a href="https://map.kakao.com/link/map/봉곡태권도,36.15078429523667, 128.3163783911749" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/봉곡태권도,36.15078429523667, 128.3163783911749" style="color:blue" target="_blank">길찾기기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(36.15078429523667, 128.3163783911749); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>