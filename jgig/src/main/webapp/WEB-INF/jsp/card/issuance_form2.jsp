<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="/assets/css/fontawesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
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
						<li><a class="collapsed d-flex justify-content-between text-decoration-none" href="/jgig/open_account1"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 --> 계좌 개설
						</a></li>
						<li><a class="collapsed d-flex justify-content-between  text-decoration-none" href="/jgig/account_list"> 계좌 조회 및 이체 </a></li>
						<li><a class="collapsed d-flex justify-content-between  text-decoration-none" href="/jgig/trans_history"> 거래 내역 조회 </a></li>
						<hr>
						<li><a class="collapsed d-flex justify-content-between text-decoration-none selectsidemenu " href="/jgig/card_issuance"> 카드발급 </a></li>
						<li><a class="collapsed d-flex justify-content-between text-decoration-none  " href="/jgig/card_list"> 카드 조회 및 관리 </a></li>
						<hr>
						<li><a class="collapsed d-flex justify-content-between  text-decoration-none" href="/jgig/certification"> 인증서 발급 </a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pt-5 pl-3">
							<h2>카드 발급</h2>
						</ul>
					</div>
				</div>
				<div class="row">
					<div id="service-content">
						<!-- 여기에 넣으시며 됩니당 -->
						<div class="subcontent checkbox-div">
							<label for="advice-balloonCheckbox">도움말</label> <input type="checkbox" id="advice-balloonCheckbox">
						</div>
						<form action="card_issuance_action" method="post" onsubmit="return validateForm();">

							<div class="subcontent">
								<h3 class="h3-subtitle">기본 정보</h3>
								<div class="subcontent card-info">
									<table class="card-info-table table-center">
										<colgroup>
											<col style="width: 184px">
											<col style="width: *">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="en_name">영문이름</label></th>
												<td><input type="text" id="en_name" class="blank-1 border-bt" data-bs-toggle="tooltip" data-bs-placement="right" title="카드에 새겨질 영문이름을 입력해 주세요."></td>
											</tr>
											<tr>
												<th scope="row"><label for="email">이메일</label></th>
												<td><input type="text" id="email1" class="blank-2 border-bt"> @ <input type="text" id="email2" class="blank-2 border-bt" data-bs-toggle="tooltip" data-bs-placement="right" title="안내받을 이메일 주소를 입력해주세요."></td>
											</tr>
											<tr>
												<th scope="row"><label for="address">주소</label></th>
												<td><input type="text" id="address" class="blank-1 border-bt" data-bs-toggle="tooltip" data-bs-placement="right" title="카드를 배송 받을 주소를 입력해주세요."></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="subcontent">
								<h3 class="h3-subtitle">결제 정보</h3>
								<div class="subcontent card-info">
									<table class="card-info-table table-center">
										<colgroup>
											<col style="width: 184px">
											<col style="width: *">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="pay_bank">결제계좌은행</label></th>
												<td><select name="pay_bank" id="pay_bank" class="blank-2 border-bt" data-bs-toggle="tooltip" data-bs-placement="right" title="카드 사용 시 결제할 계좌 은행을 선택해주세요.">
														<option value="국민은행">국민은행</option>
														<option value="카카오뱅크">카카오뱅크</option>
														<option value="기업은행">기업은행</option>
														<option value="농협은행">농협은행</option>
														<option value="신한은행">신한은행</option>
														<option value="산업은행">산업은행</option>
														<option value="우리은행">우리은행</option>
														<option value="한국씨티은행">한국씨티은행</option>
														<option value="하나은행">하나은행</option>
														<option value="우체국">우체국</option>
														<option value="토스뱅크">토스뱅크</option>
												</select></td>
											</tr>
											<tr>
												<th scope="row"><label for="pay_account">계좌번호</label></th>
												<td><input type="number" name="pay_account" id="pay_account" class="blank-1 border-bt" data-bs-toggle="tooltip" data-bs-placement="right" title="계좌번호를 정확히 입력해주세요."></td>
											</tr>
											<tr>
												<th scope="row" data-bs-toggle="tooltip" data-bs-placement="left" title="카드 비밀번호 4자리 숫자를 입력해주세요. "><label for="passwd">카드 비밀번호</label></th>
												<td><input type="password" id="passwd" name="cd_pw" maxlength="4" oninput="checkPassword()" class="blank-2 border-bt" > <span id="pw1_message"></span></td>
											</tr>
											<tr>
												<th scope="row"data-bs-toggle="tooltip" data-bs-placement="left" title="카드 비밀번호 4자리를 똑같이 다시 입력해주세요."><label for="confirmPassword">카드 비밀번호 확인</label></th>
												<td><input type="password" id="confirmPassword" maxlength="4" oninput="checkPassword()" class="blank-2 border-bt"><span id="pw2_message"></span></td>
											</tr>

											<tr>
												<th scope="row"><label for="pay_date">결제일</label></th>
												<td>매월 <input type="number" name="pay_date" id="pay_date" class="blank-4 border-bt"> <span data-bs-toggle="tooltip" data-bs-placement="right" title="카드 사용 금액의 매월 결제일을 입력해주세요">일</span>
												</td>
											</tr>


										</tbody>
									</table>
								</div>
							</div>

							<div class="btn-div">
								<p id="form_msg"></p>
								<button type="submit" class="card-sumit-btn">발급</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->

	<!-- Start 모달  -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="modal-title"></h4>
				</div>
				<div class="modal-body" id="modal-body">
					<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="modalClose">Close</button>
				</div>
			</div>
		</div>
	</div>
