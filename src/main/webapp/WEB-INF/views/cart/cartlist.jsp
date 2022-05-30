<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
 <script>
 function deleteCart(c_code,u_id) { 
	 //alert("들어오냐?"+c_code);
		alert(u_id)
		if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){ 
			//location.href = "deleteCart.jsp?cart_number="+cart_number; 
			$.ajax({
				url:"deleteCart",
				type:"post",
				data:{"c_code":c_code,"u_id":u_id
					 },
				success:function(data){	
					//document.getElementById("tablebox").innerHTML =data;
					//alert("성공?")
					location.href="cartlist?u_id="+u_id;
					
				},
				error:function(){
					//alert("실패?")
					
					//document.getElementById("tablebox").innerHTML ="<h3>data fail</h3>";
				}
			}); 
			
		} 
	} 
 

 		
		function amount(classcount,c_maount) { 
			$('.c_amount'+classcount).val(c_maount).prop("selected",true);
		} 
	
		
	  	var count = 0;
		var c_code = 0;
		var u_id = null;
		var g_cdoe = 0;
		
	   function change(cou,code,id,gcode){ 
		   count = cou
		   c_code = code
		   u_id =  id 
		   g_cdoe = gcode
	  }
	   
	   $(document).ready(function() {
		   $('.c_amount1').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   });
		   $('.c_amount2').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
		   $('.c_amount3').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
		   $('.c_amount4').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
		   $('.c_amount5').change(function() {
			   var c_amount = $('.c_amount'+count).val();
			   aj(c_amount,c_code,u_id,g_cdoe);
		   }); 
	  }); 
	   
	  function aj(ajc_amount,ajc_code,aju_id,ajg_cdoe){ 
		   //alert(ajc_amount+"@@"+ajc_code+"@@"+aju_id+"@@"+ajg_cdoe)	
			$.ajax({
				url:"updateCart",
				type:"post",
				data:{"c_code":ajc_code,"c_amount":ajc_amount,"u_id":aju_id,"g_code":ajg_cdoe
					 },
				success:function(data){	
					//document.getElementById("price").innerHTML =data; 
					
					location.href="cartlist?u_id="+u_id;
					
				},
				error:function(){
					
					/* document.getElementById("tablebox").innerHTML ="<h3>data fail</h3>"; */
				}
			});
	  }
	   
	
 	//0530 결제api. 실행된 후 form action으로 감 - 근지
 	$(function(){
	     $(".cart_buyBtn").on("click",function(){
	    	 
/* 	    	 var chk_val_arr = [];
	    	 $("input:checkbox[name=cart_listc_code]").each(function() {
	    		var chk = $(this).val();
	    		chk_val_arr.push(chk);
	    		console.log(chk_val_arr);
	    	 }); */
	    	 
	    	 if(confirm('구매하시겠습니까?')){
	    		
	    		var IMP = window.IMP;
	   		  	IMP.init('imp87572617');
	   		  	//결제시 전달되는 정보
	   			IMP.request_pay({
	   					    pg : 'inicis', 
	   					    pay_method : 'card',
	   					    merchant_uid : 'merchant_' + new Date().getTime(),
	   					    name : '주문명:team3'/*상품명*/,
	   					    amount : 100/*상품 가격*/, 
	   					    buyer_email : 'iamport@siot.do'/*구매자 이메일*/,
	   					    buyer_name : '구매자이름',
	   					    buyer_tel : '010-1234-5678'/*구매자 연락처*/,
	   					    buyer_addr : '서울특별시 강남구 삼성동'/*구매자 주소*/,
	   					    buyer_postcode : '123-456'/*구매자 우편번호*/
	   					}, function(rsp) {
	   						var result = '';
	   					    if ( rsp.success ) {
	   					    	alert('결제성공');
	   					    	
	   					    	// 결제성공시 컨트롤러로 보내져서 history table에 추가됨
					    		document.buy_frm.submit();
	   					    } else {
	   					    	alert('결제실패');
	   					    }
	   					});
	    		 
	   	 	 }
    	});
 	});
		

 </script>
</head>
<body>
	<form method="post" action="buy" name="buy_frm">
		<table>
			<tr>
				<td>선택하기</td>
				<td>상품번호</td>
				<td>상품갯수</td>
				<td>상품총가격</td>
				<td>삭제</td>
			</tr>
			 <c:forEach items="${cartlist}" var="cartlist" varStatus="status">
				<tr onload="">
					<td><input type="checkbox" name="cart_listc_code" value="${cartlist.c_code}"></td>
					<td>${cartlist.g_code}</td>
					<td>	
					<input type="hidden" id="stcount${status.count}" value="${status.count}">
					<input type="hidden" id="stcount${cartlist.c_code}" value="${cartlist.c_code}">
					<input type="hidden" id="stcount${cartlist.u_id}" value="${cartlist.u_id}">
						<select name="c_amount" id="c_amount1" class="c_amount${status.count}" onclick="change('${status.count}','${cartlist.c_code}','${cartlist.u_id}','${cartlist.g_code}')">
							<option value="1" onclick="change()">1</option>
							<option value="2" onclick="change()">2</option>
							<option value="3" onclick="change()">3</option>
							<option value="4" onclick="change()">4</option>
							<option value="5" onclick="change()">5</option>
						</select>
					</td>
					<script>
						amount(${status.count},${cartlist.c_amount});
					</script>
					<td  id="price">${cartlist.g_price}</td>
					<%-- <td>${cartlist.u_id}</td> --%>
					<%-- <td>${cartlist.c_code}</td> --%>
					<td><input type="button" value="삭제" onclick="deleteCart('${cartlist.c_code}','${cartlist.u_id}')"></td>
				</tr>
			</c:forEach> 
		</table>
		<input type="button" value="구매하기" class="cart_buyBtn">
	</form>
</body>
</html>