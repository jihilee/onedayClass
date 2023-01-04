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
	//alert(1);
	var cinfoCheck = /[ㄱ-힣a-zA-Z]{1,100}$/;
	var ccontentCheck = /[ㄱ-힣a-zA-Z]{1,100}$/;
	
	$('#submitButton').click(function(){
		var cname = $('input[name="cname"]').val();
		if(cname == ""){
			alert("클래스명이 누락되었습니다");
			$('input[name="cname"]').focus();
			return false;
		}

		var ctime = $('input[name="ctime"]').val();
		if(ctime == ""){
			alert("클래스 소요시간이 누락되었습니다");
			$('input[name="ctime"]').focus();
			return false;
		}
		if(isNaN(ctime)){
			alert("클래스 소요시간은 분으로 환산한 숫자로 입력해주세요");
			$('input[name="ctime"]').focus();
			return false;
		}
		
		var cprice = $('input[name="cprice"]').val();
		if(cprice == ""){
			alert("가격이 누락되었습니다");
			$('input[name="cprice"]').focus();
			return false;
		}
		if(isNaN(cprice)){
			alert("가격은 숫자로 입력해주세요");
			$('input[name="cprice"]').focus();
			return false;
		}

		var cinfo = $('input[name="cinfo"]').val();
		if(cinfo==""){
			alert("클래스 정보1이 누락되었습니다");
			$('input[name="cinfo"]').focus();
			return false;
		}
		if(!cinfoCheck.test(cinfo)){
			alert("클래스 정보1는 100자 미만으로 기입해주세요");
			$('input[name="cinfo"]').focus();
			return false;
		}
		
		var ccontent = $('input[name="ccontent"]').val();
		if(ccontent==""){
			alert("클래스 정보2이 누락되었습니다");
			$('input[name="ccontent"]').focus();
			return false;
		}
		if(!ccontentCheck.test(ccontent)){
			alert("클래스 정보2는 100자 미만으로 기입해주세요");
			$('input[name="ccontent"]').focus();
			return false;
		}

	});

});


</script>

<div class="container">
<div class="bs-docs-section">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-lg-8 col-xl-6 text-center">
                    <h3 id="containers"><b>클래스 추가</b></h3>
                    <hr class="divider" />
                </div>
            </div>
            
            <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                <div class="col-lg-6">
            <form id="adminClsInsert" action="adminClsInsert.cls" method="post" enctype="multipart/form-data">
            
			  <div class="form-group">
                <label for="cname" class="form-label mt-4">클래스명</label>
                <input type="text" class="form-control" id="cname" name="cname">
              </div>
			  <div class="form-group">
                <label for="ctime" class="form-label mt-4">소요시간</label>
                <input type="text" class="form-control" id="ctime" name="ctime">
              </div>
              <div class="form-group">
                <label for="cprice" class="form-label mt-4">가격</label>
                <input type="text" class="form-control" name="cprice">
              </div>
           	  <div class="form-group">
                 <label for="cinfo" class="form-label mt-4">클래스정보1</label>
                 <textarea class="form-control" id="cinfo" rows="3" name="cinfo"></textarea>
              </div>
           	  <div class="form-group">
                 <label for="ccontent" class="form-label mt-4">클래스정보2</label>
                 <textarea class="form-control" id="ccontent" rows="5" name="ccontent"></textarea>
              </div>
              <div class="form-group">
                 <label for="upload1" class="form-label mt-4">이미지1</label>
             	 <input type="file" class="form-control"  name="upload1">
              </div>
              <div class="form-group">
                 <label for="upload2" class="form-label mt-4">이미지2</label>
             	 <input type="file" class="form-control"  name="upload2">
              </div>
              <div class="form-group">
                 <label for="upload3" class="form-label mt-4">이미지3</label>
             	 <input type="file" class="form-control"  name="upload3">
              </div>
			  <div class="form-group">
			  <br><br>
                <input type="submit" class="btn btn-outline-secondary" id="submitButton" style="width:100%" value="완료">
              </div>
              	
                    </form>
                </div>
            </div>
        </div>
        </div></div>
<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>