<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>계좌개설</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

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
			var isSuccess = false
			function check_button(){
				$("#checkButton").click(function () {
			        var formData = $("#memberCheckForm").serialize()
	
			        $.ajax({
			            type: "POST",
			            url: "/jgig/member_check",
			            data: formData,
			            dataType: "json",
			            success: function (data) {
			            	isSuccess = data.success
			                if (data.success) {
			                	alert("본인인증이 완료되었습니다.");
			                } else {
			                	alert("본인인증에 실패하였습니다.");
			                    $("#submitButton").prop("disabled", true)
			                }
			            },
			            error: function (error) {
			                console.error("Error:", error)
			            },
			        })
			    })
			}
			function check_permission(){
				$("input[name='check']").change(function () {
		            var isChecked = $("input[name='check']:checked").val() === "yes"
		            if (isChecked && isSuccess) {
		                $("#submitButton").prop("disabled", false)
		            } else {
		                $("#submitButton").prop("disabled", true)
		            }
		        })
			}
			
			function advice_balloon(){
				$('#advice-balloonCheckbox').change(function() {
					if (this.checked) {
						$('.advice-balloon1').show()
						$('.advice-balloon2').show()
						$('.advice-balloon3').show()
						$('.advice-balloon4').show()
						console.log('말풍선을 표시합니다.')
					} else {
						$('.advice-balloon1').hide()
						$('.advice-balloon2').hide()
						$('.advice-balloon3').hide()
						$('.advice-balloon4').hide()
						console.log('말풍선을 숨깁니다.')
					}
				})
			}
			
			$(function () {
				advice_balloon()
				$("#submitButton").prop("disabled", true)
				check_button()
				check_permission()
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
	                        	<a class="nav-link " href="/jgig/open_account1"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
	                        	<a class="nav-link " href="/jgig/searchWord"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            금융교육
	                        	</a>
	                        	<ul class="dropdown-menu">
	                           	  <li><a class="dropdown-item" href="/jgig/searchWord">금융 용어 검색</a></li>
	                             <li><a class="dropdown-item" href="#">금융 상식 퀴즈</a></li>
	                             <hr>
	                             <li><a class="dropdown-item" href="#">이용 가이드</a></li>
	                        	</ul>
	                    	</li>
	                    	<li class="nav-item dropdown">
	                        	<a class="nav-link " href="#공지사항링크"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            커뮤니티
	                        	</a>
	                        	<ul class="dropdown-menu">
	                           	 <li><a class="dropdown-item" href="#">공지사항</a></li>
	                             <li><a class="dropdown-item" href="/jgig/board_list">게시판</a></li>
	                             <li><a class="dropdown-item" href="#">내가 쓴 글</a></li>
	                        	</ul>
	                    	</li>
	                    	<li class="nav-item dropdown">
	                        	<a class="nav-link " href="/jgig/findStore"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            지점찾기
	                        	</a>
	                        	<ul class="dropdown-menu">
	                           	 <li><a class="dropdown-item" href="/jgig/findStore">지점찾기 및 번호표 발행</a></li>
	                             <li><a class="dropdown-item" href="/jgig/detailWaiting">번호표 조회 및 취소</a></li>
	                        	</ul>
	                    	</li>
	                    	<li class="nav-item dropdown">
	                        	<a class="nav-link " href="/jgig/point_list"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
										href="/jgig/member_detail" role="button" data-bs-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
											class="fa fa-fw fa-user text-dark mr-3"></i>
										${sessionScope.mem_nm}님 <!--session값으로 받아오기 -->
									</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="/jgig/member_detail">마이페이지</a></li>
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
	
		<!-- Modal -->
		<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="w-100 pt-1 mb-5 text-right">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form action="" method="get" class="modal-content modal-body border-0 p-0">
					<div class="input-group mb-2">
						<input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
						<button type="submit" class="input-group-text bg-success text-light">
							<i class="fa fa-fw fa-search text-white"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	
		<!-- Start Content -->
		<div class="container py-5">
			<div class="row">
	
				<div class="col-lg-2">
					<div class="sidemenubox">
						<h2 class="h3 pt-3 ">금융 거래 연습</h2>
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
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									카드 발급
								</a>
							</li>
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									카드 조회
								</a>
							</li>
							<hr>
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									공인인증서 발급
								</a>
							</li>
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									하위메뉴
								</a>
							</li>
						</ul>
					</div>
				</div>
	
				<div class="col-lg-9">
						<fieldset class = "advice-location">
							<legend>도움기능 선택</legend>
							<label for="">음성지원</label>
							<input type="checkbox" id="">
							<label for="tooltipCheckbox">도움말</label>
							<input type="checkbox" id="advice-balloonCheckbox">
						</fieldset>
					<div class="row">
						<div class="col-md-6">
							<ul class="list-inline shop-top-menu  pt-5 pl-3">
								<h2>계좌 개설</h2>
								<p class="advice-balloon advice-balloon1"><strong>계좌개설을 연습하고 싶은 경우 다음 단계를 수행해주세요.</strong></p>
							</ul>
						</div>
					</div>
					<div class="row">
						<div id="service-content"> 
							<!-- 여기에 넣으시며 됩니당 -->
								<form id = "memberCheckForm" action="member_check" method = "post">
									<span class="font-weight-bold">상품명</span>
									<select name = "act_name" required>
										<option>선택</option>
										<option value ="KBablePlus통장">KBablePlus통장</option>
										<option value ="직장인우대종합통장">직장인우대종합통장</option>
										<option value ="KB두근두근외화적금">KB두근두근외화적금</option>
										<option value ="KB국민ON통장">KB국민ON통장</option>
									</select>
									<p class="advice-balloon advice-balloon2"><strong>1. 원하시는 상품을 선택해주세요.</strong></p>
									<hr>
									<h3 class="font-weight-bold">본인인증</h3>
									<p class="advice-balloon advice-balloon3">
										<strong>2. 본인 인증을 위해 다음 순서대로 입력해주세요.</strong>
										<br>
										&nbsp; 1. 이름을 입력해주세요.
										<br>
										&nbsp; 2. 주민등록번호를 입력해주세요.
										<br>
										&nbsp; 3. 휴대폰 번호를 입력해주세요.
										<br>
										&nbsp; 4. 본인 인증 버튼을 눌러주세요.
										<br>
									</p>
									<div class="form-container">
									    <div class="form-group">
									        <label class = "label_open_account" for="mem_nm">이름</label>
									        <input type="text" name="mem_nm" id="mem_nm" required>
									    </div>
									    <div class="form-group">
									        <label class = "label_open_account" for="ssn1">주민등록번호</label>
									        <input type="text" name="ssn1" id="ssn1" minlength="6" maxlength="6" required>
									        -
									        <input type="text" name="ssn2" id="ssn2" minlength="7" maxlength="7" required>
									    </div>
									    <div class="form-group">
									        <label class = "label_open_account" for="phone_num1">휴대폰번호</label>
									        <input type="text" name="phone_num1" id="phone_num1" required minlength="2" maxlength="3">
									        -
									        <input type="text" name="phone_num2" id="phone_num2" minlength="3" maxlength="4" required>
									        -
									        <input type="text" name="phone_num3" id="phone_num3" minlength="3" maxlength="4" required>
									    </div>
									</div>
									<button type="button" id="checkButton" class="float-right">본인확인</button>
								</form>
								<br>
								<hr>
								<form action = "open_account2" method = "post" >
									<h3 class="font-weight-bold">약관동의</h3>
									<fieldset class = "check_user">
										<strong>개인(신용)정보 수집-이용에 동의</strong>
										<p>
											본인은 귀사가 「개인정보보호법」 및 「신용정보의 이용 및 보호에 관한 법률」 에 따라 본인의 개인(신용)정보를 다음과 같이 수집·이용하는 것에 동의합니다
											개인(신용)정보 수집·이용 목적 : 비대면 계좌개설 신청여부 확인
											수집·이용할 개인(신용)정보의 내용 : 주민등록번호
											개인(신용)정보의 보유·이용기간 : 신청일로부터 30일 이내
											※ 상기 동의를 거부하실 경우 비대면 계좌개설이 불가합니다.
										</p>
									</fieldset>
									<p class="advice-balloon advice-balloon4"><strong>3. 약관동의에 동의을 눌러준 후 다음버튼을 눌러주세요.</strong></p>
									<div class = "float-right">
										<input type="radio" class="option1" id = "option1" name="check" value="yes">
							  			<label for="option1" >동의</label>
							  			<input type="radio" class="option2" id = "option2" name="check" value="no">
							  			<label for="option2">비동의</label>
							  			<br>
										<input type = "submit" id = "submitButton" class="btn btn-warning" value = "다음">
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