<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>이용가이드</title>
<meta charset="utf-8">
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
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
							role="button" data-bs-toggle="dropdown" aria-haspopup="true"
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
							role="button" data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 금융교육 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/jgig/searchWord">금융
										용어 검색</a></li>
								<li><a class="dropdown-item" href="/jgig/quiz">금융 상식 퀴즈</a></li>
								<hr>
								<li><a class="dropdown-item" href="/jgig/guide">이용 가이드</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="nav-link "
							role="button" data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 커뮤니티 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/jgig/notice_list">공지사항</a></li>
								<li><a class="dropdown-item" href="/jgig/board_list">게시판</a></li>
								<li><a class="dropdown-item"
									href="/jgig/board_my_list_action">내가 쓴 글</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="nav-link "
							role="button" data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 지점찾기 </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/jgig/findStore">지점찾기
										및 번호표 발행</a></li>
								<li><a class="dropdown-item" href="/jgig/detailWaiting">번호표
										조회 및 취소</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="nav-link "
							role="button" data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 마이포인트 </a>
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
								role="button" data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i
									class="fa fa-fw fa-user text-dark mr-3"></i>
									${sessionScope.mem_nm}님 <!--session값으로 받아오기 -->
							</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="/jgig/member_detail?mem_id=${sessionScope.mem_id}">마이페이지</a></li>
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
					<h2 class="h3 pt-3 ">금융교육</h2>
					<hr>
					<ul class="list-unstyled ">
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="/jgig/searchWord"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 -->
								금융 용어 검색
						</a></li>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none "
							href="/jgig/quiz"> 금융 상식 퀴즈 </a></li>
						<hr>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none selectsidemenu"
							href="/jgig/guide"> 이용 가이드 </a></li>
					</ul>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu  pt-5 pl-3">
							<h2>이용 가이드</h2>
						</ul>
					</div>
				</div>
				<div class="row">
					<div id="service-content">
						<!-- 여기에 넣으시며 됩니당 -->
													<p class="ps-3">*궁금한 주제를 클릭하면 해당 영상으로 이동합니다</p>
						
						<div class="subcontent">
							<h5 ><i class="bi bi-cash-coin"></i> 계좌</h5>
							<table class="guid-table-size">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tr>
									<td scope="col"><a href="#account_issu"><img
											src="/assets/img/계좌개설사진.png" height="80px"></a><br>계좌
										개설</td>
									<td scope="col"><a href="#account_send"><img
											src="/assets/img/계좌이체사진.png" height="88px"></a><br>계좌
										이체 방법</td>
									<td scope="col"><a href="#account_list"><img
											src="/assets/img/계좌내역사진.png" height="88px"></a><br>계좌
										거래 내역 조회 방법</td>
									<td scope="col"><a href="#account_pw"><img
											src="/assets/img/계좌비번사진.png" height="88px"></a><br>계좌
										비밀번호 변경 방법</td>
									<td scope="col"><a href="#account_cancel"><img
											src="/assets/img/계좌해지사진.png" height="88px"></a><br>계좌
										해지 방법</td>

								</tr>
							</table>
						</div>
						
						<hr>
						<div class="subcontent">
							<h5 ><i class="bi bi-credit-card"></i> 카드</h5>
							<table class="guid-table-size">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tr>
									<td scope="col"><a href="#card_issu"><img
											src="/assets/img/카드발급사진.png" height="88px"></a><br>카드 발급 방법</td>
									<td scope="col"><a href="#card_status"><img
											src="/assets/img/카드정지사진.png" height="88px"></a><br>카드 분실신고/취소 방법</td>
									<td scope="col"><a href="#card_pw"><img
											src="/assets/img/카드비번사진.png" height="88px"></a><br>카드 비밀번호 변경 방법</td>
									<td scope="col"><a href="#card_cancel"><img
											src="/assets/img/카드해지사진.png" height="88px"></a><br>카드 해지 방법</td>
									<td scope="col"></td>

								</tr>
							</table>
						</div>
						
						<hr>
						<div class="subcontent">
							<h5 ><i class="bi bi-file-earmark-lock"></i> 인증서</h5>
							<table class="guid-table-size">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tr>
									<td scope="col"><a href="#certifi_issu"><img
											src="/assets/img/인증서발급사진.png" height="88px"></a><br>인증서 발급 방법</td>
									<td scope="col"></td>
									<td scope="col"></td>
									<td scope="col"></td>
									<td scope="col"></td>

								</tr>
							</table>
						</div>
						
						<hr>
						<div class="subcontent">
							<h5 ><i class="bi bi-bank"></i> 지점찾기 및 번호표 발행</h5>
							<table class="guid-table-size">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tr>
									<td scope="col"><a href="#findStore"><img
											src="/assets/img/지점찾기사진.png" height="88px"></a><br>지점찾기/번호표 발행 방법</td>
									<td scope="col"></td>
									<td scope="col"></td>
									<td scope="col"></td>
									<td scope="col"></td>

								</tr>
							</table>
						</div>
						

						<hr>
						<br>
