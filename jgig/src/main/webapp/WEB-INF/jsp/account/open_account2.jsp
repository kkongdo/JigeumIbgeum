<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>계좌개설</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="apple-touch-icon" href="/assets/img/apple-touch-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/assets/css/fontawesome.min.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
		function password_check(){
			$(".pw").keyup(function(){
				let pass1 = $("#password1").val()
				let pass2 = $("#password2").val()
				
				if(pass1 != "" || pass2 != ""){
					if(pass1 == pass2){
						$("#checkPw").html("비밀번호가 일치합니다.").css("color", "green")
						$("#submitButton").prop("disabled", false)
					}else{
						$("#checkPw").html("비밀번호가 불일치합니다. 다시 입력해주세요.").css("color", "red")
						$("#submitButton").prop("disabled", true)
					}
				}
			})
		}
		
		function advice_balloon(){
			$('#advice-balloonCheckbox').change(function() {
				if (this.checked) {
					$('.advice-balloon1_account2').show()
					$('.advice-balloon2_account2').show()
					$('.advice-balloon3_account2').show()
					console.log('말풍선을 표시합니다.')
				} else {
					$('.advice-balloon1_account2').hide()
					$('.advice-balloon2_account2').hide()
					$('.advice-balloon3_account2').hide()
					console.log('말풍선을 숨깁니다.')
				}
			})
		}
		function togglePasswordVisibility() {
		    var passwordInput = document.querySelector("#password1")
		    var eyeIcon = document.querySelector("#eye-icon")

		    eyeIcon.addEventListener("click", function() {
		        if (passwordInput.type === "password") {
		            passwordInput.type = "text"
		            eyeIcon.classList.remove("fa-eye")
		            eyeIcon.classList.add("fa-eye-slash")
		        } else {
		            passwordInput.type = "password"
		            eyeIcon.classList.remove("fa-eye-slash")
		            eyeIcon.classList.add("fa-eye")
		        }
		    })
		    
		    passwordInput.type = "password"  
		}
		
		$(function(){
			advice_balloon()
			togglePasswordVisibility()
			password_check()
		})
	</script>
</head>