<!-- End 모달  -->



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
	<!-- End Script -->

	<script>
		function validateForm() {
			var en_name = document.getElementById("en_name").value;
			var email1 = document.getElementById("email1").value;
			var email1 = document.getElementById("email2").value;

			var address = document.getElementById("pay_account").value;
			var account = document.getElementById("address").value;
			var pw = document.getElementById("passwd").value;
			var pw_confirm = document.getElementById("confirmPassword").value;
			var date = document.getElementById("pay_date").value;
			var msg = document.getElementById("form_msg");

			if (en_name === '' || email1 === '' || email2 === ''
					|| address === '' || account === '' || pw === ''
					|| pw_confirm === '' || date === '') {
				msg.innerHTML = "입력하지 않은 정보가 있습니다.";
				return false;
			}

			return true; // Allow form submission
		}
	</script>

	<script>
		//비밀번호 체크
		function checkPassword() {
			var password = document.getElementById("passwd").value;
			var confirmPassword = document.getElementById("confirmPassword").value;
			var message1 = document.getElementById("pw1_message");
			var message2 = document.getElementById("pw2_message");

			if (password.length !== 4) {
				message1.innerHTML = "비밀번호는 4자리 입력해야 합니다.";
			} else {
				message1.innerHTML = "";
			}
			if (password.length === 4 && password !== confirmPassword
					&& confirmPassword.length !== 0) {
				message2.innerHTML = "비밀번호가 일치하지 않습니다.";
			} else {
				message2.innerHTML = "";

			}
		}
	</script>

	<script>
		$(function() {
			var tooltipTriggerList = [].slice.call(document
					.querySelectorAll('[data-bs-toggle="tooltip"]'));
			var tooltipList = tooltipTriggerList
					.map(function(tooltipTriggerEl) {
						return new bootstrap.Tooltip(
								tooltipTriggerEl,
								{
									trigger : 'manual',
									template : '<div class="tooltip tooltip-warning" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>' // 툴팁 말풍선의 클래스 변경
								});
					});

			$('#advice-balloonCheckbox').change(function() {
				if (this.checked) {
					$('.advice-balloon1').show();
					$('.advice-balloon2').show();
					$('.advice-balloon3').show();
					$('.advice-balloon4').show();

					tooltipList.forEach(function(tooltip) {
						tooltip.show();
					});
				} else {
					$('.advice-balloon1').hide();
					$('.advice-balloon2').hide();
					$('.advice-balloon3').hide();
					$('.advice-balloon4').hide();

					tooltipList.forEach(function(tooltip) {
						tooltip.hide();
					});
				}
			});
		});
	</script>
	
	<script>
	//모달 창닫기
	$(function() {
		$('#modalClose').click(function() {
			$('#myModal').modal('hide')
		})
	})

	//모달창 띄우기
	
	function openModal(title,body){
	var modalTitle = document.getElementById("modal-title");
	modalTitle.innerHTML = title; //모달 제목
	var modalTitle = document.getElementById("modal-body");
	modalTitle.innerHTML = body; //모달 내용
		 $("#myModal").modal('show');
	}

	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>
</body>
</html>