<br>
						<div class="subcontent">
							<h3 class="h3-subtitle">계좌</h3>
							<div class="subcontent">
								<p id="account_issu" class="guid-subtitle">- 계좌 개설 방법</p>
								<video controls src="/assets/video/계좌 개설.mp4" width="90%"></video>
							</div>
							<div class="subcontent">
								<p id="account_list" class="guid-subtitle">- 계좌 거래 내역 조회 방법</p>
								<video controls src="/assets/video/계좌 거래내역조회.mp4" width="90%"></video>
							</div>
							<div class="subcontent">
								<p id="account_send" class="guid-subtitle">- 계좌 이체 방법</p>
								<video controls src="/assets/video/계좌이체.mp4" width="90%"></video>
							</div>
							<div class="subcontent">
								<p id="account_pw" class="guid-subtitle">- 계좌 비밀번호 수정 방법</p>
								<video controls src="/assets/video/계좌비밀번호수정.mp4" width="90%"></video>
							</div>
							<div class="subcontent">
								<p id="account_cancel" class="guid-subtitle">- 계좌 해지 방법</p>
								<video controls src="/assets/video/계좌해지.mp4" width="90%"></video>
							</div>

						</div>
						<hr>
						<div class="subcontent">
							<h3 class="h3-subtitle">카드</h3>
							<div class="subcontent">
								<p id="card_issu" class="guid-subtitle">- 카드 발급 방법</p>
								<video controls src="/assets/video/카드발급.mp4" width="90%"></video>
							</div>
							<div class="subcontent">
								<p id="card_status" class="guid-subtitle">- 카드 분실신고/취소 방법</p>
								<video controls src="/assets/video/카드 분실신고.mp4" width="90%"></video>
							</div>
							<div class="subcontent">
								<p id="card_pw" class="guid-subtitle">- 카드 비밀번호 변경 방법</p>
								<video controls src="/assets/video/카드 비밀번호변경.mp4" width="90%"></video>
							</div>
							<div class="subcontent">
								<p id="card_cancel" class="guid-subtitle">- 카드 해지 방법</p>
								<video controls src="/assets/video/카드해지.mp4" width="90%"></video>
							</div>
						</div>

						<div class="subcontent">
							<h3 class="h3-subtitle">인증서</h3>
							<div class="subcontent">
								<p id="certifi_issu" class="guid-subtitle">- 인증서 발급 방법</p>
								<video controls src="/assets/video/인증서 발급.mp4" width="90%"></video>
							</div>
							<hr>
							<div class="subcontent">
								<h3 class="h3-subtitle">지점찾기 및 번호표 발행</h3>
								<div class="subcontent">
									<p id="findStore" class="guid-subtitle">- 지점찾기 및 번호표 발행 방법</p>
									<video controls src="/assets/video/지점찾기 및 번호표 발행.mp4" width="90%"></video>
								</div>
								
							</div>
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
