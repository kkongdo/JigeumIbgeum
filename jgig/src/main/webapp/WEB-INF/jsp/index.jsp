<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html lang="en">

<head>
<title>지금입금</title>
<meta charset="utf-8">
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
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>

<body id="main-body">

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


	


	<div id="slide-banner" class="carousel slide height350 " data-bs-ride="carousel">
		<div class="carousel-indicators pb-3">
			<button type="button" data-bs-target="#slide-banner" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#slide-banner" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#slide-banner" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner px-5">

			<div class="carousel-item active">
				<div class="row pd-20p py-4 height350">
					<div class="col-6  banner-text">
						<p class="banner-title">
							<img src="/assets/img/light-bulb.png" width="50px">금융 거래 연습
						</p>
						<p class="banner-subtitle">
							실제 인터넷 뱅킹을 하다가 실수할까 겁이나시나요? <br>지금입금 서비스를 사용해보세요! 
						</p>
						
						<p class="banner-content">
							"가상 계좌로 손쉽게 입출금 및 이체 연습을 해보세요."<br>"쉽고 안전하게 카드 발급 및 금융 관리를 경험하세요."
						</p>
						
					</div>
					<div class="col-6 center-x">
						<img src="/assets/img/bannericon-1.png" class="img-fluid" alt="Image">
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="row pd-20p py-4 height350">
					<div class="col-6 center-x">
						<img src="/assets/img/bannericon-3.png" class="img-fluid" alt="Image">
					</div>
					<div class="col-6 pe-md-5 text-md-end banner-text">
						<p class="banner-title">
							<img src="/assets/img/light-bulb.png" width="50px">금융 용어 검색&퀴즈
						</p>
						<p class="banner-subtitle">
							헷갈리고 어려운 금융 용어 <br>지금 입금이 쉽게 알려드릴게요! 
						</p>
						
						<p class="banner-content">
							"금융 용어를 검색하고, 퀴즈로 학습하세요."<br>"금융 용어 퀴즈를 통해 지식을 쌓으세요."
						</p>
						
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="row pd-20p py-4 height350">
					<div class="col-6 ps-md-5 banner-text">
						<p class="banner-title">
							<img src="/assets/img/light-bulb.png" width="50px">포인트 & 랭킹
						</p>
						<p class="banner-subtitle">
							포인트를 쌓으며 재미있게 연습할 수 있어요! 
						</p>
						
						<p class="banner-content">
							"출석체크, 퀴즈, 연습으로 포인트를 획득하세요."<br>"포인트를 쌓아 랭킹에서 상위에 올라가세요."
						</p>
						
					</div>
					<div class="col-6 center-x">
						<img src="/assets/img/bannericon-2.png" class="img-fluid" alt="Image">
					</div>
				</div>
			</div>
			
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#slide-banner" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#slide-banner" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>











	


	<!-- Start 공지사항, 회원랭킹 -->
	<section class="container py-3">
		<div class="row">
			<div class="col-lg-8">
				<div class="main-div text-center">
					<div class="btn-outer-div">
						<button type="button" class="main-btn " id="guid-btn" onclick="window.location.href='/jgig/guide'">
							<img src="/assets/img/guid.png" height="30px">이용 설명
						</button>
						<span>|</span>
						<button type="button" class="main-btn " onclick="window.location.href='/jgig/findStore'">
							<img src="/assets/img/bank-map.png" height="30px">가까운 지점 찾기
						</button>
					</div>
				</div>
				<div class="main-div">
					<div class="main_board">
						<div class="tab_menu">
							<ul class="list">
								<li class="is_on"><a class="main-brd-a" onclick="showTab('tab1', this)">공지사항</a></li>
								<li><a class="main-brd-a" onclick="showTab('tab2', this)">게시판</a></li>
								<li><a class="main-brd-a" onclick="showTab('tab3', this)">Q&A</a></li>
								<li class="main-brd-plus"><a class="main-brd-a" href="/jgig/notice_list">+</a></li>
							</ul>
							<br>
							<div id="tab1" class="cont">
								<ul>
									<c:forEach items="${notice_list}" var="nl">

										<li><a class="brd_title" href="/jgig/notice_detail?no=${nl.ntc_id}">• ${nl.title}</a> <span class="brd_date"><c:out value="${fn:substring(nl.ntc_date_created, 0, 10)}" /></span></li>



									</c:forEach>
								</ul>
							</div>
							<div id="tab2" class="cont">
								<ul>
									<c:forEach items="${free_list}" var="fl">

										<li><a class="brd_title" href="/jgig/board_detail?no=${fl.brd_id}">• ${fl.title}</a> <span class="brd_date"><c:out value="${fn:substring(fl.brd_date_created, 0, 10)}" /></span></li>



									</c:forEach>
								</ul>
							</div>
							<div id="tab3" class="cont">
								<ul>
									<c:forEach items="${question_list}" var="ql">

										<li><a class="brd_title" href="/jgig/board_detail?no=${ql.brd_id}">• ${ql.title}</a> <span class="brd_date"><c:out value="${fn:substring(ql.brd_date_created, 0, 10)}" /></span>
