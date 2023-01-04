<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>


<div class="container">
<div class="bs-docs-section">
	<form action="adminMypage.mb" method="post">
		 <input type="hidden" name="num" value="${mb.num }">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8  text-center">
                    <h3 id="containers"><b>관리자 정보</b>
                    <input type="submit" class="btn btn-link" value="수정하기" style="float:right;">
           			</h3>
                    <hr class="divider" />
                </div>
            </div>

            <div class="row justify-content-center mb-8">
                <div class="col-lg-8">

			  <div class="form-group">
                <label for="name" class="form-label mt-4">관리자명</label>
                <input type="text" readonly class="form-control" id="name" name="name" value="${mb.name }">
              </div>
			  <div class="form-group">
                <label for="id" class="form-label mt-4">관리자아이디</label>
                <input type="text" readonly class="form-control" id="id" name="id" value="${mb.id }">
              </div>
              <div class="form-group">
                <label for="email" class="form-label mt-4">관리자이메일</label>
                <input type="email" readonly class="form-control" name="email" value="${mb.email }">
              </div>
              <div class="form-group">
                <label for="ph" class="form-label mt-4">관리자 연락처</label>
                <input type="text" readonly class="form-control" name="ph" value="${mb.ph }">
              </div>
           	  <div class="form-group">
                 <label for="cinfo" class="form-label mt-4">공방주소</label>
                 
                    <div id="map" style="width: 500px; height: 400px;"></div>
				<br>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d6c6219b73733f61951166c9573159f"></script>
				<script type="text/javascript">
			
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.55174, 126.90572), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
					// 마커가 표시될 위치입니다 
					var markerPosition = new kakao.maps.LatLng(37.55174, 126.90572);
			
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position : markerPosition
					});
			
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
			
					// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
					// marker.setMap(null);
				</script>
                    <input type="text" readonly class="form-control" name="caddress" value="${cb.caddress }">
                    <input type="text" readonly class="form-control" name="clocation" value="${cb.clocation }">
              </div>
              
                </div>
            </div>
        </div>
</form></div></div>