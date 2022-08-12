<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="/WEB-INF/views/layouts/header.jsp" %>
  
    <main>
      <div class="container">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
             </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                  <!-- <video src="https://lv-vod.fl.freecaster.net/vod/louisvuitton/enmFm3Vrm7_HD.mp4"></video> -->
                <img src="${contextPath}/resources/imgs/1.png" class="d-block w-100" alt="...">
              </div>
              <div class="carousel-item">
                <img src="${contextPath}/resources/imgs/4.jpg" class="d-block w-100" alt="...">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        </div>


    <!-- 메인 하단 -->
    <div class="text-center mt-5 mb-5">
        <h2><spring:message code="board.teak" /></h2>
        <p>아이들에게 건전한 마음과 건강한 신체를 선물하세요!</p>
       
        <button type="button" class="btn btn-dark"
        onclick="location.href='${contextPath}/chat'"><spring:message code="board.counseling" /></button>
    
    </div>

    <div class="container mt-5 mb-5">
        <div class="row">
            <div class=" col-md-4 col-sm-12">
                <div class="card">
                    <img src="${contextPath}/resources/imgs/2.jpeg" class="card-img-top botLogo" alt="...">
                    <div class="card-body">
                      <h2 class="card-text text-center"><a href="${contextPath}/table"> <spring:message code="board.schedule" /></a></h2>
                    </div>
                  </div>
            </div>
            
            <div class=" col-md-4 col-sm-12">
                <div class="card">
                    <img src="${contextPath}/resources/imgs/kids.jpg" class="card-img-top botLogo" alt="...">
                    <div class="card-body">
                      <h2 class="card-text text-center"><a href="${contextPath}/list/free"><spring:message code="board.board" /></a></h2>
                    </div>
                  </div>
            </div>

            <div class=" col-md-4 col-sm-12">
                <div class="card">
                    <img src="${contextPath}/resources/imgs/6.jpg" class="card-img-top botLogo" alt="...">
                    <div class="card-body">
                      <h2 class="card-text text-center"><a href="${contextPath}/map"><spring:message code="board.counseling" /></a></h2>
                    </div>
                  </div>
            </div>
            
        </div>
     </div>
</main>

<script>

</script>
  
    <%@ include file="/WEB-INF/views/layouts/footer.jsp" %>