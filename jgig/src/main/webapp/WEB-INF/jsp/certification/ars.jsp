<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>지금입금 ARS</title>
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



	<div id="service-content">
	
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
	
		<!-- 여기에 넣으시며 됩니당 -->

		<div class="p-4">
			<h1 id="ars-title">ARS 인증</h1>
			<hr id="ars-hr">
			<div class="subcontent">

				<p>ARS 서비스를 이용하면 고객님의 휴대폰으로 전화가 갑니다.</p>
				<p>전화를 받으신 후 화면에 보이는 승인번호를 키패드에 입력해주시길 바랍니다.</p>
				<p>아래는 연습을 위한 가상 휴대폰입니다. 휴대폰에 승인번호를 입력해주세요.</p>
				<br>

				<table class="ars-table">
					<colgroup>
						<col style="width: 30%">
						<col style="width: *">
					</colgroup>
					<tbody>
						<tr>
							<th>승인번호</th>
							<c:set var="ran"><%=java.lang.Math.round(java.lang.Math.random() * 90) + 10%></c:set>
							<td id="rand_num">${ran}</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="subcontent">
				<div id="div-phone">
					<div id="input-ars">
						<input type="text" id="input-ars-text" readonly>
					</div>
					<div id="number-pad">
						<div class="number-pad-row">
							<button onclick="appendNumber(1)">1</button>
							<button onclick="appendNumber(2)">2</button>
							<button onclick="appendNumber(3)">3</button>
						</div>
						<div class="number-pad-row">
							<button onclick="appendNumber(4)">4</button>
							<button onclick="appendNumber(5)">5</button>
							<button onclick="appendNumber(6)">6</button>
						</div>
						<div class="number-pad-row">
							<button onclick="appendNumber(7)">7</button>
							<button onclick="appendNumber(8)">8</button>
							<button onclick="appendNumber(9)">9</button>
						</div>
						<div class="number-pad-row">
							<button onclick="appendNumber(*)">*</button>
							<button onclick="appendNumber(0)">0</button>
							<button onclick="appendNumber(#)">#</button>
						</div>
						<div class="number-pad-row  ">
							<button onclick="clearInput()">⬅</button>
						</div>
					</div>
				</div>
					<div class="text-center pt-3">
					<form action="ars_action" method="post" onsubmit="return validateARS();">
						<input type="hidden" name="isARS" value="true">
						<button type="submit" class="card-sumit-btn">확인</button>
					</form>
					</div>
			</div>
		</div>

	</div>

</body>

	<!-- Start Script -->
	<script src="/assets/js/jquery-1.11.0.min.js"></script>
	<script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/templatemo.js"></script>
	<script src="/assets/js/custom.js"></script>

<script>
    function appendNumber(number) {
        var inputArsText = document.getElementById('input-ars-text');
        inputArsText.value += number;
    }

    function clearInput() {
        var inputArsText = document.getElementById('input-ars-text');
        inputArsText.value = '';
    }

    function validateARS() {
        var randnum = ${ran};
        var inputnum = document.getElementById('input-ars-text').value;

        if (randnum != inputnum) {
            openModal("ARS인증", "입력값이 다릅니다.");
           	clearInput();
            return false;
        }

        return true;
    }

    // 모달 창 닫기
    $(function() {
        $('#modalClose').click(function() {
            $('#myModal').modal('hide');
        });
    });

    // 모달 창 띄우기
    function openModal(title, body) {
        var modalTitle = document.getElementById("modal-title");
        modalTitle.innerHTML = title; // 모달 제목
        var modalBody = document.getElementById("modal-body");
        modalBody.innerHTML = body; // 모달 내용
        $("#myModal").modal('show');
    }
</script>





</html>