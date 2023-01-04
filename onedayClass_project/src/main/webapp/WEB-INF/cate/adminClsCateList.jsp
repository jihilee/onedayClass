<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>
 
<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
            <div class="col-lg-12 text-center">
				<h4 id="buttons">대분류 목록 (총:${totalCount })</h4>
            </div>
          </div>
        </div>
        <br>
  		
	<div class="col-lg-12">
		<div class="bs-component">
		 <table class="table table-hover" style="width:60%" align="center">
		 	<tr>
		 		<td colspan=4>
		 		<input type="button" value="추가하기" onclick="location.href='adminClsCateInsert.cate'" style="float:right;">
		 		</td>
		 	</tr>
		 	<tr class="table-active">
				<th>no</th> 	
				<th>대분류명</th> 	
				<th>이미지</th> 	 	
				<th>관리</th> 	 	
		 	</tr>
		 	<c:forEach var="ca" items="${cateList }">
		 	<tr>
				<td><input type="text" readonly class="form-control-plaintext" name="bcatenum" value="${ca.bcatenum}"></td>
				<td><img src="<%=request.getContextPath()%>/resources/cateImage/${ca.bcateimg }" name="bcateimg" width="200px"></td>
				<td><input type="text" readonly class="form-control-plaintext" name="bcate" value="${ca.bcate }"></td>
				<td>
					<input type="button" value="수정" onclick="location.href='adminClsCateUpdate.cate?bcatenum=${ca.bcatenum}'">
					<input type="button" value="삭제" onclick="location.href='adminClsCateDelete.cate?bcatenum=${ca.bcatenum}&bcateimg=${ca.bcateimg }&bcate=${ca.bcate}'">
				</td>
		 	</tr>
		 	</c:forEach>
		 </table>
		</div>
	</div>
</div>

 