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
	
	// 페이지 호출하자마자 위의 제이쿼리 실행
	$(document).ready(function(){
		$(".sort_default").trigger('click');
	});
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
	<div>
		<input type="button" name="button" value="최신순" class="sort_default">
		<input type="button" name="button" value="오래된순">
		<input type="button" name="button" value="인기순">
	</div>
		<jsp:include page="movie_list2.jsp"></jsp:include>
</body>
</html>