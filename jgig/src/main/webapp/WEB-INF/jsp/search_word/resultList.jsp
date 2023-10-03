<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="search-result">
	<ul class="word-list">
<%-- ${result_list.size()} --%>
	<c:forEach items="${result_list}" var="item">
		<li>
			<div class="p-title">
				<span class="tit">${item.word}</span>
			</div>
			<div class="p-conts">
				<div class="inner">${item.content}</div>
			</div>
		</li>
	</c:forEach>
	</ul>
</div>