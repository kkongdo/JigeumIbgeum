<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html id="attendance">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지금입금 출석체크</title>

<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/templatemo.css">
<link rel="stylesheet" href="/assets/css/custom.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=IBM+Plex+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Russo+One&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/assets/js/jquery-1.11.0.min.js"></script>
<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/templatemo.js"></script>
<script src="/assets/js/custom.js"></script>

<!-- JavaScript 코드 -->
<script>
       

        // 페이지 로딩시 초기에 실행되는 JavaScript 코드
        document.addEventListener("DOMContentLoaded", function() {
            
            // 모달 창닫기
            $(function() {
                $('#modalClose').click(function() {
                    $('#myModal').modal('hide');
                });
            });

            // 모달창 띄우기
            function openModal(title, body) {
                var modalTitle = document.getElementById("modal-title");
                modalTitle.innerHTML = title; // 모달 제목
                var modalBody = document.getElementById("modal-body");
                modalBody.innerHTML = body; // 모달 내용
                $("#myModal").modal('show');
            }
            
            
            var checkinSuccess = ${sessionScope.checkinSuccess};
            if (typeof checkinSuccess !== 'undefined' && checkinSuccess !== null) {
                if (checkinSuccess === false) {
                    openModal("출석체크", "이미 출석체크 하셨습니다.");
                } else {
                    openModal("출석체크", "출석체크가 완료되었습니다.");
                }
                
            }
            
        });
    </script>


</head>
<body>

	<c:if test="${not empty sessionScope.checkinSuccess}">

		<c:remove var="checkinSuccess" scope="session" />
	</c:if>

	<div class="att-content">

		<div class="att-title vertical-center">
			<span>출석체크</span>
		</div>

		<img src="/assets/img/rubber-stamp.png" id="stamp-img">
		<div class="att-checklist">

			<table class="att-table">
				<c:set var="counter" value="0" />
				<c:forEach var="row" begin="1" end="5">
					<tr>
						<c:forEach var="col" begin="1" end="6">
							<c:set var="counter" value="${counter + 1}" />
							<c:set var="attValue" value="${att_yes[counter]}" />
							<td><c:choose>
									<c:when test="${attValue eq counter}">
										<img src="/assets/img/att-yes.png" width="70px">
									</c:when>
									<c:otherwise>
										<span>${counter}</span>

									</c:otherwise>
								</c:choose></td>
						</c:forEach>
					</tr>
				</c:forEach>

				<tr>
					<td><c:choose>
							<c:when test="${dayOfMonth eq '31'}">
								<span>31</span>
							</c:when>
						</c:choose></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>

		</div>

		<div class="att-btn">
			<form action="/jgig/checkin" method="post">
				<button type="submit">출석체크</button>
			</form>
		</div>



	</div>


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





</body>
</html>