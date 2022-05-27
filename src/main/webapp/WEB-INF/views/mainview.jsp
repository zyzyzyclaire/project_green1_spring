<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script> 
 	window.onload = function() {
 		 if(${cart} == 0){
 			 alert("장바구니가 비었습니다");
 		 }
	};
 </script>

</head>
<body>
	<a href="goodsDisplay?g_code=1">상세정보</a>
	<a href="goodsDisplay?g_code=2">상세정보</a>
	<a href="cartlist?u_id=wjdcksgml">장바구니목록</a>
</body>
</html>