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

<style>
	.index_class {
	}

	.main
	{
		height: 1000px;
		text-align: center;
		margin-top: 100px;
	}
	
	.carousel-inner > .carousel-item > img {
      top: 0;
      left: 0;
      width: 100%;
      height: 600px;
    } 
</style>
</head>
<body class="index_class">

<jsp:include page="mainHeader.jsp" flush="false"></jsp:include> 

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
		  <div class="carousel-item active">
			<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Witch/Witch_1920774.jpg" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Ong/Top_1920774.jpg" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="https://caching2.lottecinema.co.kr/lotte_image/2022/Buz/0531/Buz_1920774.jpg" class="d-block w-100" alt="...">
		  </div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		  <span class="carousel-control-next-icon" aria-hidden="true"></span>
		  <span class="visually-hidden">Next</span>
		</button>
	</div>
	
	<div>
	
	</div>
</body>

  <jsp:include page="mainFooter.jsp" flush="false"></jsp:include>

</html>