<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
 <table align="center" width="400" border="1px solid black">
  <td colspan="3"><h2 align="center" style="color: black; font-size: 25px; font-weight: 500; font-family: Malgun Gothic,����;"">��й�ȣ ã��</h2><br></td>
   <form method="post" action="findPwdOk">
      	<tr>
          <td colspan="3">
      	        <br><div>����Ͻ� ���̵� �Է��� �ּ���.</div><br>
      		  <input type="text" name="u_id" placeholder="���̵�" ><br><br>
      	  </td>
      	</tr>
      	
     	<tr>
      	  <td colspan="3">
      	         <div>����Ͻ� �̸��� �ּҸ� �Է��� �ּ���.</div><br>
      	      <input type="text" name="u_email" placeholder="E-mail"><br><br><br>
          </td>
      	</tr> 
  
   <tr>
     <td colspan="3">
      	 <button type="submit">Ȯ��</button><br><br>  
     </td>
   </tr>
  
</form>
</table>
</div>

<p style="font-size: 13px; font-family: Malgun Gothic,����; margin-top: 25px;">���̵� ��ﳪ�� ��������? <a href="findId">���̵� ã�� �ٷΰ���</a><p>
</body>
</html>