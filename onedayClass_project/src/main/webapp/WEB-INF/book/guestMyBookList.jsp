<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<!-- modal -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- end modal -->

<div class="container">
<div class="bs-docs-section">
         <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h3 id="containers"><b>예약 내역</b>
           			</h3>
                    <hr class="divider" />
                </div>
            </div>
        <br>
		<div class="container">
        <div class="row  justify-content-center">
        <c:if test="${fn:length(guestbookLists)==0}">
        	<div class="col-lg-9 text-center">
            <div class="bs-component">
              <div class="card text-white bg-primary mb-9 text-center">
              <div class="card-header">
        	  	<input type="button" class="btn btn-link text-white" onclick="location.href='GuestClsMain.cls?id=#Cls'" value="클래스 보러가기">
        	  </div>
              <div class="card-body" style="color:black; background-color:white;">
                  <h4 class="card-title" style="font-size:20px; font-weight: bolder">
        			예약내역이 존재하지 않습니다.
        		  </h4>
        	  </div>
        	  </div>
        	</div>
        	</div>
        	 </c:if>
        <c:if test="${fn:length(guestbookLists)>0}">
        
         <c:forEach var="gb" items="${guestbookLists }">
         <div class="col-lg-4 text-center">
            <div class="bs-component">
              <div class="card text-white bg-primary mb-9 text-center">
                <div class="card-header"><span style="font-size:20px;"><b>${gb.b_day }</b>&nbsp;</span>
                			<span style="font-size:16px;">
                			<c:if test="${fn:contains(gb.dday,'-')}">D-0</c:if>
                			<c:if test="${fn:contains(gb.dday,'-') eq false}">
                				<c:forTokens items="${gb.dday }" delims=" " var="dd" begin="0" end="0">
                					D-${dd+1 }
                				</c:forTokens>
                			</c:if>
                			</span>&nbsp;
               	</div>
                <div class="card-body" style="color:black; background-color:white;">
                  <h4 class="card-title" style="font-size:20px; font-weight: bolder">${gb.b_cname }</h4>
                  
	                  <p class="card-text">수업시간 : ${gb.b_stime }~${gb.b_etime }<br>
	                  인원 및 결제금액 : ${gb.b_people}명&nbsp; ${gb.b_paying}</p>
	                  <c:if test="${gb.b_check eq '0' }">
	                  	<input type="button" class="btn btn-secondary" value="예약확인중"
	                  	 onclick="location.href='guestBookDetail.bk?b_num=${gb.b_num}'">
	                  </c:if>
	                  <c:if test="${gb.b_check eq '1' }">
	                  	<input type="button" class="btn btn-success" value="예약확정"
	                  	 onclick="location.href='guestBookDetail.bk?b_num=${gb.b_num}'">
	                  </c:if>
	                  
	                  <jsp:useBean id="now" class="java.util.Date" />
	                  <fmt:formatDate value="${now}" pattern="yy/MM/dd/ hh:mm" var="nowDate" /> 
	                  <c:if test="${gb.b_check eq '1' && gb.b_etime < nowDate}">
	                  <!-- modal 구동 버튼 (trigger) -->
						<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" value="리뷰쓰기">
	                  </c:if>
                </div>
                </div>
         	  </div>    
            </div>
           	
           	<!-- review modal -->
 						<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
 							style="top:20%;left:30%;width:600px;">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">리뷰 작성</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      
						      <form action="updateReview.rv" method="post" enctype="multipart/form-data">
						      	  <input type="hidden" name="bnum" value="${gb.b_num }">
						      	  <input type="hidden" name="reviewer" value="${gb.b_person }">
							      <div class="modal-body">
							        <div class="form-group">
							           <label for="recipient-name" class="col-form-label">'<b>${gb.b_cname }</b>' 수업은 어떠셨나요?</label>
							           <textarea class="form-control" name="rcontent"  id="rcontent" rows="3" style="resize: none;"></textarea>
							           <br>
							           <input type="file" accept=".jpg, .png" multiple class="form-control-file" name="review_images" id="review_images">
							      	
							      	</div>      
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							        <button type="submit" class="btn btn-primary">작성</button>
							      </div>
						      </form>
						      
						    </div>
						  </div>
						</div>
	      <!-- end review modal --> 
         </c:forEach>
        
        </c:if>

         </div>
       	</div>        
</div>
</div>
	                  
<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>