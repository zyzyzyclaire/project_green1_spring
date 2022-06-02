<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>


<script src="https://kit.fontawesome.com/259d5f1852.js" crossorigin="anonymous"></script>
<style type="text/css">
	.header_div
	{
		font-size: 13px;
	    line-height: 1.2;
	    color: #666;
	    font-family: 'Noto Sans KR', 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
	    font-weight: 400;

        /* min-width : 1120px;	
    	max-width : 1280px;	
    	margin:auto; */
	}

    .contents
    {
        /* min-width : 1120px;	
    	max-width : 1280px;	
    	margin:auto; */

        /* float: left; */
        margin: 5px 250px 0px 250px;
        display: flex; 
        
    }

	.header_con
	{
		display: inline-block;
		width: 80px;
		padding: 5px 10px;
		text-align: center;
        font-size: 11px;
	}
	.cgv_img
	{
		width: 36px;
        height: 36px;
        display: block;
        margin: 0px auto; 
        
	}
	.header_title {
		margin-bottom: 30px;
	}
	.header_title_span {
        margin: 10px;
        margin-bottom: 50px;
    }

    .header_login {
        margin-top: 15px;
        margin-left: auto;
    }
	
    /* 전체영역에서 여백을 없애줌 */
        * {
            margin: 0;
            padding: 0;
        }
    /* ul li태그에 리스트 스타일을 없앰 */
        ul li{
            list-style: none;
        }
    /* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
        a {
            text-decoration: none;
            color:#333;
        }
    /* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 700, 높이 50만큼, 라인높이50px
    menu박스 가운데정렬, 글자가운데 정렬 */
        #menu {
            width:700px;
            height:50px;
            line-height: 50px; 
            margin: 0px 250px;
/*             margin:0 auto; */
            text-align: center;

            display: flex;
        }
    
        /* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
        #menu > ul > li {
            float:left;
            width:140px;
            position:relative;

        }
        
        /* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
        #menu > ul > li > a {
            font-weight: bold;
        }
        
        /* ul을 안보이도록 설정(하위메뉴 감춰지고 메인메뉴만 나옴) */
        #menu > ul > li > ul {
		width:130px;
		display:none;
		position: absolute;
        line-height: 3em;
    }
    
    /* 메인메뉴에 마우스를 올릴 시 하위메뉴가 보이도록 설정 */
    #menu > ul > li:hover > ul {
        display:block;
        transition: all ease 10s;
        
        position: absolute;
		z-index: 10;
        
    }
    /* #menu > ul > li > ul > li {
        margin: 10px;
        
    } */
    /* 하위메뉴에 마우스를 올릴 시 css */
    #menu > ul > li > ul > li:hover {
        text-decoration: underline;
        font-weight: 400;
        line-height: 3em;
        
		/* transition: ease 1s;
        background-color: rgba( 224, 224, 224, 0.5 );
        margin: 10px;
        border-radius: 10px; */
		}	

        #first_line {clear: both;}
        #redline{
            background-color: red; 
            clear: both;
        }

/*         .menu_ul, .menu_form, .header_title, .header_login{
            display: flex; 
            float: left;
        } */
        
        .menu_form {
        	margin-left: auto;
        }
	
</style>
</head>
<body>
	<div class="header_div">
        <div>
            <div class="cgv-ad-wrap" id="cgv_main_ad">
                <div id="TopBarWrapper" class="sect-head-ad">
                    <div class="top_extend_ad_wrap">
                        <div class="adreduce" id="adReduce">                    
                            <iframe src="//ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@TopBar_EX" width="100%" height="80" title="" frameborder="0" scrolling="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" name="TopBanner" id="TopBanner"></iframe>
                        </div> 
                        <div class="adextend" id="adExtend"></div>
                    </div><!-- //.top_extend_ad_wrap -->
                </div>    
            </div> 
        </div>
	    <div class="contents">
	        <h1 class="header_title"><a href="#"></a>
	        	<img src="https://img.icons8.com/cotton/64/undefined/popcorn.png"/>
	        	<span class="header_title_span">TEAM3_CINEMA</span>
	        </h1>
	        <ul class="header_login">
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그인" class="cgv_img"/><span>로그인</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="회원가입" class="cgv_img"/><span>회원가입</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="마이페이지" class="cgv_img"/><span>마이페이지</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" class="cgv_img"/><span>고객센터</span></a></li>
	        </ul>
	    </div>
        
        <hr id="first_line">
        
        <div id="menu">
            <ul class="menu_ul">
                <li><a href="#">영화</a>
                    <ul>
                        <li><a href="#">영화</a></li>
                        <li><a href="#">무비차트</a></li>
                    </ul>
                </li>
                <li><a href="#">예매</a>
                    <ul>
                        <li><a href="#">예매</a></li>
                    </ul>
                </li>
                <li><a href="#">스토어</a>
                    <ul>
                        <li><a href="#">영화관람권</a></li>
                        <li><a href="#">기프트카드</a></li>
                        <li><a href="#">콤보</a></li>
                        <li><a href="#">팝콘</a></li>
                        <li><a href="#">음료</a></li>
                        <li><a href="#">스낵</a></li>
                    </ul>
                </li>
                <li><a href="#">공지사항</a>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">QnA</a></li>
                        <li><a href="#">FaQ</a></li>
                        <li><a href="#">영화/예매</a></li>
                        <li><a href="#">멤버십</a></li>
                        <li><a href="#">제휴할인</a></li>
                    </ul>
                </li>
            </ul>
            
            <div class="menu_form">
                <form>
                    <input type="text" name="" size="5">
                    <button class="header_btn" type="submit">
                        <i class="fa-regular fa-magnifying-glass"></i>
                    </button>
                    <!-- <input type="submit" value="검색" class="header_btn"> -->
                </form>
            </div>
        </div>
	    
	<hr id="redline">
	</div>
		
</body>
</html>