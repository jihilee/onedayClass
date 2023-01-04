<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	function click_bcheck(b_num){
		
		alert(b_num);
		
		$.ajax({
			type : 'POST',
	        url : 'updateBcheck.bk',
	        dataType : 'json',
	   		data:{
	   			b_num : b_num
	   		},
	   		success:function(data){
	   			alert('성공');
	   			b_check = data;
	   			location.reload();
	   		},
	   		error: function(request, status, error ){
	   		    alert("status : " + request.status + ", message : " 
	   		    		+ request.responseText + ", error : " + error);
	   		}
		});
	}
	
</script>

<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
            <div class="col-lg-12 text-center">
              <h3 id="buttons"><b>예약 목록 </b>(${pageInfo.totalCount })</h3>
            </div>
          </div>
        </div>
        <br>
       
        <form name="AdminMemberBookList" align="center" action="adminBookList.bk">
        <div class="row" style="margin-left:20%;">
         <div class="col-lg-2">
            <div class="form-group">
               <select name="whatColumn" id="whatColumn" class="form-select" width="10%">
                  <option value="">전체검색</option>
                  <option value="b_person">예약자명</option>
                  <option value="b_cname">클래스명</option>
                  <option value="b_day">일자</option>
               </select>
             </div>
          </div>
          <div class="col-lg-5">
            <input type="text" name="keyword" id="keyword" class="form-control">
          </div>
          <div class="col-lg-2" style="margin-left:-30px;">
            <input type="submit" id="okay" value="검색" class="btn btn-outline-primary">
         </div>
        </div>
        </form>
  
   <br><br><br>
	<div class="col-lg-12">
		<div class="bs-component">
		 <table class="table table-hover" style="width:70%" align="center">
		 	<tr class="table-active">
				<th>예약자명</th> 	
				<th>클래스명</th> 	
				<th>일자</th> 	
				<th>시작시간</th> 	
				<th>종료시간</th>
				<th>예약확정</th>
		 	</tr>
		 	<c:forEach var="b" items="${blist }">
		 	<tr>
				<td>${b.b_person }</td>
				<td>${b.b_cname }</td>
				<td>${b.b_day }</td> 
				<td>${b.b_stime }</td>
				<td>${b.b_etime }</td>
				<td>
					<c:if test="${b.b_check == 0 }">
						<a href="javascript:void(0)" onclick="click_bcheck('${b.b_num }')">예정</a>
					</c:if>
					<c:if test="${b.b_check == 1 }">
						확정
					</c:if>
				</td>
		 	</tr>
		 	</c:forEach>
		 </table>
		 <center>${pageInfo.pagingHtml}</center><br>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>