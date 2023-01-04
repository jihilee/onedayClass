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
                 <h3 id="containers"><b>내가 작성한 리뷰</b></h3>
                 <hr class="divider" />
             </div>
         </div>
        <br>
        
		<div class="col-lg-12">
		<div class="bs-component">
		
		<c:if test="${fn:length(reviewLists)==0}">
		<br><br>
          <h4 class="text-center" style="font-size:20px; font-weight: bolder">
			리뷰 내역이 존재하지 않습니다.
		  </h4>
        </c:if>
		
		<table class="table table-hover" style="width:80%; "align="center">
		 	<c:forEach var="r" items="${reviewLists }">
		 	<tr>
				<td width=27%>
					<Strong>${r.b_cname }</Strong>
					<br>${r.b_day } &nbsp; ${r.b_stime } ~ ${r.b_etime }
				</td>
				<td width=35%>${r.rcontent } &nbsp;&nbsp; <p style="font-size:small; color:gray;">${r.rday }</p></td> 
				<td width=23%>				
					<c:set var="rimg" value="${fn:split(r.rimage ,',')}"></c:set>
					<c:forEach var="img" items="${rimg}" varStatus="status">
						<c:if test="${status.count eq 1}">
							<img src="<%=request.getContextPath() %>/resources/assets/img/upload/${img }" height="100px">
						</c:if>
					</c:forEach>
				</td> 
				
				<td width=15%>
					<a href="#" data-toggle="modal" data-target="#updateModal${r.rnum }" id="openModal${r.rnum }">수정</a> &nbsp;
					<a href="deleteMyReview.rv?rnum=${r.rnum }">삭제</a> 
				</td> 
			</tr>
		 	</c:forEach>
		 </table>
		</div>
		</div>
</div>
</div>

<c:forEach var="r" items="${reviewLists }">
<!-- review update modal -->
<div class="modal fade" id="updateModal${r.rnum }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="top:20%;left:35%;width:600px;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form action="updateReview.rv" method="post" enctype="multipart/form-data">
      	  <input type="hidden" name="bnum" value="${r.bnum }">
      	  <input type="hidden" name="reviewer" value="${r.reviewer }">
      	  <input type="hidden" name="before_img" value="${r.rimage }">
	      <div class="modal-body">
	        <div class="form-group">
	           <label for="recipient-name" class="col-form-label">'<b>${r.b_cname }</b>' 수업은 어떠셨나요?</label>
	           <textarea class="form-control" name="rcontent"  id="rcontent" rows="3" style="resize: none;">${r.rcontent }</textarea>
	           <br>
	           <c:set var="rimg" value="${fn:split(r.rimage ,',')}"></c:set>
				<c:forEach var="img" items="${rimg}" varStatus="status">
					<img src="<%=request.getContextPath() %>/resources/assets/img/upload/${img }" 
						style="max-width:300px; max-height: 200px;"> &nbsp;
				</c:forEach>
				
				<br><br>
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
	      
<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>