<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

$(function(){
    
    $("input:button[name='button']").on('click',function(){
        var kind = $(this).val();	//버튼이 클릭 되었을 시, 개별 버튼의 값이 kind 변수에 담김
        $.ajax({
            
            url : "ajax",
            type : "post",
            data : {
                 "kind":kind
            },
            success : function(data){
            	document.getElementById("bodyBox").innerHTML = data;
            },
            error : function(data){
            	document.getElementById("bodyBox").innerHTML = "<h3>ajax fail</h3>";
            }//error
        })//ajax
    });//button click
    
}); 
	
/* 	// 페이지 호출하자마자 위의 제이쿼리 실행
	$(document).ready(function(){
		$(".sort_default").trigger('click');
	}); */
</script>


    <script type="text/javascript">	
		function check(){
			var value = $('#m_code_hidden').val();
		    if(confirm("삭제하시겠습니까?")){
		        location.href = "del_movie?m_code="+value;
		    } else {
		    }
		}
	</script>
</head>
<body>
	<form method="post" action="serch_mov">
		<input type="text" name="serch_mov">
		<input type="submit" value="검색">
	</form>
	<div>
		<input type="button" name="button" value="최신순" class="sort_default">
		<input type="button" name="button" value="오래된순">
		<input type="button" name="button" value="인기순">
	</div>
	
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
		<c:forEach items="${list }" var="dto">
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
	
		<%-- <jsp:include page="movie_list2.jsp"></jsp:include> --%>
</body>
</html>