<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>FPS main</title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fps.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$.datepicker.setDefaults({//달력 설정
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
   
});


$(document).ready(function() {//달력 기본설정

	$( "#datepicker" ).datepicker({ minDate: 0});
	$( "#datepicker1" ).datepicker({ minDate:0});
	
	$('#btn2').click(function(){
		 if($( "#datepicker" ).datepicker( "getDate" )==''||$( "#datepicker" ).datepicker( "getDate" )==null)//체크인값 널체크
		 {
			 alert("체크인 날짜가 없습니다!")
	          return false;
	      }
		 else if($( "#datepicker1" ).datepicker( "getDate" )==''||$( "#datepicker1" ).datepicker( "getDate" )==null)//체크아웃값 널체크
		{
			 alert("체크아웃 날짜가 없습니다!")
	          return false;
	      }
		  return true;
		});
});

	function chancal() {//체크인 날짜 선택시 체크아웃 날짜 제한(체크아웃날짜는 체크인날짜의 최대 8일까지)
		datemin = $("#datepicker").datepicker("getDate");
		datemax = $("#datepicker").datepicker("getDate");
		datemin.setDate(datemin.getDate() + 1);
		datemax.setDate(datemax.getDate() + 8);
		$('#datepicker1').datepicker('option', {
			minDate : datemin,
			maxDate : datemax
		})
	}
</script>
<body class="w3-light-grey">

<div class="w3-black">
<header class="w3-display-container w3-content w3-center" style="max-width:1100px;">
  <img class="w3-image" src="<%=request.getContextPath() %>/w3images/d.jpg" alt="The Hotel" style="width: 1600px; height: 400px;">
  
  <div class="w3-display-middle w3-padding w3-col m8 l8" style="width: 70%;">
    <div class="w3-container w3-white" id="circle" style="padding: 13px;">
      
      <form action="<%=request.getContextPath() %>/hotel/hotelForm" method="post">
        <div id="circle" class="w3-black w3-center" style="width: 100%;">
        <a href="#" class="w3-bar-item w3-button w3-mobile fa fa-bed w3-black">  숙소보기</a>
        </div>
        <div class="w3-row-padding w3-margin-top" style="margin:8px -16px; font-size: 13px;">
          <div class="w3-half w3-left" style="border: 1px float= left; width: 19%;">
            <label><i class="fa fa-map-marker"></i> 위치</label>
          <select name="area_code" class="w3-input w3-border" style="height: 40px;">
            <option value="20">서울</option>
            <option value="32">인천</option>
            <option value="31">경기</option>
            <option value="33">강원도</option>
            <option value="42">대전</option>
            <option value="53">대구</option>
            <option value="51">부산</option>
            <option value="62">광주</option>
            <option value="64">제주</option>
          </select>
          </div>
          <div class="w3-half w3-left" style="border: 1px float= left; width: 20%; height: 30%;">
            <label><i class="fa fa-male"></i> 인원</label>
            <input class="w3-input w3-border" type="number" value="1" name="guest" min="1" max="10">
          </div>
           <div class="w3-half w3-left" style="border: 1px float= left; width: 25%;">
            <label><i class="fa fa-calendar-o"></i> 체크인</label>
            <input class="w3-input w3-border" type="date" name="sdate" id="datepicker" onchange="chancal()" readonly>
          </div>
          <div class="w3-half w3-left" style="border: 1px float= left; width: 25%;">
            <label><i class="fa fa-calendar-o"></i> 체크아웃</label>
            <input class="w3-input w3-border" type="date" name="edate" id="datepicker1" readonly> 
          </div>
          
          <div class="w3-left w3-half" style="border: 1px float= left; width: 10%;">
          <button id="btn2" class="w3-button w3-black" 
          style="height: 40px; margin-top: 30%;" type="submit">검색</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</header>
