<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>계좌조회 및 이체</title>
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
			function check_permission(){
				$("input[name='check']").change(function () {
		            var isChecked = $("input[name='check']:checked").val() === "yes"
		            if (isChecked) {
		                $("#submitButton").prop("disabled", false)
		            } else {
		                $("#submitButton").prop("disabled", true)
		            }
		        })
			}
			function advice_balloon(){
				$('#advice-balloonCheckbox').change(function() {
					if (this.checked) {
						$('.advice-balloon1_accountStop').show()
						$('.advice-balloon2_accountStop').show()
						$('.advice-balloon3_accountStop').show()
						$('.advice-balloon4_accountStop').show()
						console.log('말풍선을 표시합니다.')
					} else {
						$('.advice-balloon1_accountStop').hide()
						$('.advice-balloon2_accountStop').hide()
						$('.advice-balloon3_accountStop').hide()
						$('.advice-balloon4_accountStop').hide()
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
			$(function () {
				$("#submitButton").prop("disabled", true)
				check_permission()
				advice_balloon()
				togglePasswordVisibility()
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
								<h2>계좌 해지</h2>
							</ul>
						</div>
					</div>
					<strong class="advice-balloon advice-balloon1_accountStop">계좌해지를 원하시면 다음 단계를 수행해주세요.</strong>
					<div class="row">
						<div id="service-content"> 
							<!-- 여기에 넣으시며 됩니당 -->
							<div class = "accountListCss">
								<table>
								<tr>
									<th class= "bgc">상품명</th><td>${dto.act_name}</td>
								</tr>
								<tr>
									<th class= "bgc">계좌번호 </th><td>${dto.account}</td>
								</tr>
								<tr>
									<th class= "bgc">발급일시</th><td>${formattedRegdate}</td>
								</tr>
								<tr>
									<th class= "bgc">잔액</th><td><fmt:formatNumber value="${dto.balance}" pattern="#,###"/>원</td>
								</tr>
								</table>
							</div>
							<br>
							<form action = "termination_action" method = "post" id="accountTerminationForm">
								<input type = "hidden" name = "account" value = "${dto.account}">
								<div class = "accountListCss">
									<table>
										<tr>
											<th class= "bgc" style= "width : 313px">비밀번호 확인</th>
											<td>
												<input type="password" name="act_password" id = "password1" minlength="4"
												maxlength="4">
												<i id="eye-icon" class="fa fa-eye fa-lg" style="cursor: pointer; margin-left: 1px; font-size: 18px;" onclick="togglePasswordVisibility()"></i>
											</td>
										</tr>
									</table>
								</div>
								<strong class="advice-balloon advice-balloon2_accountStop">1. 비밀번호를 입력해주세요.</strong>
								<br>
								<div class = "check_termination_account_box">
									<input type="radio" class="option1"  id = "option1" name = "check" value = "yes">
							  		<strong style="font-size: 20px; font-weight : bold;">계좌해지 시 복구할 수 없음을 인지하였습니다.</strong>
								</div>
								<strong class="advice-balloon advice-balloon3_accountStop">2. 약관동의에 클릭해주세요.</strong>
								<br>
								<p style = "color : red;">${msg}</p>
								<strong class="advice-balloon advice-balloon4_accountStop">3. 계좌해지버튼을 눌러주세요.</strong>
								<Button type = "submit" id = "submitButton" class="btn button-like-link" style="float: right;">계좌 해지</Button>
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