<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="/assets/img/apple-touch-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/img/favicon.ico">

<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/templatemo.css">
<link rel="stylesheet" href="/assets/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="/assets/css/fontawesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap"
	rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
	function advice_balloon(){
		$('#advice-balloonCheckbox').change(function() {
			if (this.checked) {
				$('.advice-balloon1_accountPassword_ok').show()
				$('.advice-balloon1_accountPassword_ok').show()
				console.log('말풍선을 표시합니다.')
			} else {
				$('.advice-balloon1_accountPassword_ok').hide()
				$('.advice-balloon1_accountPassword_ok').hide()
				console.log('말풍선을 숨깁니다.')
			}
		})
	}
	$(function(){
		advice_balloon()
	})
	</script>
<title>계좌조회및이체</title>
</head>
<body>
	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow navcolor">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-success logo h1 align-self-center"
				href="/jgig/"> <img src="/assets/img/KB-logo.png" width="30"
				height="30" alt=""> <img src="/assets/img/jgig-icon.png"
				height="45" alt="">
			</a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- 화면 작아질시 토글바 -->

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item dropdown"><a class="nav-link "
							href="/jgig/open_account1" role="button"
							data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 금융거래연습 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/jgig/open_account1">계좌
										개설</a></li>
								<li><a class="dropdown-item" href="/jgig/account_list">계좌
										조회 및 이체</a></li>
								<li><a class="dropdown-item" href="/jgig/trans_history">거래
										내역 조회</a></li>
								<hr>
								<li><a class="dropdown-item" href="/jgig/card_issuance">카드
										발급</a></li>
								<li><a class="dropdown-item" href="/jgig/card_list">카드
										조회 및 관리</a></li>
								<hr>
								<li><a class="dropdown-item" href="/jgig/certification">인증서
										발급</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="nav-link "
							href="/jgig/searchWord" role="button" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 금융교육 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/jgig/searchWord">금융
										용어 검색</a></li>
								<li><a class="dropdown-item" href="#">금융 상식 퀴즈</a></li>
								<hr>
								<li><a class="dropdown-item" href="#">이용 가이드</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="nav-link "
							href="#공지사항링크" role="button" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">공지사항</a></li>
								<li><a class="dropdown-item" href="/jgig/board_list">게시판</a></li>
								<li><a class="dropdown-item" href="#">내가 쓴 글</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="nav-link "
							href="/jgig/findStore" role="button" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 지점찾기 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/jgig/findStore">지점찾기
										및 번호표 발행</a></li>
								<li><a class="dropdown-item" href="/jgig/detailWaiting">번호표
										조회 및 취소</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="nav-link "
							href="/jgig/point_list" role="button" data-bs-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 마이포인트 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/jgig/point_list">포인트
										조회</a></li>
								<li><a class="dropdown-item" href="/jgig/point_conversion">포인트
										전환</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<div
						class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
						<div class="input-group">
							<input type="text" class="form-control" id="inputMobileSearch"
								placeholder="Search ...">
							<div class="input-group-text">
								<i class="fa fa-fw fa-search"></i>
							</div>
						</div>
					</div>
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">

						<!--로그인 했을 때 -->
						<c:if test="${not empty sessionScope.mem_id}">
							<li class="nav-item dropdown"><a
								class="nav-icon position-relative text-decoration-none nav-link"
								href="/jgig/member_detail" role="button"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i
									class="fa fa-fw fa-user text-dark mr-3"></i>
									${sessionScope.mem_nm}님 <!--session값으로 받아오기 -->
							</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/jgig/member_detail">마이페이지</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link" href="/jgig/logout">로그아웃</a>
							</li>
						</c:if>

						<!--로그인 안 했을 때 -->
						<c:if test="${empty sessionScope.mem_id}">
							<li class="nav-item"><a class="nav-link" href="/jgig/login">로그인</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="/jgig/register">회원가입</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
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
						<li><a class="collapsed d-flex justify-content-between text-decoration-none"href="open_account1"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 --> 계좌 개설</a>
						</li>
						<li>
							<a class="collapsed d-flex justify-content-between text-decoration-none selectsidemenu" href="account_list"> 계좌 조회 및 이체 </a>
						</li>
						<li>
							<a class="collapsed d-flex justify-content-between text-decoration-none" href="trans_history"> 거래 내역 조회 </a>
						</li>
						<hr>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="#"> 카드 발급 </a></li>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="#"> 카드 조회 </a></li>
						<hr>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="#"> 공인인증서 발급 </a></li>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="#"> 하위메뉴 </a></li>
					</ul>
				</div>
			</div>

			<div class="col-lg-9">
				<fieldset class = "advice-location">
						<label for="">음성지원</label>
						<input type="checkbox" id="">
						<label for="tooltipCheckbox">도움말</label>
						<input type="checkbox" id="advice-balloonCheckbox">
				</fieldset>
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu  pt-5 pl-3">
							<h2>비밀번호 수정</h2>
						</ul>
					</div>
				</div>
				<div class="row">
					<div id="service-content">
						<!-- 여기에 넣으시며 됩니당 -->
						<div class = "accountListCss">
							<table>
							<tr>
								<td class= "bgc">상품명</td>
								<td>${dto.act_name}</td>
							</tr>
							<tr>
								<td class= "bgc">계좌번호</td>
								<td>${dto.account}</td>
							</tr>
							<tr>
								<td class= "bgc">비밀번호수정</td>
								<td>${dto.act_password}</td>
							</tr>
							</table>
							<br>
							<strong class = "password-ok-msg">${msg}</strong><br><br> 
							<a href="account_list" class="button-like-link" style="float: right;">계좌조회 및 이체</a>
							<strong class="advice-balloon advice-balloon1_accountPassword_ok">3. 비밀번호 수정을 완료한 후 계좌 조회 및 이체 페이지로 이동이 가능합니다.</strong>
						</div>
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
						<p class="text-left text-light">Copyright &copy; 2023 KB IT's
							Your Life , Ditto</p>
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