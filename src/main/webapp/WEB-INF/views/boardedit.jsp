<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
<form action="boardedited" name="board" method="post">
	<input type="hidden" name="aIdx" value="${board.aIdx}">
	<p> 작성자 : </p>
	<p> 제목 : <input type="text" name="aTitle" ></p>
	<p> 내용 : <input type="text" style="width:500px; height:500px;" name="aContent" ></p>
	<input type="submit">
</form>
</body>
</html>