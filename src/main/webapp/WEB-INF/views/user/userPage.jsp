<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%
				String u_id = (String)session.getAttribute("u_id");
	        
	        	if(u_id == null) {
	        		%>
	        		<script>
	        			alert("�α������ּ���.");
	        			location.href="login";
	        			
	        		</script>
	        		<%
	        	}
			%>
			
<title>Insert title here</title>
<style>
*{
	/* font-family: "Nanum Gothic","Malgun Gothic","���� ���","����","Dotum","Apple Gothic","Apple SD Gothic Neo",sans-serif; */
	font-family: 'Noto Sans KR', 'CJONLYONENEW', '���� ���', '����', Dotum, sans-serif;
}

.mypage{
	margin:auto;
	min-width : 1120px;	
	max-width : 1400px;	
}


.userMovie{
	clear:both;

	margin:auto;
	min-width : 1120px;	
	max-width : 1400px;	
}
.userMovie1{
	margin-top: 50px;
}
.userMovie img{

	width: 80px;
	height: 80px;
}

.td{
	font-size: 13px;
	font-weight: 400px;
	line-height: 15.6px;
}
.lists{
	font-size: 17px;
	font-weight: 500px;
	line-height: 34px;
}


</style>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>

�����������Դϴ�.
	<jsp:include page="../main/mainHeader.jsp" flush="false"></jsp:include>
	
	
	
<div class="media mypage" style="font-size: 12px;">
  <img class="mr-3" src="../images/noimg.png" alt="NO IMG" 
       style="width: 150px; height: 150px; border: 1px solid black; float: left; 
  								margin-right: 25px;">
  <div class="media-body">
  
  		<div class="div1 divs" style="width: 100%-170px;  margin-left: 170px; border-bottom: 1px solid rgba(0, 0, 0, 0.09);">
		    <div> <span style="font-size: 29px;"> ������</span></div>
	    </div>
	   
	    
    	<div class="div1 divs" >
		    <div> <span style="font-size: 20px;"><%=u_id%></span>  </div>
	    </div>
		    <div style="width: 100%-170px;  margin-left: 170px; border-bottom: 1px solid rgba(0, 0, 0, 0.09);"></div>
		<div class="div2 divs">
		    <div><span style="font-size: 20px;">���:A</span></div>
	    </div>
	    
	    <div class="div2 divs">
		    <div> <a href="register">�����ʼ��� </a><span></span>&nbsp;/&nbsp;<a href="#s">Ż��</a></div>
	    </div>
  </div>
</div>


 <div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1">
  		<thead>
		    <tr style="text-align: center;" class="lists">
	    		<th>#</th>
				<th>�ֹ�����</th>
				<th>�ֹ���ȣ</th>
				<th>�̹���</th>
				<th>��ȭ�̹���</th>
				<th>����</th>
				<th>��ȭ���űݾ�</th>
				<th>�ֹ�ó������</th>
				<th>ȯ�ҽ�û</th>
				<th>ȯ��ó��</th>
				
		    </tr>
		  </thead>
	  <tbody>
		

			<tr style="cursor:pointer; text-align: center;">
		      <th scope="row" id="orderList1">123123</th>
		      <td id="orderList2">123123</td>
		      <td id="orderList3">123123</td>
		      <td id="orderList4">123123</td>
		      <td id="orderList5">123123</td>
		      <td id="orderList6">123123</td>
		      <td id="orderList7"> 123123</td>
		      <td id="orderList8"> 123123</td>

		      <td id="orderList9">123123 </td>
		      <td id="orderList10">123123</td>
		    </tr>	

	    
	  </tbody>
	</table>
</div> 





<div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th>myQnaList</th>
				<td>�۹�ȣ</td>
				<td>��������</td>
				<td>����</td>
				<td>�����</td>
		    </tr>
		  </thead>
	  <tbody>
	  	<c:forEach items="${myQnaList}" var="myQnaList">
				<tr>
					<td>${myQnaList.q_code}</td>
					<td>${myQnaList.q_category}</td>
					<td>${myQnaList.q_title}</td>
					<td>${myQnaList.q_date}</td>
				</tr>
		</c:forEach>
 
	   </tbody>
	</table>
</div>
	
	
	
	<div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th>myFaqList</th>
				<td>�۹�ȣ</td>
				<td>����</td>
				<td>����</td>
				<td>�����</td>
		    </tr>
		  </thead>
	  <tbody>
	  	<c:forEach items="${myFaqList}" var="myFaqList">
				<tr>
					<td>${myFaqList.f_code}</td>
					<td>${myFaqList.f_category}</td>
					<td>${myFaqList.f_title}</td>
					<td>${myFaqList.f_date}</td>
				</tr>
		</c:forEach>
 
	   </tbody>
	</table>
</div>

	<div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th>���Ż�ǰ</th>
				<td>��ǰ��ȣ</td>
			 	<td>��ǰ����</td>
			 	<td>��ǰ��</td>
		    </tr>
		  </thead>
	  <tbody>
	  <c:forEach items="${mygoodsList}" var="mygoodsList">
				<tr>
					<td>${mygoodsList.g_code}</td>
					<td>${mygoodsList.g_price}</td>
					<td>${mygoodsList.c_amount}</td>
				</tr>
		</c:forEach>
 
	   </tbody>
	</table>
</div>
	
	
<%-- <div class="userMovie" style="font-size: 12px;">
	<table class="table table-hover userMovie1" id="table_cus">
		  <thead>
		    <tr class="lists">
	    		<th>������</th>
				<td>�������ȣ</td>
			 	
		    </tr>
		  </thead>
	  <tbody>
	 <c:forEach items="${myReviewList}" var="myReviewList">
				<tr>
					<td>${myReviewList.r_code}</td>
				</tr>
		</c:forEach>
 
	   </tbody>
	</table>
</div>
	 --%>
	
	
	<jsp:include page="../main/mainFooter.jsp" flush="false"></jsp:include>
</body>
</html>