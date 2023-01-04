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
		
		$('#catedul').click(function(){
			
			checked = true;

			var bcate = $('input[name="bcate"]').val();
			var bcheck = /[ㄱ-힣a-zA-Z]{2,8}$/
			alert(bcheck.test(bcate));
			
			if(bcate==''){
				alert('대분류명이 누락되었습니다');
				return false;
			}
			else{
				if(!bcheck.test(bcate)){
					alert('대분류명은 3-7자 사이의 문자로 입력해주세요');
					return false;
				}
				else{
					$.ajax({
						url : "checkBcatedul.cate",
						data : ({ bcate : $('input[name="bcate"]').val() }),
						success : function(data){
							alert(data);
							if($.trim(data)=="Y"){
								$('#result').html("사용 가능한 대분류명 입니다");
								$('#result').css("color","blue");
								$('#result').show();
								checked = true;
								ischange = false;
							}
							else{
								$('#result').html("사용 불가한 대분류명 입니다");
								$('#result').css("color","red");
								$('#result').show();
								checked = false;
								ischange = true;
							}
						}//success
							
					}); //ajax
				}//if_else
			}
		});//catedul
		$('#submitbtn').click(function(){
			if(checked == false){
				alert('대분류명 중복체크는 필수입니다');	
			}
			if(ischange == true){
				alert('대분류명 수정 후 중복확인이 필요합니다');
				return false;
			}
		});
	});

</script>
<div class="bs-docs-section">
        <div class="page-header" style="margin-top:100px;">
          <div class="row">
            <div class="col-lg-12 text-center">
              <h3 id="buttons">대분류 카테고리 추가</h3>
            </div>
          </div>
        </div>
        <br>
  
	<div class="col-lg-12">
		<div class="bs-component">
		 
		 <form action="adminClsCateInsert.cate" method="post" align="center" enctype="multipart/form-data">
		 <table class="table table-hover" style="width:50%" align="center">
		 	<tr>
			 	<th class="table-active">대분류명</th> 
					<td>
						<div class="col-lg-8">
							<div class="input-group">
								<input type="text" class="form-control" name="bcate" value="">
								<button class="btn btn-primary" type="button" id="catedul">확인</button>
							</div>
							<span id="result"></span>
						</div>				
					</td>
				<tr>
			</tr>
			<tr>	
				<th  class="table-active">이미지</th> 	 		
				<td>
					<div class="col-lg-8">
						<input type="file" class="form-control"  name="upload">
					</div>
				</td>
			</tr>
		 </table>
		 
			<input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='adminClsCateList.cate'">
			<input class="btn btn-primary" type="submit" value="추가하기" id="submitbtn">
		 </form>
		</div>
	</div>
</div>

 