<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.header_div
	{
		font-size: 13px;
	    line-height: 1.2;
	    color: #666;
	    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
	    font-weight: 400;
	    
	    margin: 0px 179px;
	}
	.contents
	{
		padding: 30px;
	}
	.header_con
	{
		display: inline-block;
		width: 80px;
		padding: 5px 10px;
		text-align: center;
	}
	.cgv_img
	{
		height: 50px;
		width: 50px;
	}
	.nav-link
	{
		font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
		font-size: 13px;
	}
	.nav_overMenu
	{
		display: inline-block;
	}
	.dropdown li
	{	
		font-size: 13px;
		float: left;
	}
</style>
</head>
<body>
	<div class="header_div">
	
	    <div class="contents">
	        <h1><a href="#"></a><span>TEAM3_CINEMA</span></h1>
	        <ul class="nav justify-content-center header_footer headernav addstyle1">
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" class="cgv_img"/><span>로그인</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="회원가입" class="cgv_img"/><span>회원가입</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="마이페이지" class="cgv_img"/><span>마이페이지</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" class="cgv_img"/><span>고객센터</span></a></li>
	        </ul>
	    </div>
	    
	    <hr>
	    
	    <div>
			<ul class="nav header_footer headernav">
			  	<li class="nav-item">             		
			  		<a class="nav-link" href="#">영화</a>
			  	</li>
			  	<li class="nav-item">             		
			  		<a class="nav-link" href="#">예매</a>
			  			
			  	</li>
				<li class="nav-item">
			        <a class="nav-link" href="#">스토어</a>
			    </li>
			    <li class="nav-item">
			    	<a class="nav-link" href="#">공지사항</a>
			    </li>
			</ul>  
	    </div>
	    
	    <div class="dropdown">
		    <ul class="nav_menu">
	            <li>
	                <h2><a href="#">영화</a></h2>
	                <dl class="nav_overMenu">
	                    <dt><h2><a href="#">영화</a></h2></dt>
	                    <dd><h3><a href="#">무비차트</a></h3></dd>
	                </dl>
	            </li>
	            <li>
	                <h2><a href="#"><strong>예매</strong></a></h2>
	                <dl class="nav_overMenu">
	                    <dt><h2><a href="#">예매</a></h2></dt>
	                </dl>
	            </li>
	            <li>
	                <h2><a href="#">스토어</a></h2>
	                <dl class="nav_overMenu">
	                    <dt><h2><a href="#">스토어</a></h2></dt>
		                    <dd><h3><a href="#">영화관람권</a></h3></dd>
		                    <dd><h3><a href="#">기프트카드</a></h3></dd>
		                    <dd><h3><a href="#">콤보</a></h3></dd>
		                    <dd><h3><a href="#">팝콘</a></h3></dd>
		                    <dd><h3><a href="#">음료</a></h3></dd>
		                    <dd><h3><a href="#">스낵</a></h3></dd>
	                </dl>
	            </li>
	            <li>
	                <h2><a href="#">공지사항</a></h2>
	                <dl class="nav_overMenu">
	                    <dt><h2><a href="#">공지사항</a></h2></dt>
	                    <dd><h3><a href="#">QnA</a></h3></dd>
	                    <dd><h3><a href="#">FaQ</a></h3></dd>
	                    <dd><h3><a href="#">영화/예매</a></h3></dd>
	                    <dd><h3><a href="#">멤버십/CLUB</a></h3></dd>
	                    <dd><h3><a href="#">제휴할인</a></h3></dd>
	                </dl>
	            </li>
	        </ul>
	    </div>
	    
	<hr>
	</div>
		
</body>
</html>