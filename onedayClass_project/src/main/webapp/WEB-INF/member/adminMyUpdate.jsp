<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script>
function findDaumPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        var addressCompany = data.address;
        document.getElementById("caddress").value = addressCompany; // 주소 넣기
        }
    }).open();
  }
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>  
  $('document').ready(function(){
	//alert(1);
		var nameCheck= /[ㄱ-힣a-zA-Z]$/;
		var phCheck = /[0-9]{9,13}/;
		var pwCheck = /[a-zA-Z0-9]{4,9}$/;
	
		var idchecked = false; // 중복체크 눌렀는지
		var idisChange = false; //중복확인실패후 변경했는지
		
		$('#idbtn').click(function(){	
			//alert(1);
			idchecked = true;
			
			var idCheck = /[a-zA-Z0-9]{4,9}$/;;
			var id = $('input[name="id"]').val();
			var gu_id = $('input[name="gu_id"]').val();
			
			if(id==''){
				alert("아이디가 누락되었습니다");
				$('input[name="id"]').focus();
				return false;
			}
			else if(id==gu_id){
				alert("Y");
			}
			else{
				if(!idCheck.test(id)){
					alert("5-8사이의 알파벳과 숫자를 조합한 문자를 입력하세요");
					return false;
				}	
				else{
					$.ajax({
						url : "adminIdCheck.mb",
						data : ({ id : $('input[name="id"]').val() }),
						success : function(data){
							//alert(data);
							if($.trim(data)=="Y"){
								$('#result').html("사용 가능한 아이디입니다");
								$('#result').css("color","blue");
								$('#result').show();
								idchecked = true;
								idisChange = false;
							}
							else{
								$('#result').html("이미 등록된 아이디입니다");
				                  $('#result').css('color','red');
				                  $('#result').show();
				                  idisChange = true;
				                  idchecked = false;
							}
						
						}//success
					}); //ajax	
				}//else
			}
			
		}); //id_click
		
		
		var checked = false; // 중복체크 눌렀는지
		var isChange = false; //중복확인실패후 변경했는지
		
		$('#emailbtn').click(function(){	
			//alert(1);
			checked = true;
			
			var emailCheck = /^([a-zA-z0-9]+)@([a-zA-Z0-9]+)(\.[a-zA-Z0-9]+)$/;
			var email = $('input[name="email"]').val();
			var gu_email = $('input[name="gu_email"]').val();
			
			if(email == ""){
				alert("이메일이 누락되었습니다");
				$('input[name="email"]').focus();
				return false;
			}
			else if(email==gu_email){
				alert("Y");
			}
			else{
				if(!emailCheck.test(email)){
					alert("이메일 형식으로 입력하세요");
					return false;
				}	
				else{
					$.ajax({
						url : "adminEmailCheck.mb",
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
				}//else
			}
			
		}); //email_click
		
		$('#submitButton').click(function(){
			var id = $('input[name="id"]').val();
			if(id == ""){
				alert("아이디가 누락되었습니다");
				$('input[name="id"]').focus();
				return false;
			}

			if(idisChange==true){
				alert('아이디 수정 후 중복확인이 필요합니다');
				return false;
			}
			
			if(idchecked==false){
				alert('아아디 중복체크는 필수입니다');
				return false;
			}
			if(isChange==true){
				alert('이메일 수정 후 중복확인이 필요합니다');
				return false;
			}
			
			if(checked==false){
				alert('이메일 중복체크는 필수입니다');
				return false;
			}
			var pw = $('input[name="pw"]').val();
			if(pw == ""){
				alert("비밀번호가 누락되었습니다");
				$('input[name="pw"]').focus();
				return false;
			}
			if(!pwCheck.test($("#pw").val())){
				alert('비밀번호는 5-8사이의 숫자,알파벳을 혼합하여 입력하세요');
				$('input[name="pw"]').focus();
				return false;
			}

			var repw = $('input[name="repw"]').val();
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
			if(name==""){
				alert("이름이 누락되었습니다");
				$('input[name="name"]').focus();
				return false;
			}
			
			if(!nameCheck.test($("#name").val())){
				alert("이름은 한글 혹은 영어로 기입해주세요");
				$('input[name="name"]').focus();
				return false;
			}
			
			var ph = $('input[name="ph"]').val();
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
			
			var caddress = $('input[name="caddress"]').val();
			if(caddress == ""){
				alert("주소가 누락되었습니다");
				$('input[name="caddress"]').focus();
				return false;
			}
			
			var clocation = $('input[name="clocation"]').val();
			if(clocation == ""){
				alert("경도/위도가 누락되었습니다");
				$('input[name="clocation"]').focus();
				return false;
			}

		});

  });
  
</script>

<div class="container">
<div class="bs-docs-section">
	<form action="adminMypageUpdate.mb" method="post">
		                <input type="hidden" class="form-control" name="num" value="${mb.num }">
		                <input type="hidden" class="form-control" name="gu_id" value="${mb.id }">
		                <input type="hidden" class="form-control" name="gu_email" value="${mb.email }">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8  text-center">
                    <h3 id="containers"><b>관리자 정보 수정</b>
           			</h3>
                    <hr class="divider" />
                </div>
            </div>

            <div class="row justify-content-center mb-8">
                <div class="col-lg-8">

			  <div class="form-group">
                <label for="name" class="form-label mt-4">관리자명</label>
                <input type="text" class="form-control" id="name" name="name" value="${mb.name }">
              </div>
			  <div class="form-group">
                <label for="id" class="form-label mt-4">관리자아이디</label>
                <div class="input-group">
                <input type="text" class="form-control" id="id" name="id" value="${mb.id }">
                <input type="button" class="btn btn-secondary" value="중복체크" id="idbtn">
                </div>
                <span id="result"></span>
              </div>
              <div class="form-group">
                <label for="pw" class="form-label mt-4">비밀번호</label>
                <input type="password" class="form-control" name="pw" value="${mb.pw }">
              </div>
              <div class="form-group">
                <label for="repw" class="form-label mt-4">비밀번호 확인</label>
                <input type="password" class="form-control" name="repw" >
              </div>
              <div class="form-group">
                <label for="email" class="form-label mt-4">관리자이메일</label>
                <div class="input-group">
                <input type="email" class="form-control" name="email" value="${mb.email }">
                <input type="button" class="btn btn-secondary" value="중복체크" id="emailbtn">
                </div>
              </div>
              <div class="form-group">
                <label for="ph" class="form-label mt-4">관리자 연락처</label>
                <input type="text" class="form-control" name="ph" value="${mb.ph }">
              </div>
           	  <div class="form-group">
                 <label for="cinfo" class="form-label mt-4">공방주소</label>
              	 <div class="input-group">
              	 <input type="text" id="caddress" class="form-control" name="caddress" templatename="TextBox" 
              	 autocomplete="off"  componentid="txtDINE" class="txtDINE"  value="${cb.caddress }">
              	 <button id="btnSearchAddressC" type="Button" onclick="findDaumPostcode()" 
					value="우편번호 찾기" templatename="Button" multi-language="true" 
					language-code="SearchAddress" componentid="PopupBtn" class="btn btn-secondary" 
					tabindex="84" translate>
					우편번호 찾기</button>
				</div>
              </div>
           	  <div class="form-group">
                 <label for="cinfo" class="form-label mt-4">주소 경도,위도</label>
                 <div class="input-group">
                 <input type="text" class="form-control" name="clocation" value="${cb.clocation }">
     			 </div>
              </div>
              <div class="form-group">
              	<br>
                <input type="submit" class="btn btn-outline-secondary" 
                	value="수정" style="float:right;" id="submitButton">
              </div>
              </div>
            </div>
        </div>
</form></div></div>


<%@ include file="/WEB-INF/topAndBottom/bottom.jsp" %>