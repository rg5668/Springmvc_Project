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

<body class="w3-light-grey">



<c:if test="${hotel_code eq '2001' }">
  <div class="w3-container w3-margin-left w3-margin-top">
    <h4><b><c:out value="드래곤시티"/> 브랜드 특가</b></h4>
  </div>
  
  
  <div class="w3-center">
  <a href="saleForm?hotel_code=${hotel_code }"><img src="<%=request.getContextPath() %>/w3images/g.jpg" style="width:850px; margin-top: 10px;"></a>
  </div>
</c:if>
  
<c:if test="${hotel_code eq '2003' }">
  <div class="w3-container w3-margin-left w3-margin-top">
    <h4><b><c:out value="힐톤"/> 브랜드 특가</b></h4>
  </div>
  
  
  <div class="w3-center">
  <a href="saleForm?hotel_code=${hotel_code }"><img src="<%=request.getContextPath() %>/w3images/f.jpg" style="width:850px; margin-top: 10px;"></a>
  </div>
</c:if>
  
<!--   <form action="saleForm" method="post">
 		<table style="width: 100%; margin-top: 20px; font-size: 14px">
 			<tr style="border: 1px; width: 100%;">
            <td class="w3-center">
            	
           <i class="fa fa-male"></i> 인원
            <input class="w3-border" style="width: 10%" type="number" value="1" name="Adults" min="1" max="10">
          
            	
            	<i class="fa fa-calendar-o"></i> 체크인
            	<input class="w3-border" style="width: 15%"  type="date" name="checkin">
            	
            	<i class="fa fa-calendar-o"></i> 체크아웃
            	<input class="w3-border" style="width: 15%" type="date" name="checkout">
            
            	<b><input type="submit" class="w3-button w3-black" style="width: 100px; height: 30px; font-size: 12px; margin-bottom: 5px" value="검색"></b>
            </td>
        	</tr>
        </table>  
          
</form> -->


  <c:forEach var="b" items="${list }">
 <table id="customers" style="margin-top: 20px; text-align: center; width:68%;">

  <tr style="font-size: 13px; text-align: center;">
    <td rowspan="3"><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }"><img src="<%=request.getContextPath()%>${b.room_img}" style="width: 135px; height: 100px;"></a></td>
    <th style="width: 15% ">숙소명</th>
    <th style="width: 20% ">주소</th>
    <th style="width: 10% ">가격(1박기준)</th>
    <th style="width: 10% ">인원수</th>
    <th style="width: 25% ">간단소개</th>
  </tr>
  <tr style="font-size: 12px;">
    <td rowspan="2" style="width: 15% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_name }</a></td>
    <td rowspan="2" style="width: 20% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_addr}</a></td>
    <td rowspan="2" style="width: 15% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.price}</a></td>
    <td rowspan="2" style="width: 10% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.guest}</a></td>
    <td rowspan="2" style="width: 25% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_intro}</a></td>
  </tr>
  
</table>
  


	<div style="margin-top: 10px; font-size: 12px" align="center"><b>
	<a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">
	<input type="button" class="w3-button w3-black" style="width: 100px;" value="예약하기"></a>
	
	<a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">
	<input type="button" class="w3-button w3-black" style="width: 100px;" value="상세보기"></a>
	</b></div>

</c:forEach>


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
