<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>
<style>

.gallery{
  overflow: hidden;
}
.gallery h3{
  width: 100%; height: 50px;
  line-height: 50px; text-align: center;
}

.gallery a{
  display: block; /* 영역적용위해 사용 */
  width: 100%; height: 100%;
  overflow: hidden;
  position: relative; /* absolute의 기본기준은 body로 처리 - 현재 요소로 기준변경 */
}

.gallery figure{
  width: 100%; height: 100%;
}
.gallery figcaption{
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.7);
  position: absolute; /* 이미지와 겹치게 처리 */
  top: 0; 
  left: 0;
  color: #fff; 
  text-align: center;
  font-size:25px;
  line-height: 200px;
  opacity: 0; /* 처음엔 안보이고 */
  transition: 0.3s;
}

.gallery a:hover figcaption, .gallery a:focus figcaption{
  /* 마우스를 올리면 보이게 처리 */
  opacity: 1;
}
</style>
        <!-- main-top-->
        <c:if test="${loginInfo eq null}">
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100">
                <div class="row gx-4 gx-lg-5 h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-8 align-self-end">
                        <h1 class="text-white font-weight-bold">
                        	welcome to BB WOOD
                        </h1>
                        <br>
                        <hr class="divider" />
                        <br>
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 mb-5" style="font:bolder;">
							BB WOOD은 대규모의 공장에서 만들어내는 가구보다는 <br>
							소량의 다양하고 사용자의 요구에 적합한 <br>
							심플하고 사용하기 편한 가구를 만드는 것을 지향하는 공방입니다<br><br>
							직접 나무를 만지며 체험할 수 있는 원데이 클래스를 오픈하였습니다<br>
							'BB WOOD'에서 즐거운 경험하시고 예쁜 소풍들을 만들어 가시기를 바라겠습니다
                        </p>
                        <a class="btn btn-primary btn-xl" href="#login">Go to Login</a>
                    </div>
                </div>
            </div>
        </header>
        </c:if>
        
        <!-- login == null -->
        <c:if test="${loginInfo eq null}">
        <section class="page-section bg-primary" id="login">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                
                	
                    <div class="col-lg-5 text-center">
                        <h2 class="text-white mt-0">LOGIN</h2>
                        <hr class="divider divider-light" /><br>
                        <p class="text-white-75 mb-4">
                       		오래도록 곁에 함께! <b>BBWOOD</b>가 함께합니다
                        </p>
                        
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
                           
                            <div class="d-grid">
                            	<button class="btn btn-light btn-xl" id="submitButton" type="submit">로그인</button>
                            </div>
                        </form>
                        <br>
                         <p class="text-white-100 mb-4">
                       		<a href="join.mb" class="text-white-75">회원가입</a> 
			                &nbsp;&nbsp;|&nbsp;&nbsp; 
			                <a href="searchId.mb" class="text-white-75">아이디 찾기</a> 
			                &nbsp;&nbsp;|&nbsp;&nbsp; 
			                <a href="searchPw.mb" class="text-white-75">비밀번호 찾기</a>
                        </p>
                    </div>

                </div>
            </div><br><br>
        </section>
        </c:if>


        <!-- class -->
        <div id="Cls"><br><br>
            <div class="container-fluid p-0"><br><br><br>
            <h2 class="text-center mt-0">BBWOOD ONEDAY CLASS</h2><br>
                <hr class="divider" /><br>
                <div class="row g-0">
                <c:forEach var="c" items="${clsLists }">
                    <div class="col-lg-4 col-sm-6">
						<div class="gallery">
						 <a href="GuestClsDetail.cls?cnum=${c.cnum }" title="${c.cname }">
						    <figure>
						      <img src="<%=request.getContextPath() %>/resources/clsimage/${c.cimage1}" alt="${c.cimage1 }">
						      <figcaption>
						      	<b>${c.cname }</b><br>
						      	${c.cprice }
						      </figcaption>
						    </figure>
						</a>
						</div>
                    </div>
                </c:forEach>
                </div>
            </div>
            <br><br><br>
        </div>
        
     <!-- oneday class-->
     <section class="page-section bg-dark text-white" id="info"><br><br>
    	<h2 class="text-center mt-0">BBWOOD INFO</h2><br>
                <hr class="divider" /><br><br>
           		<h5 class="text-center">안녕하세요 &nbsp; 합정동과 망원동 중간에 위치한 목공방 비비우드 스튜디오입니다 </h5>
                <br><br>
    	<div id="map" style="width: 100%; height: 400px;"></div>
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

		<br><br>
		 <h6 class="text-center">주소 : 서울 마포구 월드컵로7길 122 B1 비비우드스튜디오</h6>
		 <br>
		 
	     <div class="container px-4 px-lg-5 text-center">
	       <input type="button" value="길찾기" class="btn btn-light btn-xl"
	      onclick="location.href='https://map.kakao.com/link/to/bbwoodsutdio,37.55174, 126.90572'" />    
		 </div>
		 
	</section>  
	
 <%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>