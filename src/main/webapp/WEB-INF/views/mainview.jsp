<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	tr:hover{
		background: yellow;	
	}
</style>
<script type="text/javascript">
 /* 	window.onload = function() {
 		 if(${cart} == 0){
 			 alert("��ٱ��ϰ� ������ϴ�");
 		 }
	}; */
	
	$(function(){
		//alert("����������������������");
	    $("input:button[name='button']").on('click',function(){
	        var kind = $(this).val();	//��ư�� Ŭ�� �Ǿ��� ��, ���� ��ư�� ���� kind ������ ���
	      	
	        $.ajax({
	            url : "goodsajax",
	            type:"post",
	            dataType : "json",
	            data : {
	                 "kind":kind
	            },
	            success : function(data){
	            	
	            	$('#datalist').empty()
	            	$('#datalist').append("<tr><td>��ǰ��ȣ</td><td>��ǰ�̸�</td><td>��ǰ����</td><td>��ǰ�����̸�</td><td>��ǰ����</td></tr>")
	            	for(var i = 0; i<data.length;i++){
	            		console.log("@@@@@@@@1"+data[i].img_origin)
	            		console.log("@@@@@@@@2"+data[i].img_1)
	            		
	             		$('#datalist').append("<tr onclick='location.href=\"goodsDisplay?g_code="+data[i].g_code+"\"' style='cursor:pointer'>"+
	            								"<td>"+data[i].g_code+"</td>"+
	            								"<td>"+data[i].g_name+"</td>"+
	            								"<td>"+data[i].g_price+"</td>"+
	            								"<td>"+data[i].img_origin+"</td>"+
	            								"<td><img src='${pageContext.request.contextPath}/resources/"+data[i].img_1+"'></td>"+
	            		  					  "</tr>") 
	            	}
	            	//$('#datalist').append("<tr><td colspan='5'><input type='button' value='��ǰ �߰�' onclick='location.href=\"addmovie\"''></td></tr>");
	            	
	            												/* <input type="button" value="��ȭ �߰�" onclick="location.href='reg_movie'">			 */
	            },
	            error : function(data){
	            	alert("����");
	            	
	            	
	            }//error
	        })//ajax
	    });//button click
	    
	}); 
		
		// ������ ȣ�����ڸ��� ���� �������� ����
		$(document).ready(function(){
			$(".sort_default").trigger('click');
		});
</script>

</head>
<body>
	<a href="addGoods">��ǰ�߰�</a>
	<a href="goodsDisplay?g_code=2">������</a>
	<a href="cartlist?u_id=wjdcksgml">��ٱ��ϸ��</a>
	<a href="movie_list">��ȭ���</a>
	<%
	if(session.getAttribute("u_id")!=null){
		String u_id =(String)session.getAttribute("u_id");
		String u_auth =(String)session.getAttribute("u_auth");
		System.out.println("u_id@@@"+u_id);
		System.out.println("u_auth@@@"+u_auth);
		out.println("<a href='userPage?u_id=wjdcksgml'>����������</a>");	
	}
	%>
	<a href='faq/list'>faq</a>
	<a href='notice/list'>notice</a>
	<a href='qna_main'>qna</a>
	<a href='review/list'>/review</a>
	<div>
		<input type="button" name="button" value="�ֽż�" class="sort_default">
		<input type="button" name="button" value="�����ȼ�">
		<input type="button" name="button" value="�α��">
	</div>
	<table width="500" border="1" id="datalist">
		
	 </table>
</body>
</html>