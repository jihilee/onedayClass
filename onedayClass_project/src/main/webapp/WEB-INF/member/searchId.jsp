<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/topAndBottom/top.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
<script src="resources/js_main/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

	<section style="margin-top:100px;">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h4 class="mt-0">아이디 찾기</h4>
                        <hr class="divider" />
                        <p class="text-muted mb-5">세상 모든 취미 여가의 시작! 원데이가 함께합니다</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN" action="searchId.mb" method="post">
                            
                            <!-- name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" name="name" type="text" placeholder="name" data-sb-validations="required" />
                                <label for="name">이름</label>
                            </div>
                            
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name="email" type="text" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">이메일</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">이메일이 누락되었습니다</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">올바른 이메일 형식이 아닙니다.</div>
                            </div>
                           
                            <div class="d-grid"><button class="btn btn-primary btn-xl" id="submitButton" type="submit">아이디 찾기</button></div>
                        </form>
                    </div>
                </div>
            </div>
       </section>