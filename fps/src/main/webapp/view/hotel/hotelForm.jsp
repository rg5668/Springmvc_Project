<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$.datepicker.setDefaults({
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


$(document).ready(function() {

	$( "#datepicker" ).datepicker({ minDate: 0});
	datemin=$("#datepicker").datepicker("getDate");
	datemax=$("#datepicker").datepicker("getDate");
	$( "#datepicker1" ).datepicker({ minDate:0});

    values = '${hotel_option1}'.split('/');//옵션 스트링값 배열로 분리
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//체크한 옵션 리로드시에도 유지
    }
    
    values = '${hotel_option2}'.split('/');//옵션 스트링값 배열로 분리
    for(var i=0; i<values.length-1; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//체크한 옵션 리로드시에도 유지
    }
    
    $("select[name=search_option]").val("${search_option}").prop("selected", true);//정렬옵션 리로드시에도 유지
    $("select[name=area_code]").val("${area_code}").prop("selected", true);//지역명 리로드시에도 유지
    
} );
function chancal()
{
	datemin=$("#datepicker").datepicker("getDate");
	datemax=$("#datepicker").datepicker("getDate");
datemin.setDate(datemin.getDate()+1);
datemax.setDate(datemax.getDate()+8);
$('#datepicker1').datepicker('option', {
	minDate:datemin,
	maxDate:datemax
  })

}
function sendOption(obj)//select체인지에도 submit기능
{
	obj.submit();
}
function sendHotel(hotel_code)//전송을 함수로 폼을 만들어서 post형식으로 전송
{
	var form = document.createElement('form'); // 폼객체 생성
    var parm = new Array();
    var input = new Array();
    parm.push( ['hotel_code', hotel_code] );
    parm.push( ['guest',${gd.guest}] );
    parm.push( ['sdate','${gd.sdate}']  );
    parm.push( ['edate', '${gd.edate}'] );


    for (var i = 0; i < parm.length; i++) {
        input[i] = document.createElement("input");
        input[i].setAttribute("type", "hidden");
        input[i].setAttribute('name', parm[i][0]);
        input[i].setAttribute("value", parm[i][1]);
        form.appendChild(input[i]);
    }
	
	form.setAttribute('method', 'post'); //get,post 가능
	form.setAttribute('action', "<%=request.getContextPath() %>/hotel/hotelSubForm"); //보내는 url
	document.body.appendChild(form);
	form.submit();
}

</script>
<meta charset="EUC-KR">
<title>숙소 리스트</title>
</head>
<body>
      <form action="<%=request.getContextPath() %>/hotel/hotelForm" method="post">

        <div class="w3-row-padding w3-margin-top w3-center" style=" font-size: 13px; margin-bottom: 10px;">
          
          <table style="width: 100%; margin-top: 20px; font-size: 14px">
 			<tr style="border: 1px; width: 100%;">
            <td class="w3-center">
            	
           <i class="fa fa-map-marker"></i> 위치
          <select name="area_code" class="w3-border" style="width: 10%">
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
            	
           <i class="fa fa-male"></i> 인원
            <input class="w3-border" style="width: 10%" type="number" value="${gd.guest }" name="guest" min="1" max="10">
          
            	
            <i class="fa fa-calendar-o"></i> 체크인
            	<input class="w3-border" style="width: 12%" type="date" value="${gd.sdate }" name="sdate" id="datepicker" onchange="chancal()" readonly>
            	
            	<i class="fa fa-calendar-o"></i> 체크아웃
            	<input class="w3-border" style="width: 12%" type="date" value="${gd.edate }" name="edate" id="datepicker1" readonly>
            	<b><input type="submit" class="w3-button w3-black" style="width: 100px; height: 30px; font-size: 12px; margin-bottom: 5px" value="검색"></b>
            </td>
        	</tr>
        </table> 
        </div>
      </form>
<div>
<div style="border-bottom: 1px solid black; border-top: 1px solid black;">
<form action="<%=request.getContextPath() %>/hotel/hotelForm" method="post">
<input type="hidden" name="area_code" value="${area_code}"><!-- 리로드용 히든객체 -->
<input type="hidden" name="guest" value="${gd.guest}">
<input type="hidden" name="sdate" value="${gd.sdate}">
<input type="hidden" name="edate" value="${gd.edate}">
<input type="hidden" name="cnt" value="2"/>
<table style="width: 100%; margin-left: 70px;">
<colgroup> <col style="width:10%"> <col style="width:10%"> <col style="width:10%"> <col style="width:10%">
<col style="width:10%"> <col style="width:10%"> <col style="width:10%"> <col style="width:10%"> </colgroup>



<tr><td><h4>공용 시설</h4></td></tr>
<tr>
<td><input type="checkbox" name="hotel_option1" value="수영장">수영장</td>
<td><input type="checkbox" name="hotel_option1" value="공용스파">공용스파</td>
<td><input type="checkbox" name="hotel_option1" value="엘레베이터">엘레베이터</td>
<td><input type="checkbox" name="hotel_option1" value="레스토랑">레스토랑</td>
<td><input type="checkbox" name="hotel_option1" value="카페">카페</td>
<td><input type="checkbox" name="hotel_option1" value="BBQ">BBQ</td>
<td><input type="checkbox" name="hotel_option1" value="편의점">편의점</td>
<td><input type="checkbox" name="hotel_option1" value="주차장">주차장</td>
<td><input type="checkbox" name="hotel_option1" value="취사가능">취사가능</td>
</tr>



<tr><td><h4>객실시설</h4></td></tr>
<tr>
<td><input type="checkbox" name="hotel_option2" value="와이파이">와이파이</td>
<td><input type="checkbox" name="hotel_option2" value="에어컨">에어컨</td>
<td><input type="checkbox" name="hotel_option2" value="드라이기">드라이기</td>
<td><input type="checkbox" name="hotel_option2" value="욕조">욕조</td>
<td><input type="checkbox" name="hotel_option2" value="욕실용품">욕실용품</td>
<td><input type="checkbox" name="hotel_option2" value="TV">TV</td>
<td><input type="checkbox" name="hotel_option2" value="냉장고">냉장고</td>
</tr>

<tr>
<td colspan="8"></td>

<td colspan="2" style="margin-left: 20px; font-size: 12px">
<b><input type="submit" value="적용하기" class="w3-button w3-black" style="width: 100px;"></b>
</td>
</tr>

</table>
<div style="float:right; margin-top: 20px;">

<table>
<tr><td><select name="search_option" style="height: 30px; font-size: 12px;" onchange="sendOption(this.form)">
<option value="L_price">요금낮은순</option>
<option value="H_price">요금높은순</option>
<option value="L_grade">평점낮은순</option>
<option value="H_grade">평점높은순</option>
</select>
</tr>
</table>
</div>
</form>
</div>



<table id="customers" style="margin-top: 70px; text-align: center;">
  <tr style="font-size: 13px; text-align: center;">
    <th style="width: 10% ">이미지</th>
    <th style="width: 10% ">숙소명</th>
    <th style="width: 20% ">주소</th>
    <th style="width: 10% ">가격(1박기준)</th>
    <th style="width: 10% ">최대인원수</th>
    <th style="width: 10% ">평점</th>
    <th style="width: 30% ">간단소개</th>
  </tr>
  <c:forEach var="h" items="${hotel }">
  <tr style="font-size: 12px;"><!-- 객체선택시 submit기능 -->
  <td style="width: 10%"><a href="#" onclick="sendHotel('${h.hotel_code}')"><img src="<%=request.getContextPath()%>/${h.hotel_img}" style="width: 100%"></a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.hotel_name }</a></td>
    <td style="width: 20% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.hotel_addr }</a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.price }</a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.guest }</a></td>
    <td style="width: 10% "><a href="#" onclick="sendHotel('${h.hotel_code}')">☆${h.hotel_grade }</a></td>
    <td style="width: 30% "><a href="#" onclick="sendHotel('${h.hotel_code}')">${h.hotel_intro }</a></td>
  </tr>  
  <tr></tr>
  <tr></tr>
 </c:forEach>
</table>

</div>  
<div style="clear: both;"></div>
</body>
</html>