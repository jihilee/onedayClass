<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<script type="text/javascript">
	function deleteBook(b_num,b_day){
		alert(b_num);
		alert(b_day);
		var now = new Date();
		if(b_day > now){
			
			return false;
		}
		else{
			location.href="";
		}
	}

</script>

<div class="container">
<div class="bs-docs-section">

		<form action="guestMyUpdate.mb" method="get">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8  text-center">
                    <h3 id="containers"><b>예약 내역 상세</b>
           			</h3>
                    <hr class="divider" />
           				<input type="button" class="btn btn-link" onclick="deleteBook(${bb.b_num },${bb.b_day })"
                		value="예약취소" style="float:right;" id="submitButton">
                </div>
            </div>

            <div class="row justify-content-center mb-8">
                <div class="container px-4 px-lg-5 col-lg-7">
				  <div class="form-group">
	                <label for="name" class="form-label mt-4">클래스명</label>
	                <input type="text" readonly class="form-control" id="b_cname" name="b_cname" value="${bb.b_cname }">
	              </div>
				  <div class="form-group">
	                <label for="id" class="form-label mt-4">클래스시간</label>
	                <input type="text" readonly class="form-control" id="b_ctime" name="b_ctime" value="${bb.b_day } &nbsp; ${bb.b_stime } ~ ${bb.b_etime }">
	              </div>
	              <div class="form-group justify-content-center">
	                <label for="email" class="form-label mt-4">인원</label>
	                <input type="text" readonly class="form-control" name="b_people" value="${bb.b_people }">
	              </div>
	              <div class="form-group">
	                <label for="ph" class="form-label mt-4">결제수단</label>
	                <input type="text" readonly class="form-control" name="b_paying" value="${bb.b_paying }">
	              </div>
	              <div class="form-group">
	                <label for="ph" class="form-label mt-4">결제액</label>
	                <input type="text" readonly class="form-control" name="b_price" value="${bb.b_price }">
	              </div>
        		</div>
        	</div>
	</form>
</div>
</div>
<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>