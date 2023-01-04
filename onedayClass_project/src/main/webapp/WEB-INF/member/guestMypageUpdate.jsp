<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>   

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


	<section style="margin-top:100px;">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h4 class="mt-0">프로필 수정</h4>
                        <hr class="divider" />
                        <p class="text-muted mb-5">세상 모든 취미 여가의 시작! 원데이가 함께합니다</p>
                    </div>
                </div>
                
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
               <form id="updateMyPt" action="updateMyPt.mb" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                 	<label for="pt" class="form-label mt-4">프로필</label>
					<img src="<%=request.getContextPath() %>/resources/memPt/${mb.pt}" style="max-width:50%">
                    <input type="file" name="upload">
                    <input type="file" name="upload">
                    <input type="file" name="upload">
                    
                    <input type="file" class="form-control"  name="upload">
						<input type="text" readonly class="form-control-plaintext" name="gu_bcateimg" value="${cateBean.bcateimg }">
					
                  </div>
               </form>


  <%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>