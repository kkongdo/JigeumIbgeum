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
						<li><a class="collapsed d-flex justify-content-between text-decoration-none  " href="/jgig/card_issuance"> 카드발급 </a></li>
						<li><a class="collapsed d-flex justify-content-between text-decoration-none   " href="/jgig/card_list"> 카드 조회 및 관리 </a></li>
						<hr>
						<li><a class="collapsed d-flex justify-content-between  text-decoration-none selectsidemenu" href="/jgig/certification"> 인증서 발급 </a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pt-5 pl-3">
							<h2>인증서 발급</h2>
						</ul>
					</div>
				</div>
				<div class="row">
					<div id="service-content">
						<div class="subcontent checkbox-div">
							<label for="advice-balloonCheckbox">도움말</label> <input type="checkbox" id="advice-balloonCheckbox">
						</div>
						<!-- 여기에 넣으시며 됩니당 -->
						<form action="certification_issuance2" method="post" onsubmit="return validateForm();">

							<div class="subcontent">
								<h3 class="h3-subtitle">사용자 본인확인</h3>
								<div class="subcontent">
									<table id="certifi_info_table" class="table-center">
										<colgroup>
											<col style="width: 184px">
											<col style="width: *">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="성명">이름</label></th>
												<td><input type="text" name="ct_name" class="border-bt blank-1" placeholder="이름 입력" data-bs-toggle="tooltip"
													data-bs-placement="right" title="본인의 이름을 정확히 입력해주세요."
												></td>
											</tr>
											<tr>
												<th scope="row"><label for="주민등록번호1 ">주민등록번호</label></th>
												<td><input type="text" name="ct_ssn_1" class="border-bt blank-2" placeholder="앞 6자리" maxlength="6"> - <input type="password"
													name="ct_ssn_2" class="border-bt blank-2" placeholder="뒤 7자리" maxlength="7" data-bs-toggle="tooltip" data-bs-placement="right"
													title="주민등록번호 앞6자리와 뒤7자리를 정확히 입력해주세요."
												> <br> <input type="hidden" name="ct_ssn" id="ct_ssn"></td>
												<!-- JavaScript를 사용하여 두 입력 값을 결합하여 cd_ssn 필드에 설정 -->

											</tr>
											<tr>
												<th scope="row"><label for="call_hp1">휴대폰번호</label></th>
												<td><input type="text" name="tel1" class="border-bt blank-3" maxlength="3"> - <input type="text" name="tel2"
													class="border-bt blank-3" maxlength="4"
												> - <input type="text" name="tel3" class="border-bt blank-3" maxlength="4" data-bs-toggle="tooltip" data-bs-placement="right"
													title="휴대폰 번호를 정확히 입력해주세요."
												> <input type="hidden" name="ct_phone" id="ct_phone"></td>

											</tr>
										</tbody>
									</table>

								</div>
								<div class="btn-div">
									<button type="button" class="card-vaild-btn" onclick="validateMeminfo()" data-bs-toggle="tooltip" data-bs-placement="left"
										title="위의 항목을 모두 입력한 뒤 버튼을 눌러주세요."
									>인증</button>
								</div>
							</div>

							<div class="subcontent">
								<h3 class="h3-subtitle">약관동의</h3>
								<div class="subcontent">
									<div class="terms-container" data-bs-toggle="tooltip" data-bs-placement="bottom" title="약관을 꼼꼼히 읽어주세요.">
										<p>
											전자금융거래기본약관<br> 제1조(목적) 이 약관은 상호저축은행과 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 거래의 신속하고 효율적인 처리를 도모하고 거래당사자 상호간의 이해관계를 합리적으로 조정하는 것을 목적으로 합니다.
											(개정 2018.4.30.)<br> 제2조(용어의 정의) ①이 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다. (개정 2018.4.30.)<br> 1. “전자금융거래”라 함은 상호저축은행이 전자적 장치를 통하여 제공하는
											금융상품 및 서비스를 이용자가 전자적 장치를 통하여 비대면․자동화된 방식으로 직접 이용하는 거래를 말합니다. (개정 2018.4.30.)<br> 2. “이용자”라 함은 전자금융거래를 위하여 상호저축은행과 체결한 계약(이하
											“전자금융거래계약”이라 한다.)에 따라 이용하는 고객을 말합니다. (개정 2018.4.30.)<br> 3. “지급인”이라 함은 전자금융거래에 의하여 자금이 출금되는 계좌(이하 “출금계좌”라 한다.)의 명의인을 말합니다. (개정
											2018.4.30.)<br> 4. “수취인”이라 함은 전자금융거래에 의하여 자금이 입금되는 계좌(이하 “입금계좌”라 한다.)의 명의인을 말합니다. (개정 2018.4.30.)<br> 5. “전자적 장치”라 함은 현금자동지급기,
											자동입출금기, 지급용단말기, 컴퓨터, 전화기, 그 밖의 전자적 방법으로 전자금융거래정보를 전송하거나 처리하는데 이용되는 장치를 말합니다. (개정 2018.4.30.)<br> 6. “접근매체”라 함은 전자금융거래에 있어서 거래지시를 하거나
											이용자 및 거래내용의 진정성을 확보하기 위하여 사용되는 다음 각목의 어느 하나에 해당하는 수단 또는 정보를 말합니다. (개정 2018.4.30.)<br> 가. 상호저축은행이 제공한 전자식 카드 및 이에 준하는 전자적 정보<br>
											나. 전자서명법에 의한 전자서명생성정보 또는 인증서 (개정 2018.4.30.)<br> 다. 상호저축은행에 등록된 이용자 번호<br> 라. 등록되어 있는 이용자의 생체정보<br> 마. 가목 또는 나목의 수단이나 정보를
											사용하는데 필요한 비밀번호<br> 7. “전자문서”라 함은 “전자금융거래법” 제2조 제1호의 규정에 따라 작성, 송․수신 또는 저장된 정보를 말합니다. (개정 2018.4.30.)<br> 8. “거래지시”라 함은 이용자가
											전자금융거래계약에 의하여 상호저축은행에 개별적인 전자금융거래의 처리를 지시하는 것을 말합니다. (개정 2018.4.30.)<br> 9. “오류”라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 약관(개별약관을 포함한다.),
											전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다. (개정 2018.4.30.)<br> 10. “계좌송금”이라 함은 이용자가 현금자동지급기, 자동입출금기를 통하여 자기 또는 타인의 계좌에 자금을 입금하는 것을
											말합니다. (개정 2018.4.30.)<br> 11. “계좌이체”라 함은 지급인이 이용하는 전자적 장치를 통한 지급지시에 따라 상호저축은행이 지급인의 특정계좌에서 자금을 출금하여 상호저축은행 또는 다른 금융기관의 계좌에 입금하는 것을
											말합니다. (개정 2018.4.30.)<br> 12. “예약에 의한 계좌이체”라 함은 계좌이체가 장래의 특정일자에 이루어지도록 이용자가 미리 거래지시하고 상호저축은행이 이를 해당일자에 처리하는 것을 말합니다. (개정 2018.4.30.)<br>
											13. “추심이체”라 함은 수취인이 이용하는 전자적 장치를 통한 추심지시에 따라 상호저축은행이 지급인의 특정계좌에서 자금을 인출하여 상호저축은행 또는 다른 금융기관의 계좌에 입금하는 것을 말합니다. (개정 2018.4.30.)<br> 14.
											“예약에 의한 추심이체”라 함은 추심이체가 장래의 특정일자에 이루어지도록 이용자가 미리 거래지시하고 상호저축은행이 이를 해당일자에 처리하는 것을 말합니다. (개정 2018.4.30.)<br> 15. “지연이체”라 함은 계좌이체가 거래지시된
											때로부터 일정 시간이 경과된 후에 이루어지도록 이용자가 요구하고, 상호저축은행이 이를 처리하는 것을 말합니다.<br> (신설 2015.9.30) (개정 2018.4.30.)<br> 16. “영업일”이라 함은 통상 상호저축은행
											영업점에서 정상적인 영업을 하는 날을 말합니다. (개정 2018.4.30.)<br> 17. “단말기 지정 및 이용”이라 함은 이용자가 전자금융거래시 계좌이체가 가능한 전자적 장치(이하 "단말기"라 합니다)의 IP, MAC주소 등 기기정보를
											상호저축은행에 등록하고 이용하는 것을 말합니다. (신설 2013.8.28) (개정 2018.4.30.)<br> 18. “추가적인 보안조치”라 함은 이용자가 지정하지 않은 단말기를 이용하여 전자금융거래를 하는 경우 제6호의 접근매체 이외의
											휴대폰문자 또는 2채널(서로 다른 두가지 이상의 통신경로를 이용) 등의 수단으로 본인임을 확인하는 방법을 말합니다. (신설 2013.8.28, 개정 2013.12.19., 2018.4.30.)<br> ②이 약관에서 별도로 정하지 아니한
											용어는 “전자금융거래법” 및 관계 법령 등에서 정하는 바에 따릅니다. (개정 2018.4.30.)<br> 제3조(적용되는 거래) 이 약관은 상호저축은행과 이용자 사이에 이루어지는 다음 사항의 전자적 장치를 이용하여 이루어지는 계좌이체(예약에
											의한 계좌이체 및 지연이체를 포함합니다. 이하 같습니다.), 추심이체(예약에 의한 추심이체를 포함한다. 이하 같다.), 계좌송금과 관련한 조회, 입․출금 등의 전자금융거래에 적용됩니다. (개정 2018.4.30.)<br> 1.
											현금자동지급기, 자동입출금기, 지급용단말기에 의한 거래<br> 2. 컴퓨터에 의한 거래<br> 3. 전화기에 의한 거래<br> 4. (삭제 2018.4.30.)
										</p>
										<p class="text-center">-이하 생략-</p>
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
		var ssn1 = document.querySelector('input[name="ct_ssn_1"]');
		var ssn2 = document.querySelector('input[name="ct_ssn_2"]');
		var cdSsn = document.getElementById('ct_ssn');

		ssn1.addEventListener('input', updateSsn);
		ssn2.addEventListener('input', updateSsn);

		function updateSsn() {
			cdSsn.value = ssn1.value + ssn2.value;
		}
	</script>
	<script>
		var tel1 = document.querySelector('input[name="tel1"]');
		var tel2 = document.querySelector('input[name="tel2"]');
		var tel3 = document.querySelector('input[name="tel3"]');
		var cdTel = document.getElementById('ct_phone');

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
			var name = document.querySelector('input[name="ct_name"]').value;
			var ssn = document.querySelector('input[name="ct_ssn"]').value;
			var tel = document.querySelector('input[name="ct_phone"]').value;

			if (name !== "${sessionScope.mem_nm}"
					|| ssn !== "${sessionScope.ssn}"
					|| tel !== "${sessionScope.phone_num}") {
				openModal("인증서 발급", "회원 정보가 일치하지 않습니다.");
			} else {
				openModal("인증서 발급", "본인 인증이 완료되었습니다.");
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
					openModal("인증서 발급", "약관에 동의하여야 발급이 가능합니다.");
					return false;
				}
			}
			return true;
		}

		// 폼이 제출될 때 실행되는 함수
		function validateForm() {
			if (!validateMem) { //본인인증 안했으면
				openModal("인증서 발급", "본인 인증이 필요합니다.");
				return false;
			}
			if (!check_agree()) { //약관 체크 안했으면
				return false;
			}
			return true;
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
