<%@page import="java.util.List"%>
<%@page import="tommy.spring.web.board.impl.BoardDAO"%>
<%@page import="tommy.spring.web.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
</head>
<body>
<h1>글 목록</h1>
<h3>${userName } 회원님 환영합니다.<a href="logout.do">Log-Out</a></h3>
<!-- 검색시작 -->
<form action="getBoardList.do" method="post">
<table border="1">
<tr>
	<td>
		<select name="searchCondition">
			<c:forEach items="${conditionMap }" var="option">
				<option value="${option.value }">${option.key }</option>
			</c:forEach>
		</select>
		<input type="text" name="searchKeyword"/>
		<input type="submit" value="검색"/>
	</td>
</tr>
</table>
</form><br/>
<!-- 검색 종료 -->
<table border="1">
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>등록일</th>
	<th>조회수</th>
</tr>
<c:forEach var="board" items="${boardList }">
<tr>
	<td>${board.seq }</td>
	<td><a href="getBoard.do?seq=${board.seq }">${board.title }</a></td>
	<td>${board.writer }</td>
	<td>${board.regDate }</td>
	<td>${board.cnt }</td>
</tr>
</c:forEach>
</table><br/>
<a href="insertBoard.jsp">새글 작성</a>
</body>
</html>