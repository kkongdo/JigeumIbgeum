<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!-- 포인트 내역 테이블 -->
<html>
<style>
</style>

<body>
    <div class = "table-css">
    	<table class = "point_table">
	    	<colgroup>
	    	<col style = "width: 30% ;">
	    	<col style = "width: 40%;">
	    	<col style = "width: 30;">
	    	</colgroup>
	        <thead class = "table-css-bgc">
	            <tr>
	                <th>포인트</th>
	                <th>적립구분</th>
	                <th>적립날짜</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach items="${pointList}" var="p">
	                <tr>
	                    <td>${p.point}</td>
	                    <td>${p.division}</td>
	                    <td>
	                        <fmt:formatDate value="${p.point_date}" pattern="yyyy-MM-dd HH:mm" />
	                    </td>
	                </tr>
	            </c:forEach>	
	        </tbody>
    	</table>
    	<br>
			<nav aria-label="Page navigation example" class="nav jus tify-content-center">
                  <ul class="pagination">
                      <c:if test="${hasPrevious}">
                 <li class="page-item">
                     <a class="page-link"  onclick="pagetest('${filter}', '${currentPage-1}')" aria-label="Previous">
                         <span aria-hidden="true">이전</span>
                     </a>
                 </li>
             </c:if>
     
             <c:forEach begin="${startPage}" end="${endPage}" var="page">
                 <c:choose>
                     <c:when test="${page == currentPage}">
                         <li class="page-item active">
                             <span class="page-link">${page} 
                             	<span class="sr-only">(current)</span>
                             </span>
                         </li>
                     </c:when>
                     <c:otherwise>
                         <li class="page-item">
                             <!--  <a class="page-link_point" href="/jgig/point_list?currentPage=${page}">${page}</a>-->
                             <a class="page-link" onclick="pagetest('${filter}', '${page}')">${page}</a>
                         </li>
                     </c:otherwise>
                 </c:choose>
             </c:forEach>
     	
             <c:if test="${hasNext}">
                 <li class="page-item">
                     <a class="page-link"   onclick="pagetest('${filter}', '${currentPage+1}')" aria-label="Next">
                         <span aria-hidden="true">다음</span>
                     </a>
                 </li>
             </c:if>
         </ul>
     </nav>
    </div>
</body>
</html>