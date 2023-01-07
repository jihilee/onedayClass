<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="kr">
    <head>
    <c:if test="${loginInfo.id ne 'admin'}">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BB WOOD</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <c:if test="${loginInfo.id ne 'admin'}">
        <link href="<%=request.getContextPath() %>/resources/css_main/styles.css" rel="stylesheet" />
        </c:if>
    </c:if>
    </head>
    <body id="page-top" class="bg-light py-0">
    
        <!-- Navigation-->
        <c:if test="${loginInfo.id ne 'admin'}">
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="GuestClsMain.cls">BB WOOD</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    	<c:if test="${loginInfo eq null }">
                        	<li class="nav-item"><a class="nav-link" href="GuestClsMain.cls?id=#login">LOGIN</a></li>
                        </c:if>
                        <c:if test="${loginInfo ne null }">
                        	<li class="nav-item"><a class="nav-link" href="guestMypage.mb?id=#MyPage">MyPage</a></li>
                        </c:if>
                        <li class="nav-item"><a class="nav-link" href="GuestClsMain.cls?id=#Cls" >CLASS</a></li>
                        <li class="nav-item"><a class="nav-link" href="GuestClsMain.cls?id=#info">INFO</a></li>
                        <c:if test="${loginInfo ne null }">
                        <li class="nav-item"><a class="nav-link" href="logout.mb">Logout</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        </c:if>
        
        <!-- login == null -->
        <c:if test="${loginInfo ne null and loginInfo.id ne 'admin'}">
        <section class="page-section bg-primary" id="MyPage">
            <div class="container px-4 px-lg-5"><br><br>
                <div class="row justify-content-center text-white">
                <div class="text-center">
                    <h2 class="mt-0">MY WODE</h2>
                    <hr class="divider divider-light" /><br>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
	                            <input type="button" value="내 정보" class="btn btn-light btn-xl" style="width:80%; font-size:20px;"
		     					 onclick="location.href='guestMypage.mb'" />  
                        </div>
                 </div>
                 <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
	                            <input type="button" value="예약 내역" class="btn btn-light btn-xl" style="width:80%; font-size:20px;"
		     					 onclick="location.href='guestBookList.bk'" />  
                        </div>
                 </div>
                 <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
	                            <input type="button" value="내가 작성한 후기" class="btn btn-light btn-xl" style="width:80%; font-size:20px;"
		     					 onclick="location.href='myReviewList.rv'" />  
                        </div>
                 </div>
                 <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
	                            <input type="button" value="내가 작성한 문의" class="btn btn-light btn-xl" style="width:80%; font-size:20px;"
		     					 onclick="location.href='#'" />  
                        </div>
                 </div> 
	     	</div>
	     </div>
	     </section>
        </c:if>
        
        <!-- login == null -->
      <c:if test="${loginInfo ne null and loginInfo.id eq 'admin'}">
      <div class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
      <div class="container">
        <a href="../" class="navbar-brand">ADMIN</a><br><br>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="adminBookList.bk" id="download">회원/예약</a>
              <div class="dropdown-menu" aria-labelledby="download">
              <a class="nav-link" href="AdminMemberList.mb">회원 목록</a>
              <div class="dropdown-divider"></div>
              <a class="nav-link" href="adminBookList.bk">예약 목록</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="adminClsList.cls" id="download">클래스</a>
              <div class="dropdown-menu" aria-labelledby="download">
                <a class="dropdown-item" href="adminClsList.cls">클래스 목록</a>
                <a class="dropdown-item" href="adminClsInsert.cls">클래스 추가</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="AdminTimeTableList.bk" id="download">타임테이블</a>
              <div class="dropdown-menu" aria-labelledby="download">
                <a class="dropdown-item" href="AdminTimeTableList.bk">타임테이블 목록</a>
                <a class="dropdown-item" href="AdminTimeTableInsert.bk">타임테이블 추가</a>
              </div>
            </li>
          </ul>
          
           <ul class="navbar-nav ms-md-auto">
            <li class="nav-item">
              <a target="_blank" rel="noopener" class="nav-link" href="logout.mb"><i class="bi bi-github"></i>Logout</a>
            </li>
          </ul>
          
          </div>
          </div>
          </div>
          <br><br><br><br>
        </c:if>