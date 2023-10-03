<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>계좌조회 및 이체</title>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		<script>
		function advice_balloon(){
			$('#advice-balloonCheckbox').change(function() {
				if (this.checked) {
					$('.advice-balloon1_transferform2').show()
					$('.advice-balloon2_transferform2').show()
					console.log('말풍선을 표시합니다.')
				} else {
					$('.advice-balloon1_transferform2').hide()
					$('.advice-balloon2_transferform2').hide()
					console.log('말풍선을 숨깁니다.')
				}
			})
		}
		$(function(){
			advice_balloon()
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
						<h2 class="h3 pt-3 ">금융거래연습</h2>
					<hr>
					<ul class="list-unstyled ">
						<li>
							<a class="collapsed d-flex justify-content-between text-decoration-none" href="open_account1"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 -->
								계좌 개설
							</a>
						</li>
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none  selectsidemenu" href="account_list">
								계좌 조회 및 이체
							</a>
						</li>
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none" href="trans_history">
								거래 내역 조회
							</a>
						</li>
						<hr>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="card_issuance"> 카드발급 </a></li>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="card_list"> 카드 조회 및 관리 </a></li>
						<hr>
						<li><a
							class="collapsed d-flex justify-content-between text-decoration-none"
							href="certification"> 인증서 발급 </a></li>
					</ul>
					</div>
				</div>
	
				<div class="col-lg-9">
					<div class = "advice-tooltip">
						<fieldset class = "advice-location">
							<label for="tooltipCheckbox"><strong class= "advice-tooltip">도움말</strong></label>
							<input type="checkbox" id="advice-balloonCheckbox">
						</fieldset>
					</div>
					<div class="row">
						<div class="col-md-6">
							<ul class="list-inline shop-top-menu  pt-5 pl-3">
								<h2>계좌 이체</h2>
							</ul>
						</div>
					</div>
					<div class="row">
						<div id="service-content"> 
							<!-- 여기에 넣으시며 됩니당 -->
							<h4>입력내용 확인</h4>
							<form action = "transfer_action" method = "post">
								<input type = "hidden" name = "withdr_mon" value = "${dto.withdr_mon}">
								<input type = "hidden" name = "send_nm" value = "${dto.send_nm}">
								<input type = "hidden" name = "mem_id" value = "${dto.mem_id}">
								<input type = "hidden" name = "receive_nm" value = "${dto.receive_nm}">
								
								<input type = "hidden" name = "account" value = "${dto.account}">
								<input type = "hidden" name = "depo_bank" value = "${dto.depo_bank}">
								<input type = "hidden" name = "depo_num" value = "${dto.depo_num}">
								<input type = "hidden" name = "depo_mon" value = "${dto.depo_mon}">
								<div class = "accountListCss">
									<table>
										<tr>
											<th class = "bgc">출금계좌번호</th>
											<td>${dto.account}</td>
										</tr>
										
										<tr>
											<th class = "bgc">입금은행</th>
											<td>${dto.depo_bank}</td>
										</tr>
										<tr>
											<th class = "bgc">입금계좌번호</th>
											<td>${dto.depo_num}</td>
										</tr>
										<tr>
											<th class = "bgc">이체금액</th>
											<td><fmt:formatNumber value="${dto.depo_mon}" pattern="#,###"/>원</td>
										</tr>
									</table>
								</div>
								<br>
								<div class="button-container">
									<div>
										<a href="transfer_form?account=${dto.account}" class="button-like-link" style="font-size: 16px; padding: 8px 41px;">
											<strong><span style="font-weight: 900;">취소</span></strong>
										</a>
									</div>
								    <Button type="submit" id="submitButton" class="btn button-like-link">이체하기</Button>
								</div>
								<strong class="advice-balloon advice-balloon1_transferform2">1. 취소를 원할 시 <br>취소 버튼을 눌러주세요.</strong>
								<strong class="advice-balloon advice-balloon2_transferform2">2. 보낼 정보가 맞을 경우 <br>이체하기 버튼을 눌러주세요.</strong>
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