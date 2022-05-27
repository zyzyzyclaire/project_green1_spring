<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border="1" id="bodyBox">
		<tr>
			<td>영화코드</td>
			<td>개봉일자</td>
			<td>영화제목</td>
			<td>영화소개</td>
			<td>상영시간</td>
			<td>상영기간</td>
			<td>관람등급</td>
			<td>장르</td>
			<td>감독명</td>
			<td>평점</td>
			<td>영화포스터</td>
			<td>영화스틸컷</td>
			<td>비고</td>
		</tr>
		<c:forEach items="${list_sort }" var="dto">
			<tr>
				<td>${dto.m_code }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_date }" /></td>
				<td>${dto.m_title }</td>
				<td>${dto.m_intro }</td>
				<td>${dto.m_time }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.m_period }" /></td>
				<td>${dto.m_grade }</td>
				<td>${dto.m_genre }</td>
				<td>${dto.m_director }</td>
				<td>${dto.m_rate }</td>
				<td>${dto.m_position }</td>
				<td>${dto.m_pics }</td>
				<td>
					<input type="button" value="수정" onclick="location.href='edit?m_code=${dto.m_code }'">
					<input type="button" value="삭제" onclick="check();">
	 				<input type="hidden" id="m_code_hidden" value="${dto.m_code }">				
				</td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="12">
					<input type="button" value="영화 추가" onclick="location.href='reg_movie'">					
				</td>
			</tr>
	</table>
</body>
</html>