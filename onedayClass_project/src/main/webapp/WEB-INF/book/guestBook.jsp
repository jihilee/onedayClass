<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<style>
.select {
    padding: 20px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 40px;
    width: 120px;
    border: 1px solid #F4623A;
    line-height: 30px;
    text-align: center;
    font-weight:bold;
    font-size:16px;
}
.select input[type=radio]+label{
    background-color: #FFF; 
    color: #F4623A;
}
.select input[type=radio]:checked+label{
    background-color: #F4623A; 
    color: #FFF;
}
</style>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type='text/javascript'>
$(document).ready(function(){
	
	$.datepicker.setDefaults({
        dateFormat: 'yy/mm/dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
        prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
        nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
        closeText: '닫기', // 닫기 버튼 텍스트 변경
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
        showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
        yearSuffix: '년',	//
        showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
        minDate:1,
	    inline: true,
	    showOn: "focus",
	    show: "blind",
	    showOptions: {direction: 'horizontal'},
	    duration: 200
	});
	

    var early = false;
    
    $('#datepicker').datepicker().on("change",function(){
    	var b_day = $('#datepicker').val();
    	//alert(b_day);
    	$('#datepicker').val(b_day);
    	var now = new Date();
    	var b_cname = $('input[name="b_cname"]').val();
    	
    	$.ajax({
       		type : 'POST',
            url : 'selectBtime.bk',
            dataType : 'json',
       		data:{
       			b_day : b_day,
       			b_cname : b_cname
       		},
       		success:function(data){
       			alert(data+'성공');
       			
				$.each(data, function(index, item) { 
					$("#select").append("<input type='hidden' name='b_num' id='b_num' value='"+item.t_num+"'>"
										+"<input type='radio' id='select"+index+"' name='b_stime' value='"+item.t_stime+" "+item.t_etime+"'>"
										+"<label for='select"+index+"'>"+item.t_stime+"~"+item.t_etime+"</label>&nbsp;&nbsp;");
				}); 
       		},
       		error: function( request, status, error ){
       		    alert("status : " + request.status + ",<br> message : " 
       		    		+ request.responseText + ",<br> error : " + error);
       		}
       			
       	});
    	
    });
   
    $('#b_people').on("change",function(){
    	
    	var b_people = $('input[name="b_people"]').val();
    	
    	if(b_people>=5){
    		alert('클래스는 최대 4명의 인원으로만 진행됩니다.\n양해 부탁드립니다');
    		return false;
    	}
    	
    	var cprice = $('input[name="cprice"]').val();
    	var changed = b_people * cprice;
    	//alert(b_people);
    	//alert(changed);
    	$('#b_price').val(changed);
    });
    
    $('#submitBtn').click(function(){
    	var b_day = $('input[name="b_day"]').val();
        var b_stime = $('input[name="b_stime"]').val();
        
        //alert(b_day+'/'+b_stime);
        if(b_day == null){
        	alert('예약일을 먼저 설정해주세요');
    		return false;
        }
        
        if(b_stime == null){
        	alert('예약 시간을 설정해주세요');
    		return false;
        }
    });
    
});

</script>

<section class="page-section" id="Cls">	
	<div class="container">
	<div class="bs-docs-section">
	<form action="guestBook.bk" method="post">
		<input type="hidden" name="b_person" value="${mb.id }">
		<input type="hidden" name="cnum" value="${cb.cnum }">
		
	
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h3 id="containers"><b>예약하기</b></h3>
                    <hr class="divider" />
                </div>
            </div>
			
			 <div class="row justify-content-center mb-8">
                <div class="container px-4 px-lg-5 col-lg-7">
              
               <div class="form-group">
                <label for="b_day" class="form-label mt-4">클래스명</label>
                <input type="text" readonly class="form-control" name="b_cname" value="${cb.cname }">
              </div>
                
			  <div class="form-group">
                <label for="b_day" class="form-label mt-4">예약일</label>
                <input type="text" class="form-control" id="datepicker" name="b_day" value="${b_day }">
              </div>
              
			  <div class="form-group">
			  	 <label for="b_stime" class="form-label mt-4">예약시간</label>
                <div class="select" id="select">
				</div>
              </div>
              
              <div class="form-group">
                <label for="b_people" class="form-label mt-4">인원</label>
                <input class="form-control" type="text" name="b_people" id="b_people" value="1">
              </div>
              
              <div class="form-group">
                <label for="cprice" class="form-label mt-4">가격</label>
                <input class="form-control" readonly type="text" name="cprice" id="cprice" value="${cb.cprice }">
              </div>
              
              <div class="form-group">
                <label for="b_price" class="form-label mt-4">결제 예정액</label>
                <input class="form-control" readonly type="text" name="b_price" id="b_price" value="${cb.cprice *1}">
              </div>
              
              <div class="form-group">
              	 <label for="b_price" class="form-label mt-4">결제수단</label>
              	 <fieldset class="form-group">
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="b_paying" value="credit" checked>신용카드
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="b_paying" value="kakao">카카오   
                  </div>
                  </fieldset>
      		 </div>
      		  
              <div class="form-group">
                <input type="submit" id="submitBtn" class="btn btn-primary" value="결제하기" style="float:right;">
              </div>
			</div>
			</div>
		</div>
	</form>
	</div>
	</div>
</section>		


<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>