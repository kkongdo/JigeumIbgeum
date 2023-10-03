<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    
    <style>
        /* 스타일을 추가하여 모달 팝업을 숨깁니다. */
        #myModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .p{
        font-family: 'IBM Plex Sans KR', sans-serif}
        
    </style>
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
					<h2 class="h3 pt-3 ">마이포인트</h2>
					<hr>
					<ul class="list-unstyled ">
						
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none" href="/jgig/point_list">
								포인트조회
							</a>
						</li>
						<li >
							<a class="collapsed d-flex justify-content-between text-decoration-none selectsidemenu" href="/jgig/point_conversion"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 -->
								포인트전환
							</a>
						</li>
					
					</ul>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu  pt-5 pl-3">
							<h2>포인트전환</h2>
						</ul>
					</div>
				</div>
				<div class="row">
					<div id="service-content"> 
						<!-- 여기에 넣으시며 됩니당 -->
						<body>


<div class="conversionBox">
    <div class="column">
        <p>현재 보유 포인트<br> ${totalPoint}P</p>
    </div> <div >
        <p>-</p>
    </div>
    <div class="column">
        <label for="conversionPoint">전환할 포인트</label><br>
        <input type="number" id="conversionPoint" name="conversionPoint" required>
    </div><div >
        <p>=</p>
    </div>
    <div class="column">
        <p >잔여 포인트<br> <span id="remainingPoint">0</span>P</p>
    </div>
     <button class="button_tag" onclick="showModal()">포인트 전환</button>
    
</div>


    <br>
   
   
    <!-- 모달 팝업 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <!-- 모달 메시지 표시를 위한 div 요소 추가 -->
        <div id="modalMessage"></div>
    </div>
</div>
    
 <p>확인하세요!</p> 
 <p>-포인트 전환은 1000단위 이상부터 가능합니다.<br> -포인트는 KB페이 앱에서 사용이 가능한 KB포인트리로 전환됩니다.</p> 




</body>
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
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // 입력한 전환 포인트에 따라 잔여 포인트를 계산하고 표시하는 함수
    document.getElementById('conversionPoint').addEventListener('input', function() {
        const conversionPoint = parseInt(this.value);
        const totalPoint = ${totalPoint}; // 현재 보유 포인트

        if (!isNaN(conversionPoint)) {
            const remainingPoint = totalPoint - conversionPoint;
            document.getElementById('remainingPoint').textContent = remainingPoint;
			console.log('remainingPoint = '+remainingPoint)
            // 잔여 포인트가 음수일 때 알림 메시지 표시
           /* if (remainingPoint < 0) {
                document.getElementById('alertBox').textContent = '잔여 포인트가 부족합니다.';
                document.getElementById('alertBox').style.display = 'block';
            } else {
                // 잔여 포인트가 음수가 아닌 경우 메시지 숨김
                document.getElementById('alertBox').style.display = 'none';
            }*/

            // 보유 포인트가 1000 미만인 경우 알림 메시지 표시
           // if (totalPoint < 1000) {
           //     document.getElementById('alertBox').textContent = '보유하고 계신 포인트가 1000 미만이라서 전환이 불가능합니다.';
           //     document.getElementById('alertBox').style.display = 'block';
           // } else {
                // 보유 포인트가 1000 이상일 때 메시지 숨김
                //document.getElementById('alertBox').style.display = 'none';
           // }
        }
    });

    // 포인트 전환 버튼을 클릭할 때 모달 팝업을 열고 메시지를 설정하는 함수
    function showModal() {
        const conversionPoint = parseInt(document.getElementById('conversionPoint').value);
        const totalPoint = ${totalPoint}; // 현재 보유 포인트

        if (!isNaN(conversionPoint)) {
            const remainingPoint = totalPoint - conversionPoint;
			
            if (totalPoint < 1000) {
                document.getElementById('modalMessage').textContent = '보유하고 계신 포인트가 1000 미만이라서 전환이 불가능합니다.';
            } else if (conversionPoint < 1000) {
                document.getElementById('modalMessage').textContent = '포인트 전환은 1000부터 가능합니다.';
            }  else if (remainingPoint < 0) {
                document.getElementById('modalMessage').textContent = '잔여 포인트가 부족합니다.';
            } else {
                document.getElementById('modalMessage').textContent = '전환이 완료되었습니다.';
                checkShowModal();
            } 

            const modal = document.getElementById('myModal');
            modal.style.display = 'block';
        }
    }

    // 모달 팝업을 닫는 함수
    function closeModal() {
        const modal = document.getElementById('myModal');
        modal.style.display = 'none';
    }
    
    function checkShowModal() {
    	var remainingPoint = document.querySelector("#remainingPoint").textContent;
    	console.log(remainingPoint);
    	var conversionPoint = document.querySelector("#conversionPoint").value;
    	console.log(conversionPoint);
    	const totalPoint = ${totalPoint}; // 현재 보유 포인트
    	var pdata = { conversionPoint: conversionPoint };
    	let options = {
   			type: 'POST', // POST 방식으로 변경
            url: '/jgig/point_conversion',
            data: pdata, // 필터 데이터를 POST로 전달
            success: function() {
                // 포인트 테이블의 tbody를 가져와서 데이터를 삽입합니다.
            },
            error: function(error) {
                console.error('데이터 로드 중 오류 발생:', error);
            }
    	}
        $.ajax(options);
    }
    
    
    
</script>
</body>

</html>

