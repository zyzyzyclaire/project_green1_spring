<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<%-- 0527 ���� API ������Ʈ CDN - ���� --%>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
 <script>

 			
		// �ٷ� �����
		$(function(){
 		$(document).ready(function(){
	    	 if(confirm('�����Ͻðڽ��ϱ�?')){
	    		
	    		var IMP = window.IMP;
	   		  	IMP.init('imp87572617');
	   		  	//������ ���޵Ǵ� ����
	   			IMP.request_pay({
	   					    pg : 'inicis', 
	   					    pay_method : 'card',
	   					    merchant_uid : 'merchant_' + new Date().getTime(),
	   					    name : '�ֹ���:team3'/*��ǰ��*/,
	   					    amount : 100 /*��ǰ ����*/, 
	   					    buyer_email : 'iamport@siot.do'/*������ �̸���*/,
	   					    buyer_name : '�������̸�',
	   					    buyer_tel : '010-1234-5678'/*������ ����ó*/,
	   					    buyer_addr : '����Ư���� ������ �Ｚ��'/*������ �ּ�*/,
	   					    buyer_postcode : '123-456'/*������ �����ȣ*/
	   					}, function(rsp) {
	   						var result = '';
	   					    if ( rsp.success ) {
	   					    	alert('��������');
	   					    	
					    		location.href="mainview";
	   					    } else { 
	   					    	var msg = '������ �����Ͽ����ϴ�.\n';
	   				       		msg += '�������� : ' + rsp.error_msg;
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