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
 			 alert("��ٱ��ϰ� ������ϴ�");
 		 }
	};
 </script>

</head>
<body>
	<a href="goodsDisplay?g_code=1">������</a>
	<a href="goodsDisplay?g_code=2">������</a>
	<a href="cartlist?u_id=wjdcksgml">��ٱ��ϸ��</a>
</body>
</html>