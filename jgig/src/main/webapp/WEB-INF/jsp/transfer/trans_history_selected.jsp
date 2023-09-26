<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>거래 내역 조회</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	                        	<a class="nav-link " href="/jgig/open_account1"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
	                        	<a class="nav-link " href="/jgig/searchWord"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            금융교육
	                        	</a>
	                        	<ul class="dropdown-menu">
	                           	  <li><a class="dropdown-item" href="/jgig/searchWord">금융 용어 검색</a></li>
	                             <li><a class="dropdown-item" href="#">금융 상식 퀴즈</a></li>
	                             <hr>
	                             <li><a class="dropdown-item" href="#">이용 가이드</a></li>
	                        	</ul>
	                    	</li>
	                    	<li class="nav-item dropdown">
	                        	<a class="nav-link " href="#공지사항링크"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            커뮤니티
	                        	</a>
	                        	<ul class="dropdown-menu">
	                           	 <li><a class="dropdown-item" href="#">공지사항</a></li>
	                             <li><a class="dropdown-item" href="/jgig/board_list">게시판</a></li>
	                             <li><a class="dropdown-item" href="#">내가 쓴 글</a></li>
	                        	</ul>
	                    	</li>
	                    	<li class="nav-item dropdown">
	                        	<a class="nav-link " href="/jgig/findStore"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            지점찾기
	                        	</a>
	                        	<ul class="dropdown-menu">
	                           	 <li><a class="dropdown-item" href="/jgig/findStore">지점찾기 및 번호표 발행</a></li>
	                             <li><a class="dropdown-item" href="/jgig/detailWaiting">번호표 조회 및 취소</a></li>
	                        	</ul>
	                    	</li>
	                    	<li class="nav-item dropdown">
	                        	<a class="nav-link " href="/jgig/point_list"   role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
										href="/jgig/member_detail" role="button" data-bs-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
											class="fa fa-fw fa-user text-dark mr-3"></i>
										${sessionScope.mem_nm}님 <!--session값으로 받아오기 -->
									</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="/jgig/member_detail">마이페이지</a></li>
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
							<h2 class="h3 pt-3 ">금융 거래 연습</h2>
							<hr>
							<ul class="list-unstyled ">
								<li><a class="collapsed d-flex justify-content-between text-decoration-none" href="open_account1"> <!--선택된 메뉴는 selectsidemenu 클래스 추가 --> 계좌 개설</a>
							</li>
							<li>
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="account_list"> 계좌 조회 및 이체 </a>
							</li>
							<li>
								<a class="collapsed d-flex justify-content-between text-decoration-none  selectsidemenu" href="trans_history"> 거래 내역 조회 </a>
							</li>
							<hr>
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									카드 발급
								</a>
							</li>
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									카드 조회
								</a>
							</li>
							<hr>
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									공인인증서 발급
								</a>
							</li>
							<li >
								<a class="collapsed d-flex justify-content-between text-decoration-none" href="#">
									하위메뉴
								</a>
							</li>
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
								<h2>거래 내역 조회</h2>
							</ul>
						</div>
					</div>
					<strong class="advice-balloon advice-balloon1_trans_his_selected">거래 내역 조회를 원하시면 다음 단계(월별조회 혹은 조회)를 수행해주세요.</strong>
					<div class="row">
						<div id="service-content" class = "month-search">
							<!-- 여기에 넣으시며 됩니당 -->
							<fieldset>
							<form action="trans_history_selected_action" method="post" id = "f1" >
								<div class = "accountListCss">
									<table>
											<tr>
												<th class="bgc">계좌 선택</th>
												<td>${account}</td>
												<input type="hidden" name="account" value = "${account}">
											</tr>
											<tr>
												<th class="bgc">월별 조회</th>
												<strong class="advice-balloon advice-balloon3_trans_his_selected">2-1. 월별조회 버튼을 눌러주세요.</strong>
												<td>
													<select id="year" name="year" class="form-control" style="display: inline-block; width: auto;">
													<c:forEach var="i" begin="15" end="25">
														<option value="${i}">20${i}</option>
													</c:forEach>
													</select>년
													<select id="month" name="month" class="form-control" style="display: inline-block; width: auto;">
													<c:forEach var="i" begin="1" end="12">
														<c:choose>
															<c:when test="${i lt 10 }">
																<option value="0${i}">0${i}</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													</select>월
													<input type="submit" class="btn btn-warning" value="월별조회">
												</td>
											</tr>
									</table>
								</div>
							</form>
							<form action="trans_history_selected_action2" method="post">
								<input type="hidden" name="account" value = "${account}">
								<div class ="accountListCss">
									<table>
										<tr>
											<th class ="bgc" style="width: 248px;">조회 기간</th>
											<td>
												<input type="text" id="datepicker-start" name="startDate">
												<label for="datepicker-end">~</label>
												<input type="text" id="datepicker-end" name="endDate">
												<strong class="advice-balloon advice-balloon4_trans_his_selected">2-2-1. 조회기간을 선택해주세요</strong>
						        				<input type="submit"  class="btn btn-warning" value="조회">
						        				<strong class="advice-balloon advice-balloon5_trans_his_selected">2-2-2. 조회버튼을 선택해주세요</strong>
											</td>
										</tr>
									</table>
								</div>
						    </form>
						    <br>
						</fieldset>
						<div id="tableDiv" style="display: none;">
							<div class = "accountListCss">
								<table>
						        <thead>
						            <tr>
						                <th class = "bgc">거래일시</th>
						                <th class = "bgc">보내는분</th>
						                <th class = "bgc">받는분</th>
						                <th class = "bgc">받은금액(원)</th>
						                <th class = "bgc">보낸금액(원)</th>
						            </tr>
						        </thead>
						        <tbody>
						            <c:forEach items="${transferList}" var="transferDto">
						                <tr>
						                    <td>${transferDto.trans_date}</td>
						                    <td>${transferDto.send_nm}</td>
						                    <td>${transferDto.receive_nm}</td>
						                    <td>${transferDto.withdr_mon}</td>
						                    <td>${transferDto.depo_mon}</td>
						                </tr>
						            </c:forEach>
						        </tbody>
						    </table>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
		<script>
		    $(function() {
		    	advice_balloon()
		        var urlParams = new URLSearchParams(window.location.search)
		        var showTable = urlParams.get("showTable")
		
		        if (showTable === "true") {
		            $("#tableDiv").show()
		        } else {
		            $("#tableDiv").hide()
		        }
		        $("#datepicker-start").datepicker()
	            $("#datepicker-end").datepicker()
		    })
		    function advice_balloon(){
				$('#advice-balloonCheckbox').change(function() {
					if (this.checked) {
						$('.advice-balloon1_trans_his_selected').show()
						$('.advice-balloon3_trans_his_selected').show()
						$('.advice-balloon4_trans_his_selected').show()
						$('.advice-balloon5_trans_his_selected').show()
						console.log('말풍선을 표시합니다.')
					} else {
						$('.advice-balloon1_trans_his_selected').hide()
						$('.advice-balloon3_trans_his_selected').hide()
						$('.advice-balloon4_trans_his_selected').hide()
						$('.advice-balloon5_trans_his_selected').hide()
						console.log('말풍선을 숨깁니다.')
					}
				})
			}
		</script>
		<!-- End Script -->
	</body>
</html>