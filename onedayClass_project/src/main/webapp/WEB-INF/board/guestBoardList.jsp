<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>


<div class="container">
<div class="bs-docs-section">
         <div class="row justify-content-center">
             <div class="col-lg-8 text-center">
                 <h3 id="containers"><b>내가 작성한 문의</b></h3>
                 <hr class="divider" />
             </div>
         </div>
        <br>
        
		<div class="col-lg-12">
		<div class="bs-component">
		
		<c:if test="${fn:length(bList)==0}">
		<br><br>
          <h4 class="text-center" style="font-size:20px; font-weight: bolder">
			문의 내역이 존재하지 않습니다.
		  </h4>
        </c:if>
        
		<c:if test="${fn:length(bList) ne 0}">
		<table class="table table-hover" style="width:80%;" align="center">
		 	<c:forEach var="bb" items="${bList }">
		 	<tr>
		 		<td>
					${bb.num } <c:if test=""></c:if>
				</td>
				<td>
					${bb.subject }
				</td>
				<td>
					${bb.reg_date }
				</td>
				<td>
					<a>수정</a> &nbsp;
					<a>삭제</a> 
				</td> 
			</tr>
		 	</c:forEach>
		 </table>
		 </c:if>
		 
		</div>
		</div>
</div>
</div>


<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>