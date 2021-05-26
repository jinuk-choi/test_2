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
	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
</head>
<body>
	<h2> 게시글 상세보기 </h2>
			<p> 작성자 : </p>
			<br>
			<p> 제목 : ${board.aTitle}</p>
			<br>
			<p> 내용 : ${board.aContent}</p>
<table>
	<tr style="height:50px;">	
		<td style="border:none; display:show;">
			<a href="/boardedit?aIdx=${board.aIdx}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
		</td>
		<td style="border:none; display:show;">
			<a href="/boardelete?aIdx=${board.aIdx}" style="width:70%;font-weight:700;background-color:red;color:#fff;" >삭제</a>
		</td>
</table>
<h2>댓글 작성</h2>
</body>
</html>