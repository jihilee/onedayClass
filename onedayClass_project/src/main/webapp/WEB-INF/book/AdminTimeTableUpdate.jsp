<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

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
    	
    	var t_num = $('#t_num').val();
    	var t_day = $('#datepicker').val();
    	var t_cname = $('#t_cname').val();
    	
    	$('#datepicker').val(t_day);
    	
    	alert(t_day);
    	location.href="AdminTimeTableUpdate.bk?t_num="+t_num+"&t_day="+t_day+"&t_cname="+t_cname;
    	
    });
    
    //alert(b_day);
    $('#t_stime').click(function(){
    	var t_day = $('input[name="t_day"]').val();
    	//alert(t_day)
    	if(t_day == ""){
    		alert('예약일을 먼저 설정해주세요');
    		return false;
    	}
    });
     
});

</script>

<%
String[] time = {"10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00"};
pageContext.setAttribute("time", time);
%> 

<section class="page-section">	
	<div class="container">
	<div class="bs-docs-section">
	<form action="timeTableUpdate.bk" method="post">
		<input type="hidden" name="t_num" id="t_num" value="${tb.t_num }">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h3 id="containers"><b>클래스 타임테이블 수정</b></h3>
                    <hr class="divider"/>
                </div>
            </div>
			
			 <div class="row justify-content-center mb-8">
                <div class="container px-4 px-lg-5 col-lg-7">
              
              <div class="form-group">
                <label for="" class="form-label mt-4">클래스</label>
              	<input class="form-control" readonly name="t_cname" id="t_cname" value="${tb.t_cname }">
              </div>
              
			  <div class="form-group">
                <label for="t_day" class="form-label mt-4">예약일</label>
                <input type="text" class="form-control" id="datepicker" name="t_day" value="${t_day }">
              </div>
              
			  <div class="form-group">
                <label for="t_stime" class="form-label mt-4">예약시간</label>
                <select name="t_stime" class="form-control">
                	<option value="">예약시간을 입력하세요</option>
                	<c:forEach var="t" items="${time }">
                	<option value="${t }" 
	                	<c:forEach var="bb" items="${B_dayDulList }">
		                	<c:if test="${bb.t_stime eq t || bb.t_etime eq t || (bb.t_stime < t && bb.t_etime > t)}"> 
		                		disabled 
		                	</c:if>
	                	</c:forEach>
                	>${t }
                	</option>  
                	
                	</c:forEach>           
                </select>
              </div>
      		  <br>
              <div class="form-group">
                <input type="submit" class="btn btn-primary" value="수정하기" style="float:right;">
              </div>
			</div>
			</div>
		</div>
	</form>
	</div>
	</div>
</section>		


<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>