<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<style>
#checkinSuccessPopup,
#alreadyCheckedInPopup{
	display: none;
}
</style>
</head>
<body>

	<h2>메인페이지</h2>

	<p>${memberDto.mem_nm}님</p>
	<p>안녕하세요!</p>

	<form action="logout" >
		<button type="submit">로그아웃</button>
	</form>
	<form action="member_detail" method="get">
		<input type="hidden" name="mem_id" value="${memberDto.mem_id}">
		<button type="submit">마이페이지</button>
	</form>
	<form action="point_list">
		<input type="hidden" name="mem_id" value="${pointDto.mem_id}">
		<button type="submit">포인트조회</button>
	</form>
	
	<br>
	<h1>출석체크</h1>
    <p>안녕하세요, ${memberDto.mem_nm}님. 출석체크를 하면 10 포인트가 적립됩니다.</p>
    <form action="/jgig/checkin" method="post">
        <button type="submit">출석체크</button>
    </form>
	
	
    <!-- 출석체크 완료 팝업 -->
    <div id="checkinSuccessPopup" class="popup">
        출석체크가 완료되었습니다. 포인트 10점이 적립되었습니다.
    </div>

    <!-- 출석체크 이미 완료된 경우 팝업 -->
    <div id="alreadyCheckedInPopup" class="popup">
        이미 출석체크를 하셨습니다.
    </div>

   <script>
    // 출석체크 완료 시 팝업 표시
    var checkinSuccess = <%= request.getAttribute("checkinSuccess") %>; // 출석체크가 성공했으면 true로 설정
    console.log(checkinSuccess);

    // 페이지 최초 로딩 시에는 팝업을 표시하지 않음
    if (checkinSuccess !== null) {
        if (checkinSuccess) {
            showPopup("checkinSuccessPopup");
        } else {
            showPopup("alreadyCheckedInPopup");
        }
    }

    // 팝업 표시 함수
    function showPopup(popupId) {
        var popup = document.getElementById(popupId);
        popup.style.display = "block";
    }
</script>

</body>
</html>