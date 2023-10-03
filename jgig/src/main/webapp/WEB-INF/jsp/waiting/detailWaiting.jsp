<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<h2 class="h3 pt-3 ">지점찾기</h2>
					<hr>
					<ul class="list-unstyled ">
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none" href="/jgig/findStore"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 -->
								지점찾기 및 번호표 발행
							</a>
						</li>
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none selectsidemenu" href="/jgig/detailWaiting">
								번호표 조회 및 취소
							</a>
						</li>
					</ul>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu  pt-5 pl-3">
							<h2>번호표 조회 및 취소</h2>
						</ul>
					</div>
				</div>
				<div class="row">
					<div id="service-content"> 
						<!-- 여기에 넣으시며 됩니당 -->
							<c:set var="detailYn" value="${detailYn == 'N' ? 'N' : 'Y'}" />
							<c:if test="${detailYn eq 'Y'}">
								<div class="waiting_wrap">
									<div class="info-wrap">
										<span>대기번호</span>
										<h2>${dto.wt_no}</h2>
										<span>${dto.wt_store}</span>
									</div>
									<hr>
									<span style="font-weight: 700;">내 번호표 상세</span>
									<table class="table info-table">
										<tr>
											<td>대기고객</td>
											<td>${dto.wt_list }명</td>
										</tr>
										<tr>
											<td>예상대기시간</td>
											<td>${dto.wt_list*10 }분</td>
										</tr>
										<tr>
											<td>발행시간</td>
											<td id="wtDate"></td>
										</tr>
									</table>
									<hr>
									<span style="font-size: 14px; margin-bottom: 40px;">* 예상대기시간은 참고사항으로 지점 상황에 따라 실제 대기시간과 다를 수 있는 점 양해부탁드립니다.</span>
									<div class="ccBtn-wrap">
										<button class="btn ccBtn" onclick="waitingCancleHandler('${dto.wt_seq}')">번호표 취소</button>
									</div>
								</div>
							</c:if>
							<c:if test="${detailYn eq 'N'}">
								<div class="waiting_wrap noinfo-w-wrap">
									<div class="noinfo-wrap">
										<span><i class="fas fa-exclamation-circle"></i></span>
								    	<p style="font-size: 18px;">발행받은 번호표가 없습니다.</p>
									</div>
							    </div>
							</c:if>
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


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script>
	//번호표 취소 이벤트 
	function waitingCancleHandler(seq){
	 	const wt_data = {wt_seq : seq.toString()};
		let options = {
			type: "post",
			url : "/jgig/deleteWaiting",
			data: JSON.stringify(wt_data),
			contentType: 'application/json; charset=utf-8',
			success : function() {
				//console.log("삭제 성공");
				// location.reload();
				// 삭제 성공 div 
				var waitingWrap = document.querySelector(".waiting_wrap");
				waitingWrap.innerHTML = "";
				waitingWrap.setAttribute("class","waiting_wrap noinfo-w-wrap");
				var el = document.createElement('div');
				el.setAttribute("class","noinfo-wrap");
				var content = `<span><i class="fas fa-exclamation-circle"></i></span>`;
				content += `<p style="font-size: 18px;">발행받은 번호표가 없습니다.</p>`;
				el.innerHTML = content;
				waitingWrap.append(el);
			},
			error: function(jqXHR, textStatus, errorThrown) {
			    console.error("AJAX 오류 발생: " + textStatus, errorThrown);
			}
		}
		$.ajax(options);
	}
	
	function dateFormating(originalDateString) {
		// 날짜 형식을 변환하기 위한 매핑
	    const monthNames = [
	        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
	        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
	    ];
	
	    // 입력된 문자열을 공백으로 분할
	    const parts = originalDateString.split(' ');
	    
	    // 날짜 정보 추출
	    const month = monthNames.indexOf(parts[1]) + 1; // 월은 0부터 시작하므로 +1
	    const day = parts[2];
	
	    // 시간 정보 추출
	    const timeParts = parts[3].split(':');
	   
	    const hours = timeParts[0];
	    const minutes = timeParts[1];
	    const seconds = timeParts[2];
	
	    // 형식화된 문자열 생성
	    const formattedDate = `\${month}월 \${day}일 \${hours}시 \${minutes}분 \${seconds}초`;
	    return formattedDate;
	}
	//console.log("${dto.wt_date}");
	if("${dto.wt_date}"){
		document.querySelector("#wtDate").innerHTML = dateFormating("${dto.wt_date}");
	}
</script>
</body>
</html>