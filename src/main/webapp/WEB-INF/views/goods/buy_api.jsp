<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%-- 0527 결제 API 아임포트 CDN - 근지 --%>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
 <script>

 			
		// 바로 실행됨
		$(function(){
 		$(document).ready(function(){
	    	 if(confirm('구매하시겠습니까?')){
	    		
	    		var IMP = window.IMP;
	   		  	IMP.init('imp87572617');
	   		  	//결제시 전달되는 정보
	   			IMP.request_pay({
	   					    pg : 'inicis', 
	   					    pay_method : 'card',
	   					    merchant_uid : 'merchant_' + new Date().getTime(),
	   					    name : '주문명:team3'/*상품명*/,
	   					    amount : 100 /*상품 가격*/, 
	   					    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
	   					    buyer_name : '구매자이름',
	   					    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
	   					    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
	   					    buyer_postcode : '123-456'/*구매자 우편번호*/
	   					}, function(rsp) {
	   						var result = '';
	   					    if ( rsp.success ) {
	   					    	alert('결제성공');
	   					    	
					    		location.href="mainview";
	   					    } else { 
	   					    	var msg = '결제에 실패하였습니다.\n';
	   				       		msg += '에러내용 : ' + rsp.error_msg;
	   					    	alert(msg);
					    		location.href="mainview";
	   					    }
	   					});
	    		 
	   	 	 } else {
	    		location.href="mainview";
	   	 	 }
    	});
 	});
   </script>
</head>
<body>
	buy_api_process...
</body>
</html>