<body>

    <!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow navcolor">
	    <div class="container d-flex justify-content-between align-items-center">
	
	        <a class="navbar-brand text-success logo h1 align-self-center" href="/jgig/">
	            <img src="/assets/img/KB-logo.png" width="30" height="30" alt="">
	            <img src="/assets/img/jgig-icon.png"  height="45" alt="">
	        </a>
	
	        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button> <!-- 화면 작아질시 토글바 -->
	
	        <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
	            <div class="flex-fill">
	                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
	                      <li class="nav-item dropdown">
	                        <a class="nav-link " role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        금융거래연습
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a class="dropdown-item" href="/jgig/open_account1">계좌 개설</a></li>
	                         <li><a class="dropdown-item" href="/jgig/account_list">계좌 조회 및 이체</a></li>
	                         <li><a class="dropdown-item" href="/jgig/trans_history">거래 내역 조회</a></li>
	                         <hr>
	                         <li><a class="dropdown-item" href="/jgig/card_issuance">카드 발급</a></li>
	                         <li><a class="dropdown-item" href="/jgig/card_list">카드 조회 및 관리</a></li>
	                         <hr>
	                         <li><a class="dropdown-item" href="/jgig/certification">인증서 발급</a></li>
	                        </ul>
	                    </li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link " role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        금융교육
	                        </a>
	                        <ul class="dropdown-menu">
	                             <li><a class="dropdown-item" href="/jgig/searchWord">금융 용어 검색</a></li>
	                         <li><a class="dropdown-item" href="/jgig/quiz">금융 상식 퀴즈</a></li>
	                         <hr>
	                         <li><a class="dropdown-item" href="/jgig/guide">이용 가이드</a></li>
	                        </ul>
	                    </li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link " role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        커뮤니티
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a class="dropdown-item" href="/jgig/notice_list">공지사항</a></li>
	                         <li><a class="dropdown-item" href="/jgig/board_list">게시판</a></li>
	                         <li><a class="dropdown-item" href="/jgig/board_my_list_action">내가 쓴 글</a></li>
	                        </ul>
	                    </li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link " role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        지점찾기
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a class="dropdown-item" href="/jgig/findStore">지점찾기 및 번호표 발행</a></li>
	                         <li><a class="dropdown-item" href="/jgig/detailWaiting">번호표 조회 및 취소</a></li>
	                        </ul>
	                    </li>
	                    <li class="nav-item dropdown">
	                        <a class="nav-link " role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        마이포인트
	                        </a>
	                        <ul class="dropdown-menu">
	                            <li><a class="dropdown-item" href="/jgig/point_list">포인트 조회</a></li>
	                         <li><a class="dropdown-item" href="/jgig/point_conversion">포인트 전환</a></li>
	                        </ul>
	                    </li>
	                </ul>
	            </div>
	            <div class="navbar align-self-center d-flex">
	                <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
	                    <div class="input-group">
	                        <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
	                        <div class="input-group-text">
	                            <i class="fa fa-fw fa-search"></i>
	                        </div>
	                    </div>
	                </div>
	                <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
	                
	                    <!--로그인 했을 때 -->
	                    <c:if test="${not empty sessionScope.mem_id}">
	                        <li class="nav-item dropdown">
	                            <a class="nav-icon position-relative text-decoration-none nav-link"
	                                 role="button" data-bs-toggle="dropdown"
	                                aria-haspopup="true" aria-expanded="false"> <i
	                                    class="fa fa-fw fa-user text-dark mr-3"></i>
	                                ${sessionScope.mem_nm}님 <!--session값으로 받아오기 -->
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a class="dropdown-item" href="/jgig/member_detail?mem_id=${sessionScope.mem_id}">마이페이지</a></li>
	                            </ul>
	                        </li>
	                        <li class="nav-item"><a class="nav-link" href="/jgig/logout">로그아웃</a>
	                        </li>
	                    </c:if>
	                    
	                    <!--로그인 안 했을 때 -->
	                    <c:if test="${empty sessionScope.mem_id}">
	                        <li class="nav-item"><a class="nav-link" href="/jgig/login">로그인</a>
	                        </li>
	                        <li class="nav-item"><a class="nav-link" href="/jgig/register">회원가입</a>
	                        </li>
	                    </c:if>
	                </ul>
	            </div>
	        </div>
	    </div>
	</nav>
	<!-- Close Header -->
	<div class="container py-5">
		<div class="row">

			<div class="col-lg-2">
				<div class="sidemenubox">
					<h2 class="h3 pt-3 ">금융거래연습</h2>
					<hr>
					<ul class="list-unstyled ">
						<li>
							<a class="collapsed d-flex justify-content-between text-decoration-none selectsidemenu" href="open_account1"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 -->
								계좌 개설
							</a>
						</li>
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none" href="account_list">
								계좌 조회 및 이체
							</a>
						</li>
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none" href="trans_history">
								거래 내역 조회
							</a>
						</li>
						<hr>
						<li>
						<a class="collapsed d-flex justify-content-between text-decoration-none" href="card_issuance"> 카드발급 </a></li>
						<li>
						<a class="collapsed d-flex justify-content-between text-decoration-none" href="card_list"> 카드 조회 및 관리 </a></li>
						<hr>
						<li>
						<a class="collapsed d-flex justify-content-between text-decoration-none" href="certification"> 인증서 발급 </a></li>
					</ul>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="advice-tooltip">
					<fieldset class="advice-location">
						<label for="tooltipCheckbox"><strong
							class="advice-tooltip">도움말</strong></label> <input type="checkbox"
							id="advice-balloonCheckbox">
					</fieldset>
				</div>
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu  pt-5 pl-3">
							<h2>계좌 개설</h2>
						</ul>
					</div>
				</div>
				<div class="row">
					<div id="service-content"> 
						<!-- 여기에 넣으시며 됩니당 -->
						<form action="open_action" method = "post">
							<input type = "hidden" name = "act_name" value = "${act_name}" >
							<input type = "hidden" name = "mem_nm" value = "${mem_nm}">
							<input type = "hidden" name = "ssn" value = "${ssn}">
							<input type = "hidden" name = "balance" value = 0>
							<input type = "hidden" name = "phone_num" value = "${phone_num}">
							<input type = "hidden" name = "mem_id" value = "${mem_id}">
							<div style = "text-align:center">
								<div style="display:inline-block; width: 130px; text-align: left;  margin-right: 350px;" >
									<h3 class="font-weight-bold">개인 정보</h3>
									<br>
								</div>
							</div>
							<div class="advice-balloon advice-balloon1_account2">
								<strong style = "font-weight : bold;">1. 개인정보를 다음 순서대로 입력해주세요.</strong>
								<br>
								&nbsp; 1. 직업구분을 선택해주세요.
								<br>
								&nbsp; 2. 거래목적을 선택해주세요.
								<br>
								&nbsp; 3. 거래 자금의 원천을 선택해주세요.
								<br>
							</div>
							
							<div style = "text-align:center">
								<div style="display:inline-block; width: 130px; text-align: left;">직업구분</div>
								<select name = "job" style="width: 150px;" required>
									<option value = "" disabled selected>직업</option>
									<option value ="회사원">회사원</option>
									<option value ="전문직">전문직</option>
									<option value ="자영업">자영업</option>
									<option value ="주부">주부</option>
									<option value ="무직">무직</option>
									<option value ="학생">학생</option>
								</select>
								<br><br>
								<div style="display:inline-block; width: 130px; text-align: left;">거래목적</div>
								<select name = "pur_trans" style="width: 150px;"required>
									<option value = "" disabled selected>거래목적</option>
									<option value ="급여">급여</option>
									<option value ="용돈">용돈</option>
									<option value ="아르바이트">아르바이트</option>
									<option value ="법인">법인</option>
									<option value ="모임">모임</option>
									<option value ="사업자금">사업자금</option>
								</select>
								<br><br>
								<div style="display:inline-block; width: 130px; text-align:left;">거래자금의 원천</div>
								 <input type = "text" name = "sor_fund" required style="width: 150px;"><br>
								<hr>
							</div>
								<div style = "text-align:center">
									<div style="display:inline-block; width: 130px; text-align: left;  margin-right: 350px;" >
										<h3 class="font-weight-bold">계좌 정보</h3>
										<br>
									</div>
								</div>
								<div style = "text-align:center">
									<div style="display:inline-block; width: 100px; margin-left : 30px; text-align: left;">계좌비밀번호</div>
									<input type = "password" class = "pw" id = "password1" name = "act_password" 
									placeholder = "네자리 비밀번호" minlength = 4 maxlength = 4 required style = "width : 150px; margin-left : 23px">
									<i id="eye-icon" class="fa fa-eye fa-lg" style="cursor: pointer; margin-left: 1px; font-size: 18px;" onclick="togglePasswordVisibility()"></i>
									<br><br>
									<div style="display:inline-block; width: 130px; text-align: left;">계좌비밀번호 확인</div>
									<input type = "password" class = "pw" placeholder = "네자리 비밀번호" id = "password2" minlength = 4 maxlength = 4 required style = "width : 150px;">
									<br><br>
									<font id = "checkPw" size = "2"></font>
								</div>
								<div class="advice-balloon advice-balloon2_account2">
									<strong style ="font-weight : bold;">2. 계좌 정보를 다음 순서대로 입력해주세요.</strong>
									<br>
									&nbsp; 1. 계좌 비밀번호를 입력해주세요.
									<br>
									&nbsp; 2. 계좌 비밀번호 확인을 위해 다시 한번 입력해주세요.
									<br>
								</div>
								<div class = "float-right">
									<br>
									<strong class="advice-balloon advice-balloon3_account2">3. 입력을 완료하셨으면 '개설하기'버튼을 눌러주세요.</strong>
									<Button type = "submit" id = "submitButton" class="btn button-like-link">개설하기</Button>
								</div>
							</form>
						</div>
					</div>
				</div>
	
			</div>
		</div>
	<!-- End Content -->

	<!-- Start Footer -->
	<footer class="footer-cust" id="tempaltemo_footer">
		<div class="w-100 footer-cust py-2">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">
							Copyright &copy; 2023 KB IT's Your Life , Ditto
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<!-- Start Script -->
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>
	<!-- End Script -->
</body>

</html>