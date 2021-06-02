<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
	<style>
		a {
				text-decoration:none;
				color:#000;
				font-weight:700;
				border:none;
				cursor:pointer;
				padding:10px;
				display:inline-block;
			}
		.myFlex {
		display: flex;
		}
		
		ul {
		width:600px;
		height:50px;
		margin:10px auto;
		}	
		
		li {
			list-style:none;
			width:50px;
			line-height:50px;
			border:1px solid #ededed;
			float:left;
			text-align:left;
			margin:0 5px;
			border-radius:5px;
		}
	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
</head>
<body>
	<h2> 게시글 상세보기 </h2>
			<p> 작성자 :${board.user.uName} </p>
			<br>
			<p> 제목 : ${board.aTitle}</p>
			<br>
			<p> 내용 : ${board.aContent}</p>
<table>
<sec:authentication property="principal" var="principal" />
	<tr style="height:50px;">	
		<c:choose>
			<c:when test="${principal.uName == board.user.uName }">
				<td style="border:none; display:show;">
					<a href="/boardedit?aIdx=${board.aIdx}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
				</td>
			</c:when>
			<c:otherwise>
				<td style="border:none; display:none;">
					<a href="/boardedit?aIdx=${board.aIdx}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
				</td>
			</c:otherwise>
		</c:choose>
		<sec:authorize var="isAdmin" access="hasRole('ROLE_ADMIN')"></sec:authorize>
		<c:choose>
			<c:when test="${principal.uName == board.user.uName || isAdmin }">
				<td style="border:none; display:show;">
					<a href="/boardelete?aIdx=${board.aIdx}" style="width:70%;font-weight:700;background-color:red;color:#fff;" >삭제</a>
				</td>
			</c:when>
			<c:otherwise>
				<td style="border:none; display:none;">
					<a href="/boardelete?aIdx=${board.aIdx}" style="width:70%;font-weight:700;background-color:red;color:#fff;" >삭제</a>
				</td>
			</c:otherwise>
		</c:choose>	
			<td style="border:none;">
				<a href="/boardinsert?aGroup=${board.aGroup}&aOrder=${board.aOrder}&aDepth=${board.aDepth}" style="width:80%;font-weight:700;background-color:#818181;color:#fff;" >답글쓰기</a>
			</td>	
</table>
<h2>댓글 작성</h2>
<div>
	<sec:authentication property="principal" var="principal" />
	<input type="hidden" name="aIdx" value="${board.aIdx}">
	<p> 작성자 : ${principal.uName }</p>
	<p> 내용 : <input type="text" style="width:500px; height:50px;" name="content" id="content" >&emsp; 
		<input type="button" value="작성하기" id="btnReg"  b_order="0" b_depth="0" b_group="0">
	</p>
</div>
<h2> 댓글 보기 </h2>

<div id="commentList">
<sec:authentication property="principal" var="principal" />
<p>전체 댓글 수 : ${pagination.count }</p>
	<c:forEach items="${list}" var="comment" varStatus="status">
		<div class="myFlex">
		<sec:authentication property="principal" var="principal" />
			<div>
				<c:if test="${comment.bDepth > 1 }">
					<c:forEach begin="2" end="${comment.bDepth}">
						&nbsp;&nbsp;
					</c:forEach>
					<c:forEach begin="2" end="${comment.bDepth}">
						┕
					</c:forEach>
				</c:if>작성자 : ${comment.user.uName}
			</div>&emsp;&emsp;	
			<div>내용 : ${comment.bContent}</div>&emsp;&emsp;
			<div><button type="button" class="btnInsertForm">답글</button></div>&emsp;	
				<c:choose>
					<c:when test="${principal.uName == comment.user.uName }">
						<div><button type="button" style="display:show;" class="btnUpdateForm">수정</button></div>&emsp;
					</c:when>
					<c:otherwise>
						<div><button type="button" style="display:none;" class="btnUpdateForm">수정</button></div>&emsp;
					</c:otherwise>
				</c:choose>
				<sec:authorize var="isAdmin" access="hasRole('ROLE_ADMIN')"></sec:authorize>
				<c:choose>
					<c:when test="${principal.uName == comment.user.uName || isAdmin }">
						<div><button type="button" style="display:show;" class="btnDeletForm" bIdx="${comment.bIdx}">삭제</button></div>	
					</c:when>
					<c:otherwise>
						<div><button type="button" style="display:none;" class="btnDeletForm" bIdx="${comment.bIdx}">삭제</button></div>	
					</c:otherwise>
				</c:choose>															
		</div>
			<div class="myFlex" style="display: none;">
				<div>작성자 : ${comment.user.uName}</div>&emsp;&emsp;
				<div>내용 : <textarea rows="1" cols="50"  class="editcon">${comment.bContent}</textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnEditForm" b_idx="${comment.bIdx}" >등록</button></div>
				<div><a href="">취소</a></div>
			</div>
			<div class="myFlex" style="display: none;">
				<div>작성자 :${principal.uName }</div>&emsp;&emsp;
				<div>내용 : <textarea rows="2" cols="50"  class="insertcon"></textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnInForm" b_idx="${comment.bIdx}" b_group="${comment.bGroup}" b_order="${comment.bOrder}"  b_depth="${comment.bDepth}" >등록</button></div>
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
<script>

