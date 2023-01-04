<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>
<style>
   .carousel .carousel-item {
	  height:550px;
      top: 0;
      left: 0;
      width:100%;
	}
	.carousel-item img {
	  object-fit:cover;
	  max-height:550px;
	}
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

	<section class="page-section" id="Cls">
            <div class="container-fluid p-0">
                
                <div class="container">
                 <div class="row">
                    <div class="col">
                   
	                    <!-- image start -->			
						<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
						
						<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img class="d-block w-100" src="<%=request.getContextPath() %>/resources/clsimage/${cb.cimage1 }" alt="..." />
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="<%=request.getContextPath() %>/resources/clsimage/${cb.cimage2 }" alt="..." />
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="<%=request.getContextPath() %>/resources/clsimage/${cb.cimage3 }" alt="..." />
								</div>
							</div>
							
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev"> 
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
								<span class="visually-hidden">Previous</span> 
							</button> 
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next"> 
								<span class="carousel-control-next-icon" aria-hidden="true"></span> 
								<span class="visually-hidden">Next</span>
							</button>
						</div>
	                    <!-- image end -->
                    
                    </div>
                
                    <br><br>
                    
                    <div class="col justify-content-center">
                    <br><br>
                    	<h3 class="text-center mt-0" style="font-family:'NanumGothic';"> ${cb.cname } </h3>
			           		<br>
			            <h5 class="text-center mt-0">${cb.cprice } 원</h5>
			                <hr class="divider" /><br>
			            <br><br>
			            
			            <figure class="text-center">
						  <blockquote class="blockquote">
						    <p><Strong>${cb.cinfo }</Strong></p>
						  </blockquote>
						  <br>
						  <figcaption class="blockquote-footer">
						    <Strong>${cb.ccontent }</Strong>
						  </figcaption>
						</figure>
			             
			            <br><br><br><br>
	           			<input type="button" class="btn btn-primary" value="예약하기" 
	           				onclick="location.href='guestBook.bk?cnum=${cb.cnum }'" style="width:300px; height:50px; margin-left:170px;">
					</div>
				</div>
			</div>
		</div>
           	
           	<br><br>
           	
        <section>
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="bs-component">
            <br><br>
            <h3 class="mt-0" style="font-family:'NanumGothic';"> 클래스 리뷰 </h3>
			<br><br>
			
			<c:if test="${fn:length(reviewLists) eq 0 }">
				다른 회원의 리뷰가 없습니다
			</c:if>
			
			<c:if test="${fn:length(reviewLists) ne 0 }">
			<table>
	            <c:forEach var="rv" items="${reviewLists }">
	            <tr>
	            	<td>
	            	<c:set var="rimg" value="${fn:split(rv.rimage ,',')}"></c:set>
					<c:forEach var="img" items="${rimg}" varStatus="status">
						<c:if test="${status.count eq 1}">
							<img src="<%=request.getContextPath() %>/resources/assets/img/upload/${img }" width="100px" height="100px">
						</c:if>
	        		</c:forEach>
	        		</td>
					<td class="text-center" width="50%"> <p style="font:bolder;"> ${rv.rcontent } </p> </td>
					<td class="text-center"> <p style="font-size:small; color:gray;">${rv.rday }</p> </td>
				</tr>
	            </c:forEach>
            </table>
            </c:if>
            
            </div>
          </div>
       </div>
       
       <br><br><br><br>
       
		<div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="bs-component">
              <div class="accordion" id="accordionExample">
                
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      환불 정책
                    </button>
                  </h2>
                  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      1. 결제 후 1시간 이내에는 무료 취소가 가능합니다.<br>
						(단, 신청마감 이후 취소 시, 진행 당일 결제 후 취소 시 취소 및 환불 불가)<br><br>
						2. 결제 후 1시간이 초과한 경우, 아래의 환불규정에 따라 취소수수료가 부과됩니다.<br>
						- 신청마감 2일 이전 취소시 : 전액 환불<br>
						- 신청마감 1일 ~ 신청마감 이전 취소시 : 결제 금액의 50% 취소 수수료 배상 후 환불<br>
						- 신청마감 이후 취소시, 또는 당일 불참 : 환불 불가<br>
						※ 취소 수수료는 신청 마감일을 기준으로 산정됩니다.<br>
						※ 신청 마감일은 무엇인가요?<br>
						강의 진행을 준비하기 위해, 클래스 진행일보다 일찍 신청을 마감합니다.<br>
						환불은 진행일이 아닌 신청 마감일 기준으로 이루어집니다. 꼭 날짜와 시간을 확인 후 결제해주세요! : )<br>
						※신청 마감일 기준 환불 규정 예시<br>
						- 클래스 진행일 : 10월 27일<br>
						- 신청 마감일 : 10월 26일<br>
						10월 25일에 취소 할 경우, 신청마감일 1일 전에 해당하며 50%의 수수료가 발생합니다.<br><br>
						[환불 신청 방법]<br>
						1. 결제한 계정으로 로그인<br>
						2. mypage - 예약내역<br>
						3. 취소를 원하는 클래스 상세 정보 버튼 - 취소<br>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      유의사항
                    </button>
                  </h2>
                  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                      	[신청 시 유의사항]<br>
 						최소 인원 미달로 인해 진행이 취소될 경우, 신청 마감 일시에 진행 취소 안내를 드리며 참가비는 전액 환불해 드립니다.<br>
 						에어건이 준비되어 있어 먼지를 털 수 있지만 되도록이면 먼지가 잘 붙는 옷은 피하시는 게 좋습니다.<br>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
	    </section>    
	    
      <section class="page-section">
          <div class="container-fluid p-0">
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
	 </section>			


<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>