</div>

  <div class="w3-container w3-margin-left w3-margin-top">
    <h4><b>여행지 둘러보기</b></h4>
  </div>
  


  <div class="w3-row-padding w3-padding-16 w3-text-white w3-large w3-center">
    <div class="w3-half w3-left w3-center" style="border: 1px float= left; width: 110%;">
      <div class="w3-row-padding  w3-center">
        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=20"><img src="<%=request.getContextPath() %>/w3images/seoul.jpg" alt="서울" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">서울</span></a>
          </div>
        </div>

        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=32"><img src="<%=request.getContextPath() %>/w3images/incheon.jpg" alt="인천" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">인천</span></a>
          </div>
        </div>

        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=31"><img src="<%=request.getContextPath() %>/w3images/gyeonggi.jpg" alt="경기" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">경기</span></a>
          </div>
        </div>

        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=33"><img src="<%=request.getContextPath() %>/w3images/gangwondo.jpg" alt="강원도" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">강원도</span></a>
          </div>
        </div>

        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=42"><img src="<%=request.getContextPath() %>/w3images/daejeon.jpg" alt="대전" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">대전</span></a>
          </div>
        </div>

        
        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=53"><img src="<%=request.getContextPath() %>/w3images/daegu.jpg" alt="대구" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">대구</span></a>
          </div>
        </div>
      </div>

      <div class="w3-row-padding">
        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=51"><img src="<%=request.getContextPath() %>/w3images/busan.jpg" alt="부산" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">부산</span></a>
          </div>
        </div>

        
        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=61"><img src="<%=request.getContextPath() %>/w3images/gwangju.jpg" alt="광주" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">광주</span></a>
          </div>
        </div>

        
        <div class="w3-half w3-left w3-margin-bottom" style="border: 1px float= left; width: 15%;">
          <div class="w3-display-container">
            <a href="areaForm?area_code=64"><img src="<%=request.getContextPath() %>/w3images/jeju.jpg" alt="제주" style="width:100%">
            <span class="w3-display-bottomleft w3-padding">제주</span></a>
          </div>
        </div>

      </div>
    </div>
  </div>


<div class="w3-container w3-margin-left" style="margin-bottom: 10px">
    <h4><b>테마 추천</b></h4>
  </div>
<div class="w3-center" style="margin-bottom: 30px">
  <a href="temaForm?theme_code=1"><img src="<%=request.getContextPath() %>/w3images/spring.jpg" style="width:18%; margin-right: 3%"></a>
  <a href="temaForm?theme_code=2"><img src="<%=request.getContextPath() %>/w3images/summer.jpg" style="width:18%; margin-right: 3%"></a>
    <a href="temaForm?theme_code=3"><img src="<%=request.getContextPath() %>/w3images/autumn.jpg" style="width:18%; margin-right: 3%"></a>
  <a href="temaForm?theme_code=4"><img src="<%=request.getContextPath() %>/w3images/winter.jpg" style="width:18%"></a>  
</div>

<div class="w3-container w3-margin-left" style="margin-bottom: 10px">
    <h4><b>이달 기획전</b></h4>
</div>

<div class="w3-center">
  <a href="saleForm?hotel_code=2001"><img src="<%=request.getContextPath() %>/w3images/g.jpg" style="width:43%"></a>
  <a href="saleForm?hotel_code=2003"><img src="<%=request.getContextPath() %>/w3images/f.jpg" style="width:43%"></a>
  
</div>


  <div class="w3-container w3-margin-left w3-margin-top" style="margin-bottom: 10px;">
    <h4><b>2021 여름 MD추천</b></h4>
  </div>

<div class="slideshow-container">

<div class="mySlides fade w3-center">
  <div class="numbertext">1 / 3</div>
  <a href="bestForm?hotel_code=3101"><img src="<%=request.getContextPath() %>/w3images/a.jpg" style="width:70%"></a>
  <a href="bestForm?hotel_code=3101"><br><b>가평 블루스카이펜션</b><br>경기도 가평군 가평읍 북한강변로 326-187</a>
</div>

<div class="mySlides fade w3-center">
  <div class="numbertext">2 / 3</div>
  <a href="bestForm?hotel_code=3102"><img src="<%=request.getContextPath() %>/w3images/b.jpg" style="width:70%"></a>
  <a href="bestForm?hotel_code=3102"><br><b>가평 루비노펜션 (리버뷰,스파)</b><br>경기도 가평군 가평읍 호반로 1515-34</a>
</div>

<div class="mySlides fade w3-center">
  <div class="numbertext">3 / 3</div>
  <a href="bestForm?hotel_code=3103"><img src="<%=request.getContextPath() %>/w3images/c.jpg" style="width:70%"></a>
  <a href="bestForm?hotel_code=3103"><br><b>가평 캠프통포레스트펜션</b><br>경기도 가평군 설악면 자잠로377</a>
</div>
</div>


<div style="margin-bottom: 20px;">
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</div>




<script>
function myMap() {
  myCenter=new google.maps.LatLng(41.878114, -87.629798);
  var mapOptions= {
    center:myCenter,
    zoom:12, scrollwheel: false, draggable: false,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapOptions);

  var marker = new google.maps.Marker({
    position: myCenter,
  });
  marker.setMap(map);
}

var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

</body>
</html>
