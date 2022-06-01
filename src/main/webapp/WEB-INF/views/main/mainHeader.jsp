<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/259d5f1852.js" crossorigin="anonymous"></script>
<style type="text/css">
	.header_div
	{
		font-size: 13px;
	    line-height: 1.2;
	    color: #666;
	    font-family: 'Noto Sans KR', 'CJONLYONENEW', '���� ���', '����', Dotum, sans-serif;
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
        margin: 20px 140px;
        
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
        margin-top: 15px;
    }

    .header_login {
        margin-bottom: 30px;
    }
	
    /* ��ü�������� ������ ������ */
        * {
            margin: 0;
            padding: 0;
        }
    /* ul li�±׿� ����Ʈ ��Ÿ���� ���� */
        ul li{
            list-style: none;
        }
    /* a�±׿� �ؽ�Ʈ ������ ���ְ� ������ #333 */
        a {
            text-decoration: none;
            color:#333;
        }
    /* ����ũ�⸦ 16px ���� ��� �����ϰ� width���� 700, ���� 50��ŭ, ���γ���50px
    menu�ڽ� �������, ���ڰ�� ���� */
        #menu {
            width:700px;
            height:50px;
            /* background: #ccc; */
            /* color:black; */
            line-height: 50px; 
            margin:0 auto;
            text-align: center;

            display: flex;

            position: sticky;
            top: 0;
        }
    
        /* menu�±� �ڽ��� ul�� �ڽ� li�� �������İ� ���� 140���� */
        #menu > ul > li {
            float:left;
            width:140px;
            position:relative;

        }
        
        /* menu�±� �ڽ��� ul�� �ڽ� li�� �������İ� ���� 140���� */
        #menu > ul > li > a {
            font-weight: bold;
        }
        
        /* ul�� �Ⱥ��̵��� ����(�����޴� �������� ���θ޴��� ����) */
        #menu > ul > li > ul {
		width:130px;
		display:none;
		position: absolute;
        line-height: 3em;
    }
    
    /* ���θ޴��� ���콺�� �ø� �� �����޴��� ���̵��� ���� */
    #menu > ul > li:hover > ul {
        display:block;
        transition: all ease 10s;
        
    }
    /* #menu > ul > li > ul > li {
        margin: 10px;
        
    } */
    /* �����޴��� ���콺�� �ø� �� css */
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

        .menu_ul, .menu_form, .header_title, .header_login{
            display: flex; 
            float: left;
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
	        <h1 class="header_title"><a href="#"></a><span>TEAM3_CINEMA</span></h1>
	        <ul class="header_login">
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="�α���" class="cgv_img"/><span>�α���</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png" alt="ȸ������" class="cgv_img"/><span>ȸ������</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="����������" class="cgv_img"/><span>����������</span></a></li>
	            <li class="header_con"><a href="#"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="������" class="cgv_img"/><span>������</span></a></li>
	        </ul>
	    </div>
        
        <hr id="first_line">
        
        <div id="menu">
            <ul class="menu_ul">
                <li><a href="#">��ȭ</a>
                    <ul>
                        <li><a href="#">��ȭ</a></li>
                        <li><a href="#">������Ʈ</a></li>
                    </ul>
                </li>
                <li><a href="#">����</a>
                    <ul>
                        <li><a href="#">����</a></li>
                    </ul>
                </li>
                <li><a href="#">�����</a>
                    <ul>
                        <li><a href="#">��ȭ������</a></li>
                        <li><a href="#">����Ʈī��</a></li>
                        <li><a href="#">�޺�</a></li>
                        <li><a href="#">����</a></li>
                        <li><a href="#">����</a></li>
                        <li><a href="#">����</a></li>
                    </ul>
                </li>
                <li><a href="#">��������</a>
                    <ul>
                        <li><a href="#">��������</a></li>
                        <li><a href="#">QnA</a></li>
                        <li><a href="#">FaQ</a></li>
                        <li><a href="#">��ȭ/����</a></li>
                        <li><a href="#">�����</a></li>
                        <li><a href="#">��������</a></li>
                    </ul>
                </li>
            </ul>
            
            <div class="menu_form">
                <form>
                    <input type="text" name="" size="5">
                    <button class="btn" type="submit">
                        <i class="fa-regular fa-magnifying-glass"></i>
                    </button>
                    <!-- <input type="submit" value="�˻�" class="btn"> -->
                </form>
            </div>
        </div>
	    
	<hr id="redline">
	</div>
		
</body>
</html>