$(document).on('click', '.btnUpdateForm', function () {
	let viewDiv = $(this).parent().parent();
	viewDiv.next().show();
	viewDiv.hide();
});

$(document).on('click', '.btnInsertForm', function () {
	let viewDiv = $(this).parent().parent();
	viewDiv.next().next().show();
	viewDiv.hide();
});

/*댓글 작성*/
$(document).on('click', '#btnReg', function () {
	let uIdx = '${principal.uIdx}';
	let bContent = $('#content').val();
	let aIdx = '${board.aIdx}';
	let count = '${pagination.count }';
	let b_depth = $(this).attr('b_depth');
	let b_order = $(this).attr('b_order');
	let b_group = $(this).attr('b_group');
	
	
	$.ajax({
		 method: "POST",
		 url: "aj-comment-insert",
		 data: { 
			 uIdx: uIdx, 
			 bContent: bContent,
			 aIdx: aIdx,
			 count: count,
			 bGroup: b_group,
			 bDepth: b_depth,
			 bOrder: b_order
			 
		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

/*답글 작성*/
$(document).on('click', '.btnInForm', function () {
	let insertcon = $(this).parent().prev().find('.insertcon').val();
	let uIdx = '${principal.uIdx}';
	let aIdx = '${board.aIdx}';
	let bIdx = $(this).attr('b_idx');
	let count = '${pagination.count }';
	let b_depth = $(this).attr('b_depth');
	let b_order = $(this).attr('b_order');
	let b_group = $(this).attr('b_group');

	$.ajax({
		 method: "POST",
		 url: "aj-comment-insert",
		 data: { 
	
			 bContent: insertcon,
			 uIdx: uIdx,
			 aIdx: aIdx,
			 bIdx: bIdx,
			 count: count,
			 bDepth: b_depth,
			 bOrder: b_order,
			 bGroup: b_group		 	 

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

/*댓글 수정*/
$(document).on('click', '.btnEditForm', function () {
	let editcon = $(this).parent().prev().find('.editcon').val();
	let b_idx = $(this).attr('b_idx');
	let a_idx = '${board.aIdx}';
	let count = '${pagination.count }';
	let uIdx = '${principal.uIdx}';

	$.ajax({
		 method: "POST",
		 url: "aj-comment-edit",
		 data: { 
	
			 bContent: editcon,
			 bIdx: b_idx,
			 aIdx: a_idx,
			 uIdx: uIdx,
			 count: count

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

$(document).on('click', '.btnDeletForm', function () {
	let b_idx = $(this).attr('bIdx');
	let a_idx = '${board.aIdx}';
	let count = '${pagination.count }';

	$.ajax({
		 method: "POST",
		 url: "aj-comment-delete",
		 data: { 	
			 bIdx: b_idx,
			 aIdx: a_idx,
			 count: count

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

$(document).on('click', '.page', function () {
	let aIdx = '${board.aIdx}';
	let page = $(this).attr("page");
	
	$.ajax({
		 method: "GET",
		 url: "aj-comment-list/"+page,
		 data: { 	
			 aIdx: aIdx,
			 pageOpt: page
		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});
</script>
</body>
</html>