<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/topAndBottom/top.jsp" %>   

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript">

	$('document').ready(function(){
		//alert(1);
		var nameCheck= /[ㄱ-힣a-zA-Z]$/;
		var phCheck = /[0-9]{9,13}$/;
		var pwCheck = /[a-zA-Z0-9]{4,9}$/;
		
		var checked = false; // 중복체크 눌렀는지
		var isChange = false; //중복확인실패후 변경했는지
		
		$('#emailbtn').click(function(){	
			//alert(1);
			checked = true;
			
			var emailCheck = /^([a-zA-z0-9]+)@([a-zA-Z0-9]+)(\.[a-zA-Z0-9]+)$/;
			
			var gu_email = $('input[name="gu_email"]').val();

			var email = $('input[name="email"]').val();
			if(email == ""){
				alert("이메일이 누락되었습니다");
				$('input[name="email"]').focus();
				return false;
			}
			else if(email == gu_email){
				alert("수정된 내용이 없습니다");
				return false;
			}
			else{
				if(!emailCheck.test(email)){
					alert("이메일 형식으로 입력하세요");
					return false;
				}
				else{
					$.ajax({
						url : "myEmailcheck.mb",
						data : ({ email : $('input[name="email"]').val() }),
						success : function(data){
							//alert(data);
							if($.trim(data)=="Y"){
								$('#result').html("사용 가능한 이메일입니다");
								$('#result').css("color","blue");
								$('#result').show();
								checked = true;
								isChange = false;
							}
							else{
								$('#result').html("이미 등록된 이메일입니다");
				                  $('#result').css('color','red');
				                  $('#result').show();
				                  isChange = true;
				                  checked = false;
							}
						}//success
					}); //ajax	
				}
			}
	
		}); //emailbtn
		
		$('#submitButton').click(function(){
			alert(1);
			
			var pw = $('input[name="pw"]').val();
			alert(pw);
			if(pw == ""){
				alert("비밀번호가 누락되었습니다");
				$('input[name="pw"]').focus();
				return false;
			}
			alert(!pwCheck.test(pw))
			if(!pwCheck.test(pw)){
				alert('비밀번호는 5-8사이의 숫자,알파벳을 혼합하여 입력하세요');
				$('input[name="pw"]').focus();
				return false;
			}

			var repw = $('input[name="repw"]').val();
			alert(repw);
			if(repw == ""){
				alert("비밀번호 확인이 필요합니다");
				$('input[name="repw"]').focus();
				return false;
			}
			
			if(repw != pw){
				alert("비밀번호가 일치하지 않습니다");
				$('input[name="repw"]').focus();
				return false;
			}
			
			var name = $('input[name="name"]').val();
			alert(name);
			if(name==""){
				alert("이름이 누락되었습니다");
				$('input[name="name"]').focus();
				return false;
			}
			
			if(!nameCheck.test(name)){
				alert("이름은 한글 혹은 영어로 기입해주세요");
				$('input[name="name"]').focus();
				return false;
			}
			
			var ph = $('input[name="ph"]').val();
			alert(ph);
			if(ph == ""){
				alert("전화번호가 누락되었습니다");
				$('input[name="ph"]').focus();
				return false;
			}
			
			if(!phCheck.test(ph)){
				alert("전화번호는 10-12자 사이의 숫자로만 입력하세요");
				$('input[name="ph"]').focus();
				return false;
			}
		
			if(checked == false){
				alert('이메일 중복체크는 필수입니다');	
				return false;
			}
			
			if(ischange == true){
				alert('이메일 수정 후 중복확인이 필요합니다');
				return false;
			}
		});

		/*  */
	});


</script>

	<section style="margin-top:100px;">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h3 class="containers"><b>회원정보수정</b></h3>
                        <hr class="divider" />
                        <p class="text-muted mb-5">세상 모든 취미 여가의 시작! 원데이가 함께합니다</p>
                    </div>
                </div>
                
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
               <form id="updateMyData" action="guestMyUpdate.mb" method="post">
                	<input type="hidden" name="num" value="${mb.num }">
                	<input type="hidden" name="gu_email" value="${mb.email }">
				  <div class="form-group">
                    <label for="name" class="form-label mt-4">이름</label>
                    <input type="text" class="form-control" id="name" name="name" value="${mb.name }">
                  </div>
                   <div class="form-group">
                  	<label for="id" class="form-label mt-4">아이디</label>
                  	 <input type="text" readonly class="form-control-plaintext" id="id" name="id" value="${mb.id }">
                  </div>
                  <div class="form-group">
                    <label for="pw" class="form-label mt-4">비밀번호</label>
                    <input type="password" class="form-control" name="pw" id="pw" >
                  </div>
                  <div class="form-group">
                    <label for="repw" class="form-label mt-4">비밀번호 확인</label>
                    <input type="password" class="form-control" name="repw" id="repw">
                  </div>
                   <div class="form-group">
                  	<label for="email" class="form-label mt-4">이메일</label>
                  	<div class="input-group">
                    <input type="text" class="form-control" name="email" value="${mb.email }">
                    <button class="btn btn-primary" type="button" id="emailbtn">확인</button>
                    </div>
                    <span id="result"></span>
                  </div>
                  <div class="form-group">
                    <label for="ph" class="form-label mt-4">전화번호</label>
                    <input type="text" class="form-control" id="ph" name="ph" value="${mb.ph }">
                  </div>	
                  <br>
				  <div class="form-group">
                    <input type="submit" class="btn btn-primary" id="submitButton" style="width:100%" value="확인">
                  </div>
                    <br>
                  	<input type="button" class="btn btn-link" value="회원 탈퇴하기" onclick="#" style="float:right;">
            
                        </form>
                    </div>
                </div>
            </div>
            
            
            
            <%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>
        </section>