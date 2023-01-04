<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<div class="container">
<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h3 id="containers"><b>클래스 목록 (${totalCount })</b></h3>
              <input type="button" class="btn btn-link" value="추가하기" onclick="location.href='adminClsInsert.cls'" style="float:right;">
            </div>
          </div>
        </div>
         
        <br>
  			
  		<div class="row">
  		<c:forEach var="clsLists" items="${clsLists }">
          <div class="col-lg-4">
            <div class="bs-component">
              <div class="card mb-3">
                <h6 class="card-header">${clsLists.cnum }</h6>
                <div class="card-body">
                  <div class="card-title"><p style="font:30px, bolder;">${clsLists.cname }</p></div>
                  <h6 class="card-subtitle text-muted">${clsLists.cprice}원</h6>
                </div>
                <div class="card-body">
                	<img src="<%=request.getContextPath() %>/resources/clsimage/${clsLists.cimage1 }" width=100%>
                </div>
                <div class="card-body">
                  <p class="card-text">${clsLists.cinfo }</p>
                </div>
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">${clsLists.ccontent }</li>
                </ul>
                <div class="card-body">
                  <input type="button" class="btn btn-link " value="삭제" onclick="location.href='adminClsDelete.cls?cnum=${clsLists.cnum}'" style="float:right;">
                  <input type="button" class="btn btn-link " value="수정" onclick="location.href='adminClsUpdate.cls?cnum=${clsLists.cnum}'" style="float:right;">
                </div>
       		  </div>
       	   </div>
         </div>
       	</c:forEach>
       	</div>
</div>
</div></div>

 <%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>