<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>
<style>
	.err{
		color:red;
		font-size:10px;
	}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">
	$('document').ready(function(){
		
		checked = false;
		ischange = false;
		
		$('#scatedul').click(function(){
			//alert(1);

			var scate = $('input[name="scate"]').val();
			
			var scheck = /[ㄱ-힣a-zA-Z]{1,11}$/
			alert(scheck.test(scate));
			alert(scate);
			
			if(scate==''){
				alert('대분류명이 누락되었습니다');
				return false;
			}
			if(!scheck.test(scate)){
				alert('소분류명은 2-10자 사이의 문자로 입력해주세요');
				return false;
			}
			else{
				$.ajax({
					url : "checkScatedul.cate",
					data : ({ scate : $('input[name="scate"]').val() }),
					success : function(data){
						alert(data);
						if($.trim(data)=="Y"){
							$('#result').html("사용 가능한 소분류명 입니다");
							$('#result').css("color","blue");
							$('#result').show();
							checked = true;
							ischange = false;
						}
						else{
							$('#result').html("사용 불가한 소분류명 입니다");
							$('#result').css("color","red");
							$('#result').show();
							checked = false;
							ischange = true;
						}
					}//success
						
				}); //ajax
			}//if_else
		});//catedul

		$('#submitbtn').click(function(){
			if(checked == false){
				alert('소분류명 중복체크는 필수입니다');	
			}
			if(ischange == true){
				alert('소분류명 수정 후 중복확인이 필요합니다');
				return false;
			}
		});
	});

</script>
<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
            <div class="col-lg-12 text-center">
              <h3 id="buttons">소분류 카테고리 수정</h3>
            </div>
          </div>
        </div>
        <br>
  ${pageNumber}
	<div class="col-lg-12">
		<div class="bs-component">
		 
		 <form action="adminScateInsert.cate" method="post" align="center">
		 	<input type="hidden" name="scatenum" value="${scateBean.scatenum}">
		 	<input type="hidden" name="pageNumber" value="${pageNumber}">
		 <table class="table table-hover" style="width:50%" align="center">
		 	
		 	<tr>
			 	<th class="table-active">대분류명</th> 
					<td> 
						<div class="col-lg-8">
							<select class="form-select" name="bcate">
                      	 		<option value=""> 대분류명을 선택하세요 </option>
		                            <c:forEach var="clist" items="${cateList }">
		                                <option value="${clist.bcate }" > 
		                                   ${clist.bcate }
		                                </option>
		                            </c:forEach>
							</select>
						</div>				
					</td>
				<tr>
			</tr>
			<tr>	
				<th  class="table-active">소분류명</th> 	 		
				<td>
					<div class="col-lg-8">
						<div class="input-group">
							<input type="text" class="form-control" name="scate" value="${scateBean.scate }">
							<button class="btn btn-primary" type="button" id="scatedul">확인</button>
						</div>
						<span id="result"></span>	
					</div>
				</td>
		
			</tr>
		 </table>
		 
			<input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='adminScateList.cate'">
			<input class="btn btn-primary" type="submit" value="추가하기">
		 </form>
		</div>
	</div>
</div>

 