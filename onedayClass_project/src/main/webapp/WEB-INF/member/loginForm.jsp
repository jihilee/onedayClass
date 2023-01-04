<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<script src="resources/js_main/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<!-- 카카오로그인 -->
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script> 

 
	<section style="margin-top:100px;">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h4 class="mt-0">로그인</h4>
                        <hr class="divider" />
                        <p class="text-muted mb-5">오래도록 곁에 함께! <b>BBWOOD</b>가 함께합니다</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN" action="loginForm.mb" method="post">
                            
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="id" name="id" type="text" placeholder="id" data-sb-validations="required" />
                                <label for="id">아이디</label>
                            </div>
                            <!-- password address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="password" name="pw" type="password" placeholder="password" data-sb-validations="required" />
                                <label for="password">비밀번호</label>
                               
                            </div>
                           
                            <div class="d-grid"><button class="btn btn-primary btn-xl" id="submitButton" type="submit">로그인</button></div>
                        </form>
                        <div>
                        <div class="text-center">
                        	<a href="join.mb">회원가입</a> 
			                &nbsp;&nbsp;|&nbsp;&nbsp; 
			                <a href="searchId.mb">아이디 찾기</a> 
			                &nbsp;&nbsp;|&nbsp;&nbsp; 
			                <a href="searchPw.mb">비밀번호 찾기</a>
            			</div>
            			
                    </div>
                </div>
            </div>
           </div>
       </section>
       
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


	<input type="button" value="길찾기"
      onclick="location.href='https://map.kakao.com/link/to/bbwoodsutdio,37.55174, 126.90572'" />
     
		<hr>
	<div>