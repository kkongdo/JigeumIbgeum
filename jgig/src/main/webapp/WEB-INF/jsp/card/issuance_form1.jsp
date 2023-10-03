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
						<li><a class="collapsed d-flex justify-content-between text-decoration-none" href="/jgig/open_account1"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 -->
								계좌 개설
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
						<div class="subcontent checkbox-div">
							<label for="advice-balloonCheckbox">도움말</label> <input type="checkbox" id="advice-balloonCheckbox">
						</div>
						<!-- 여기에 넣으시며 됩니당 -->
						<div class="subcontent">


							<!-- 	<p class="advice-balloon advice-balloon1">이것은 말풍선입니다1</p>
							<p class="advice-balloon advice-balloon2">이것은 말풍선입니다2</p>
							<p class="advice-balloon advice-balloon3">이것은 말풍선입니다3</p>
							<p class="advice-balloon advice-balloon4">이것은 말풍선입니다4</p> -->
						</div>


						<form action="card_issuance_form2" method="post" onsubmit="return validateForm();">

							<div class="subcontent">
								<table id="issu_info_table">
									<colgroup>
										<col style="width: 184px">
										<col style="width: *">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="cd_item">카드 상품명</label></th>
											<td><select name="cd_item" class="border-b" data-bs-toggle="tooltip" data-bs-placement="right" title="발급하고자 하는 카드 상품을 선택해주세요">
													<option value="노리2 체크카드">노리2 체크카드</option>
													<option value="알뜰교통플러스 체크카드">알뜰교통플러스 체크카드</option>
													<option value="톡톡M 체크카드">톡톡M 체크카드</option>
													<option value="마이핏카드">마이핏카드</option>
											</select></td>


										</tr>
									</tbody>
								</table>

							</div>
							<div class="subcontent">
								<h3 class="h3-subtitle">신청인 정보</h3>
								<div class="subcontent card-info">
									<table id="issu_info_table" class="table-center">
										<colgroup>
											<col style="width: 184px">
											<col style="width: *">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="성명">이름</label></th>
												<td><input type="text" name="cd_name" class="border-bt blank-1" placeholder="이름 입력" data-bs-toggle="tooltip"
													data-bs-placement="right" title="본인의 이름을 정확하게 입력해주세요."
												></td>

											</tr>
											<tr>
												<th scope="row"><label for="주민등록번호1 ">주민등록번호</label></th>
												<td><input type="text" name="cd_ssn_1" class="border-bt blank-2" placeholder="앞 6자리" maxlength="6"> - <input type="password"
													name="cd_ssn_2" class="border-bt blank-2" placeholder="뒤 7자리" maxlength="7" data-bs-toggle="tooltip" data-bs-placement="right"
													title="주민등록번호 앞6자리와 뒤7자리를 정확히 입력해주세요."
												> <br> <input type="hidden" name="cd_ssn" id="cd_ssn"></td>
												<!-- JavaScript를 사용하여 두 입력 값을 결합하여 cd_ssn 필드에 설정 -->

											</tr>
											<tr>
												<th scope="row"><label for="call_hp1">휴대폰번호</label></th>
												<td><input type="text" name="tel1" class="border-bt blank-3" maxlength="3"> - <input type="text" name="tel2"
													class="border-bt blank-3" maxlength="4"
												> - <input type="text" name="tel3" class="border-bt blank-3" maxlength="4" data-bs-toggle="tooltip" data-bs-placement="right"
													title="휴대폰 번호를 정확히 입력해주세요."
												> <input type="hidden" name="cd_phone" id="cd_phone"></td>

											</tr>

										</tbody>
									</table>

								</div>
								<div class="right-btn">
									<button type="button" class="card-vaild-btn" onclick="validateMeminfo()" data-bs-toggle="tooltip" data-bs-placement="left"
										title="위의 항목을 모두 입력한 뒤 버튼을 눌러주세요."
									>인증</button>
								</div>
							</div>


							<div class="subcontent">
								<h3 class="h3-subtitle">약관동의</h3>
								<div class="subcontent">
									<div class="terms-container" data-bs-toggle="tooltip" data-bs-placement="bottom" title="약관을 꼼꼼히 읽어주세요.">
										<p>귀하는 개인신용정보 수집·이용·조회 및 제공 동의에 대해 거부하실 수 있습니다. 다만, 개인(신용)정보 수집·이용·조회 및 제공에 관한 동의는 KB국민카드(KB국민비씨카드의 경우 비씨카드㈜ 포함. 이하 같습니다.)와의 상거래 관계의 설정, 유지에 필수적이거나 상거래 관계에 따라 귀하에게 제공되는 서비스와 직접적으로 관련된 필수적 사항이므로 아래의 사항에 동의하셔야만 거래관계의 설정 및 유지가 가능합니다.</p>
										<p>■ 수집·이용에 관한 사항</p>
										<p>▶ 수집·이용 목적</p>
										<p>- 카드(신청 상품) 또는 가맹점 계약의 체결·유지·이행·관리·개선, 신청 상품 서비스 또는 가맹점 서비스 제공, 법령상 의무이행, 신용질서 문란행위 조사, 분쟁처리, 전화상담 업무, 민원처리, 본인여부 확인, 신분증 진위확인</p>
										<p>▶ 보유 및 이용기간</p>
										<p>- 거래 종료일로부터 5년 (단, 다른 관련 법령에 해당되는 경우 해당 법령상의 보존기간을 따름)</p>
										<p>* 민감정보는 처리 목적 달성 후 즉시 파기 <br>* 위의 거래 종료일이란 “회원 탈회, 가맹점 해지 또는 채권ㆍ채무 관계가 소멸된 날”을 말한다</p>
										<p>■ 수집·이용 항목 <br>-주민등록번호</p>
										<p class="text-end">출처 : KB국민카드 약관동의 내용</p>
									</div>
									<div id="terms-radio">
										<input type="radio" name="agreement1" value="동의" data-bs-toggle="tooltip" data-bs-placement="bottom" title="약관을 다 읽었다면 동의를 체크해 주세요.">
										동의 <input type="radio" name="agreement1" value="비동의"> 비동의
									</div>
								</div>
							</div>
							<div class="btn-div">
								<p id="form_msg"></p>
								<button type="submit" class="card-sumit-btn" data-bs-toggle="tooltip" data-bs-placement="left" title="반드시 본인인증을 완료 후 버튼을 눌러주세요.">확인</button>
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

	<script>
		// 두 입력 필드의 값을 가져와 결합하여 설정
		var ssn1 = document.querySelector('input[name="cd_ssn_1"]');
		var ssn2 = document.querySelector('input[name="cd_ssn_2"]');
		var cdSsn = document.getElementById('cd_ssn');

		ssn1.addEventListener('input', updateSsn);
		ssn2.addEventListener('input', updateSsn);

		function updateSsn() {
			cdSsn.value = ssn1.value  + ssn2.value;
		}
	</script>

	<script>
		var tel1 = document.querySelector('input[name="tel1"]');
		var tel2 = document.querySelector('input[name="tel2"]');
		var tel3 = document.querySelector('input[name="tel3"]');
		var cdTel = document.getElementById('cd_phone');

		tel1.addEventListener('input', updateTel);
		tel2.addEventListener('input', updateTel);
		tel3.addEventListener('input', updateTel);

		function updateTel() {
			cdTel.value = tel1.value + tel2.value + tel3.value;
		}
	</script>

	<script>
		var validateMem = false; //본인인증 여부
		// 본인인증함수
		function validateMeminfo() {
			var name = document.querySelector('input[name="cd_name"]').value;
			var ssn = document.querySelector('input[name="cd_ssn"]').value;
			var tel = document.querySelector('input[name="cd_phone"]').value;

			if (name !== "${sessionScope.mem_nm}"
					|| ssn !== "${sessionScope.ssn}"
					|| tel !== "${sessionScope.phone_num}") {
				openModal("카드발급","회원 정보가 일치하지 않습니다.");
				
			} else {
				openModal("카드발급","본인 인증이 완료되었습니다.");
				validateMem = true;
			}
		}

		//약관 체크 함수
		function check_agree() {
			var agreement1 = document
					.querySelectorAll('input[name="agreement1"]:checked');

			if (agreement1.length === 0) {
				var formMsg = document.getElementById("form_msg");
				formMsg.innerHTML = "약관 항목을 확인해주세요.";
				return false;
			} else {
				var checked_agree = document
						.querySelector('input[name="agreement1"]:checked').value;
				console.log(checked_agree);
				if (checked_agree !== "동의") {
					openModal("카드발급","약관에 동의하여야 발급이 가능합니다.");
					return false;
				}
			}
			return true;
		}

		// 폼이 제출될 때 실행되는 함수
		function validateForm() {
			if (!validateMem) { //본인인증 안했으면
				openModal("카드발급","본인 인증이 필요합니다.");
				return false;
			}
			if (!check_agree()) { //약관 체크 안했으면
				return false;
			}
			return true;
		}
	</script>

	<script>
	//도움말
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
					

					tooltipList.forEach(function(tooltip) {
						tooltip.show();
					});
				} else {
				

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


	<!-- End Script -->

</body>
</html>
