<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<div id="commentList">
<sec:authentication property="principal" var="principal" />
<p>전체 댓글 수 : ${pagination.count }</p>
	<c:forEach items="${list}" var="comment" varStatus="status">
		<div class="myFlex">
			<div>작성자 : ${comment.user.uName}</div>&emsp;&emsp;
			<div>내용 : ${comment.bContent}</div>&emsp;&emsp;
			<div><button type="button" class="btnInsertForm">답글</button></div>&emsp;							
			<div><button type="button" class="btnUpdateForm">수정</button></div>&emsp;
			<div><button type="button" class="btnDeletForm" bIdx="${comment.bIdx}">삭제</button></div>			
		</div>
			<div class="myFlex" style="display: none;">
				<div>작성자 : ${comment.user.uName}</div>&emsp;&emsp;
				<div>내용 : <textarea rows="1" cols="50"  class="editcon">${comment.bContent}</textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnEditForm" b_idx="${comment.bIdx}" >등록</button></div>
				<div><a href="">취소</a></div>
			</div>
	</c:forEach>
<ul>
 <c:choose>
	<c:when test="${ pagination.prevPage >= 5}">
		<li>
			<a class="page" page="${ pagination.prevPage}">◀</a>		
		</li>
	</c:when>
</c:choose> 
<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
		<c:choose>
			<c:when test="${ pagination.page == i }">
				<li style="background-color:#ededed;">
					<a class="page">${i}</a>
				</li>
			</c:when>
			<c:when test="${ pagination.page != i }">
				<li>
					<a class="page" page="${i}">${i}</a>
				</li>
			</c:when>
		</c:choose>
</c:forEach>
 <c:choose>
	<c:when test="${ pagination.nextPage <= pagination.lastPage }">
		<li style="">
			<a class="page" page="${ pagination.nextPage}">▶</a>
		</li>
	</c:when>	
</c:choose> 
</ul>
</div>