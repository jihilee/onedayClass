<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>
 
<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
            <div class="col-lg-12 text-center">
				<h4 id="buttons">소분류 목록 (총:${totalCount })</h4>
            </div>
          </div>
        </div>
        <br>
  		<form name="scateForm" method="post" align="center" action="adminScateList.cate">
        <div class="row" style="margin-left:20%;">
         <div class="col-lg-2">
            <div class="form-group">
               <select name="whatColumn" class="form-select" width="10%">
                  <option value="">전체검색</option>
                  <option value="bcate">대분류명</option>
                  <option value="scate">소분류명</option>
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
        
	<div class="col-lg-12">
		<div class="bs-component">
		 <table class="table table-hover" style="width:60%" align="center">
		 	<tr>
		 		<td colspan=4>
		 		<input type="button" value="추가하기" onclick="location.href='adminScateInsert.cate'" style="float:right;">
		 		</td>
		 	</tr>
		 	<tr class="table-active">
				<th>no</th> 	
				<th>대분류명</th> 	
				<th>소분류명</th> 	 	
				<th>관리</th> 	 	
		 	</tr>
		 	<c:forEach var="sc" items="${scateList }">
		 	<tr>
				<td><input type="text" readonly class="form-control-plaintext" name="scatenum" value="${sc.scatenum}"></td>
				<td><input type="text" readonly class="form-control-plaintext" name="bcate" value="${sc.bcate }"></td>
				<td><input type="text" readonly class="form-control-plaintext" name="scate" value="${sc.scate }"></td>
				<td>
					<input type="button" value="수정" onclick="location.href='adminScateUpdate.cate?scatenum=${sc.scatenum}&pageNumber=${pageInfo.pageNumber }'">
					<input type="button" value="삭제" onclick="location.href='adminScateDelete.cate?scatenum=${sc.scatenum}&pageNumber=${pageInfo.pageNumber }'">
				</td>
		 	</tr>
		 	</c:forEach>
		 </table>
		</div>
	</div>
</div>

 <div align="center">${pageInfo.pagingHtml }</div>