<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>
        
<div class="container">
<div class="bs-docs-section">
	<form action="guestMyUpdate.mb" method="get">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8  text-center">
                    <h3 id="containers"><b>사용자 정보</b>
           			</h3>
                    <hr class="divider" />
           				<input type="button" class="btn btn-link" onclick="location.href='guestMyUpdate.mb'"
                		value="정보 수정하기" style="float:right;" id="submitButton">
                </div>
            </div>

            <div class="row justify-content-center mb-8">
                <div class="container px-4 px-lg-5 col-lg-7">
				  <div class="form-group">
	                <label for="name" class="form-label">클래스명</label>
	                <input type="text" readonly class="form-control" id="b_cname" name="name" value="${mb.name }">
	              </div>
				  <div class="form-group">
	                <label for="id" class="form-label">아이디</label>
	                <input type="text" readonly class="form-control" id="id" name="id" value="${mb.id }">
	              </div>
	              <div class="form-group justify-content-center">
	                <label for="email" class="form-label">이메일</label>
	                <input type="text" readonly class="form-control" name="email" value="${mb.email }">
	              </div>
	              <div class="form-group">
	                <label for="ph" class="form-label">연락처</label>
	                <input type="text" readonly class="form-control" name="ph" value="${mb.ph }">
	              </div>
        		</div>
        	</div>
	</form>
</div>
</div>

<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>