</li>



									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="col-lg-4">
				<div class="main-div text-center">
					<button type="button" class="att_btn " onclick="return isLogin();">
						<img src="/assets/img/attendance-icon.png" height="30px">출석체크
					</button>
				</div>

				<div class="main-div">
					<table id="rank-table" class="text-center">
						<thead>
							<tr>
								<th colspan="3" class="text-center p-sm-2">
									<div class="horizontal-center">
										<img src="/assets/img/ranking.png" height="30px"> <span class="h3 fw-bold m-0">포인트 순위</span>
									</div>
								</th>
							</tr>
						</thead>
						<c:forEach items="${point_rank}" var="pr" varStatus="loop">

							<tr>

								<td class="left-round fw-bold">${loop.index + 1}</td>
								<td class="text-green">${pr.nickname}</td>
								<td class="right-round text-sm-start"><img src="/assets/img/point.png" height="20px"> ${pr.score}</td>

							</tr>

						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- End 공지사항, 회원랭킹 -->





	<!-- Start Footer -->
	<footer class="footer-cust" id="tempaltemo_footer">


		<div class="w-100 footer-cust py-2">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">Copyright &copy; 2023 KB IT's Your Life , Ditto</p>
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

	<script>
		//게시판 tab함수
		function showTab(tabId, clickedButton) {

			// Get all the content divs
			var contentDivs = document.querySelectorAll('.cont');

			// Loop through all content divs
			for (var i = 0; i < contentDivs.length; i++) {
				// Hide all content divs
				contentDivs[i].style.display = 'none';
			}

			// Show the selected content div
			var selectedTab = document.getElementById(tabId);
			if (selectedTab) {
				selectedTab.style.display = 'block';
			}
			// Reset the color of all buttons
			var buttons = document.querySelectorAll('.main-brd-a');
			for (var i = 0; i < buttons.length; i++) {
				buttons[i].style.color = ''; // Reset to default color
			}

			// Change the color of the clicked button
			if (clickedButton) {
				clickedButton.style.color = 'white'; // Change to the desired color
			}

			// Update the href of the + button based on the current tab
			var plusButton = document.querySelector('.main-brd-plus a');
			if (plusButton) {
				switch (tabId) {
				case 'tab1':
					plusButton.href = '/jgig/notice_list'; // 공지사항 탭인 경우
					break;
				case 'tab2':
					plusButton.href = '/jgig/board_list'; // 자유게시판 탭인 경우
					break;
				case 'tab3':
					plusButton.href = '/jgig/board_list'; // Q&A 탭인 경우
					break;
				default:
					plusButton.href = ''; // 기본값은 빈 주소
				}
			}
		}

		function isLogin() {

			if ("${sessionScope.mem_id}" === '') {
				alert("로그인이 필요합니다.");
				window.location.href = '/jgig/login';
				return false;
			} else {
				
				window.open('/jgig/attendance', 'Child',
						'width=750px, height=800px, top=50, left=50');
				return true;
			}
		}
	</script>

	<script>
		// jQuery를 사용하여 반복적으로 페이드 인 애니메이션 적용
		function applyFadeInAnimation() {
			var rows = $('#rank-table tbody tr');
			var delay = 1000; // 각 행 간의 딜레이 설정 (밀리초)

			rows.each(function(index) {
				var row = $(this);
				setTimeout(function() {
					row.addClass('fade-in');
				}, delay * index);
			});

			// 애니메이션이 끝나면 행을 초기화하고 다시 반복
			setTimeout(function() {
				rows.removeClass('fade-in');
				setTimeout(applyFadeInAnimation, 500); // 다음 반복까지 대기 시간 설정 (밀리초)
			}, delay * rows.length);
		}

		$(document).ready(function() {
			applyFadeInAnimation(); // 애니메이션 시작
		});
	</script>
	<!-- End Script -->
</body>

</html>