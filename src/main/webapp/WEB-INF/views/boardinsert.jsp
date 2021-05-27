<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<h2> 게시글 작성 </h2>
	<form action="boardinserted" name="board" method="post">
		<input type="text" name="uIdx" value="${board.uIdx}">
		<p> 작성자 :<sec:authentication property="principal" var="principal"/>${principal.uName }</p>
		<p> 제목 : <input type="text" name="aTitle"></p>
		<p> 내용 : <input type="text" style="width:500px; height:500px;" name="aContent"></p>
		<button type="submit">작성하기</button>
	</form>
</body>
</html>

<!-- <sec:authorize access="isAuthenticated()">
                    	<sec:authentication property="principal.uName" var="user_id" />
                    	<div id="user_id"> ${principal.uName }</div>
                    </sec:authorize></p> -->