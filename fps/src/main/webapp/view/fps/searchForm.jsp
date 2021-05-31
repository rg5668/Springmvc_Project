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

  <div class="w3-container w3-margin-left w3-margin-top">
    
    
    <form action="searchForm" method="get" accept-charset="utf-8">
    	

    <div>
    
    
    
		
			<p style="font-size: 20px"><b>검색 결과</b>
		
	
       	
    	
    	
    	<a style="margin-left: 60%; font-size: 12px">
    	
    	<input type="text" size="30px" placeholder="숙소명를 검색하세요." style="height: 31px; width: 20%;"  name="hotel_name">
    	
    	<input type="submit" class="w3-button w3-black" style="margin-bottom: 1.5px; height: 31px"  value="검색">
    	
    	</a><br>
    </div>
    </form>
    
    <a href="areaForm?area_code=20" style="font-size: 12px"> 서울 /</a>
    	<a href="areaForm?area_code=32" style="font-size: 12px"> 인천 /</a>
    	<a href="areaForm?area_code=31" style="font-size: 12px"> 경기 /</a>
    	<a href="areaForm?area_code=33" style="font-size: 12px"> 강원도 /</a>
    	<a href="areaForm?area_code=42" style="font-size: 12px"> 대전 /</a>
    	<a href="areaForm?area_code=53" style="font-size: 12px"> 대구 /</a>
    	<a href="areaForm?area_code=51" style="font-size: 12px"> 부산 /</a>
    	<a href="areaForm?area_code=61" style="font-size: 12px"> 광주 /</a>
    	<a href="areaForm?area_code=64" style="font-size: 12px"> 제주</a>
  </div>

<!--   <form action="list" method="post">
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
	<%-- <c:if test="${b.area_code==20 }"> --%>
<table id="customers" style="margin-top: 40px; text-align: center;">
  <tr style="font-size: 13px; text-align: center;">
    <td rowspan="3"><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }"><img src="<%=request.getContextPath()%>${b.hotel_img}" style="width: 120px; height: 100px;"></a></td>
    <th style="width: 17% ">숙소명</th>
    <th style="width: 25% ">주소</th>
    <!-- <th style="width: 10% ">가격(1박기준)</th>
    <th style="width: 10% ">인원수</th> -->
    <th style="width: 13% ">전화번호</th>
    <th style="width: 35% ">간단소개</th>
  </tr>
  


  <tr style="font-size: 12px;">
    <td rowspan="2" style="width: 17% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_name }</a></td>
    <td rowspan="2" style="width: 25% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_addr }</a></td>
    <%-- <td rowspan="2" style="width: 10% "><a href="<%=request.getContextPath() %>/view/fps/hotelSub.jsp">1,000,000원</a></td>
    <td rowspan="2" style="width: 10% "><a href="<%=request.getContextPath() %>/view/fps/hotelSub.jsp">2~3인</a></td> --%>
    <td rowspan="2" style="width: 13% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_tel }</a></td>
    <td rowspan="2" style="width: 35% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_intro }</a></td>
  </tr>  



</table>

	<div style="margin-top: 10px; font-size: 12px" align="center"><b>
	<a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">
	<input type="button" class="w3-button w3-black" style="width: 100px;" value="예약하기"></a>
	<a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">
	<input type="button" class="w3-button w3-black" style="width: 100px;" value="상세보기"></a>
	</b></div>
<%-- </c:if> --%>
</c:forEach>


<script>
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
