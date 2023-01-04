<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
            <div class="col-lg-12 text-center">
              <h3 id="buttons">고객목록 (총 : ${totalCount })</h3>
            </div>
          </div>
        </div>
        <br>
        
        <form name="memberListForm" method="post" align="center" action="AdminMemberList.mb">
        <div class="row" style="margin-left:20%;">
         <div class="col-lg-2">
            <div class="form-group">
               <select name="whatColumn" class="form-select" width="10%">
                  <option value="">전체검색</option>
                  <option value="name">고객명</option>
                  <option value="id">아이디</option>
                  <option value="email">이메일</option>
               </select>
             </div>
          </div>
          <div class="col-lg-5">
            <input type="text" name="keyword" class="form-control">
          </div>
          <div class="col-lg-2" style="margin-left:-30px;">
            <input type="submit" value="검색" class="btn btn-outline-primary">
         </div>
        </div>
        </form>
  
   <br><br><br>
	<div class="col-lg-12">
		<div class="bs-component">
		 <table class="table table-hover" style="width:80%" align="center">
		 	<tr class="table-active">
				<th>no</th> 	
				<th>이름</th> 	
				<th>아이디</th> 	
				<th>이메일</th> 	
				<th>전화번호</th>
				<th>포인트</th> 	
				<th>쿠폰</th> 	
		 	</tr>
		 	<c:forEach var="mb" items="${memberLists }">
		 	<tr>
				<td>${mb.num }</td>
				<td><a href="AdminMemberBook.mb">${mb.name }</a></td>
				<td><a href="AdminMemberBook.mb">${mb.id }</a></td> <!-- 클릭하면 예약내역확인가능 -->
				<td>${mb.email }</td>
				<td>${mb.ph }</td>
				<td>${mb.point }</td>
				<td>쿠폰</td>
		 	</tr>
		 	</c:forEach>
		 </table>
		</div>
	</div>
</div>

   <p align="center">${pageInfo.pagingHtml }</p>
   
<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>