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

			<p style="font-size: 20px"><b>���ǰ���</b>

    	<a style="margin-left: 67%; font-size: 12px">
    	
    	<input type="text" size="30px" placeholder="���Ҹ� �˻��ϼ���." style="height: 31px; width: 20%;"  name="hotel_name">
    	
    	<input type="submit" class="w3-button w3-black" style="margin-bottom: 1.5px; height: 31px"  value="�˻�">
    	
    	</a><br>
    </div>
    </form>
    	<%-- <a href="<%=request.getContextPath() %>/admin/hlistForm" style="font-size: 12px"> ��ü���� </a> --%>
  </div>


<div style="margin-top: 10px; font-size: 12px" align="center">
	<a href="<%=request.getContextPath() %>/admin/hsinsertForm?hotel_code=${hotel_code }">
	<input type="button" class="w3-button w3-black w3-right" style="width: 130px; margin-bottom: 2%; margin-right: 3%;" value="���ǵ��"></a>
</div>

<c:forEach var="b" items="${hlist }">
	<%-- <c:if test="${b.area_code==20 }"> --%>
<table id="customers" style="margin-top: 40px; text-align: center; width: 95%;">
  <tr style="font-size: 13px; text-align: center;">
    <td rowspan="3"><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }"><img src="<%=request.getContextPath()%>/himg/${b.room_img}" style="width: 120px; height: 100px;"></a></td>
    <th style="width: 17% ">ȣ���ڵ�</th>
    <th style="width: 17% ">���ڵ�</th>
    <th style="width: 25% ">���̸�</th>
    <!-- <th style="width: 10% ">����(1�ڱ���)</th>
    <th style="width: 10% ">�ο���</th> -->
    <th style="width: 17% ">����</th>
    <th style="width: 17% ">�ο�</th>
  </tr>
  


  <tr style="font-size: 12px;">
  	<td rowspan="2" style="width: 10% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.hotel_code }</a></td>
    <td rowspan="2" style="width: 17% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.room_code }</a></td>
    <td rowspan="2" style="width: 25% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.room_name }</a></td>
    <%-- <td rowspan="2" style="width: 10% "><a href="<%=request.getContextPath() %>/view/fps/hotelSub.jsp">1,000,000��</a></td>
    <td rowspan="2" style="width: 10% "><a href="<%=request.getContextPath() %>/view/fps/hotelSub.jsp">2~3��</a></td> --%>
    <td rowspan="2" style="width: 13% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.price }</a></td>
    <td rowspan="2" style="width: 35% "><a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${b.hotel_code }">${b.guest }</a></td>
  </tr>  



</table>

	<div style="margin-top: 10px; font-size: 12px" align="center"><b>
	<a href="<%=request.getContextPath() %>/admin/hsupdateForm?room_code=${b.room_code }">
	<input type="button" class="w3-button w3-black" style="width: 130px;" value="���Ǽ���"></a>
	<a href="<%=request.getContextPath() %>/admin/hsdeleteForm?room_code=${b.room_code }">
	<input type="button" class="w3-button w3-black" style="width: 130px;" value="���ǻ���"></a>
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
