<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main2.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<meta charset="EUC-KR">

<script>
$(document).ready(function() {
/* 	alert('${hotel4s.hotel_option1}') */
    values = '${hotel4s.hotel_option1}'.split('/');//옵션 스트링값 배열로 분리
    for(var i=0; i<values.length; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//체크한 옵션 리로드시에도 유지
    }
    
    values = '${hotel4s.hotel_option2}'.split('/');//옵션 스트링값 배열로 분리
    for(var i=0; i<values.length; i++){
        $("input:checkbox[value="+values[i]+"]").prop("checked", true);//체크한 옵션 리로드시에도 유지
    }

    
} );
</script>
<title>Insert title here</title>
</head>
<body>
	
	<div align="center" style="margin-bottom: 1%; margin-top: 1%;">
	<h3><b>${hotel4s.hotel_name }</b><br>숙소가 등록 완료되었습니다.</h3>
	</div>
	
	  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4">
		<a href="<%=request.getContextPath() %>/hotel/hotelSubForm?hotel_code=${hotel4s.hotel_code }"><img src="<%=request.getContextPath()%>/himg/${hotel4s.hotel_img}" style="width: 150px; height: 170px;">
		</a></td>
		
		<td >호텔코드</td>
		<td><input type="text" name="hotel_code" id="hotel_code" value="${hotel4s.hotel_code }"></td>
		</tr>
		
		<tr>
		<td>호텔이름</td>
		<td><input type="text" name="hotel_name" id="hotel_name" value="${hotel4s.hotel_name }"></td>
		</tr>
		
		<tr>
		<td>전화번호</td>
		<td><input type="text" name="hotel_tel" id="hotel_tel" value="${hotel4s.hotel_tel }"></td>
		</tr>
		
		<tr>
		<td>주소</td>
		<td><input type="text" name="hotel_addr" id="hotel_addr" value="${hotel4s.hotel_addr }"></td>
		</tr>
		
		<tr>
		<td>지역</td>
		<td colspan="2">

		<select name="area_code" id="area_code" style="width: 100%" >              
              <option value="20">서울</option>
              <option value="31">경기도</option>
              <option value="32">인천</option>
              <option value="33">강원도</option>
              <option value="42">대전</option>
              <option value="51">부산</option>
              <option value="53">대구</option>
              <option value="62">광주</option>
              <option value="64">제주도</option>
        </select>
		</td>
		</tr>
		
		<tr>
		<td>계절테마</td>
		<td colspan="2">

		<select name="theme_code" id="theme_code" style="width: 100%">              
              <option value="1">봄
              <option value="2">여름
              <option value="3">가을
              <option value="4">겨울
        </select>
		</td>
		</tr>
		
		
		<tr>
		<td>공용시설</td>
		<td colspan="2">

		<label><input type="checkbox" value="수영장" name="hotel_option1" id="hotel_option1">수영장</label>
		<label><input type="checkbox" value="공용스파" name="hotel_option1" id="hotel_option1">공용스파</label>
		<label><input type="checkbox" value="노래방" name="hotel_option1" id="hotel_option1">노래방</label>
		<label><input type="checkbox" value="엘레베이터" name="hotel_option1" id="hotel_option1">엘레베이터</label>
		<label><input type="checkbox" value="레스토랑" name="hotel_option1" id="hotel_option1">레스토랑</label>
		<label><input type="checkbox" value="카페" name="hotel_option1" id="hotel_option1">카페</label>
		<label><input type="checkbox" value="편의점" name="hotel_option1" id="hotel_option1">편의점</label>
		<label><input type="checkbox" value="주차장" name="hotel_option1" id="hotel_option1">주차장</label>
		
		</td>
		</tr>
		
		<tr>
		<td>객실시설</td>
		<td colspan="2">

		<label><input type="checkbox" value="와이파이" name="hotel_option2" id="hotel_option2">와이파이</label>
		<label><input type="checkbox" value="에어컨" name="hotel_option2" id="hotel_option2">에어컨</label>
		<label><input type="checkbox" value="드라이기" name="hotel_option2" id="hotel_option2">드라이기</label>
		<label><input type="checkbox" value="욕조" name="hotel_option2" id="hotel_option2">욕조</label>
		<label><input type="checkbox" value="욕실용품" name="hotel_option2" id="hotel_option2">욕실용품</label>
		<label><input type="checkbox" value="tv" name="hotel_option2" id="hotel_option2">tv</label>
		<label><input type="checkbox" value="냉장고" name="hotel_option2" id="hotel_option2">냉장고</label>
		
		
		</td>
		</tr>
		
		<tr>
		<td>간단소개</td>
		<td colspan="2">
		<textarea cols="50" rows="5" name="hotel_intro" id="hotel_intro" >${hotel4s.hotel_intro }</textarea></td>
		</tr>
		
		<tr>
		<td colspan="3">
     	<a href="<%=request.getContextPath() %>/admin/hinsertForm?hotel_code=${hotel4s.hotel_code }">
		<input type="button" class="w3-button w3-black" style="width: 32%;" value="숙소추가등록"></a>
		<a href="<%=request.getContextPath() %>/admin/hsinsertForm?hotel_code=${hotel4s.hotel_code }">
		<input type="button" class="w3-button w3-black" style="width: 32%;" value="객실등록"></a>
		<a href="<%=request.getContextPath() %>/admin/hlistForm">
		<input type="button" class="w3-button w3-black" style="width: 32%;" value="완료"></a>
     	</tr>
     	
     	
</table>


</body>
</html>