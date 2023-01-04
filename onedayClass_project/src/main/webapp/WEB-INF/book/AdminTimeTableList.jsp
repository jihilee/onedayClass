<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
            <div class="col-lg-12 text-center">
              <h3 id="buttons"><b>타임테이블 목록 </b>(총 : ${totalCount })</h3>
            </div>
          </div>
        </div>
        <br>
       
        <form name="AdminTimeTableList" align="center" action="AdminTimeTableList.bk" method="post">
        <div class="row" style="margin-left:20%;">
         <div class="col-lg-2">
            <div class="form-group">
               <select name="whatColumn" id="whatColumn" class="form-select" width="10%">
                  <option value="">전체검색</option>
                  <option value="t_cname">클래스명</option>
                  <option value="t_day">일자</option>
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
				<th>클래스명</th> 	
				<th>일자</th> 	
				<th>시작시간</th> 	
				<th>종료시간</th>
				<th>수정</th>
				<th>삭제</th>
		 	</tr>
		 	<c:forEach var="tb" items="${tbList }">
		 	<tr>
				<td>${tb.t_cname }</td>
				<td>${tb.t_day }</td> 
				<td>${tb.t_stime }</td>
				<td>${tb.t_etime }</td>
				<c:if test="${tb.t_check eq '0' }">
					<td><a href="AdminTimeTableUpdate.bk?t_num=${tb.t_num }">수정</a></td>
					<td><a href="AdminTimeTableDelete.bk?t_num=${tb.t_num }">삭제</a></td>
				</c:if>
				<c:if test="${tb.t_check eq '1' }">
					<td colspan="2">예약완료</td>
				</c:if>
		 	</tr>
		 	</c:forEach>
		 </table>
		 <center>${pageInfo.pagingHtml}</center><br>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>
