<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main2.css">

<meta charset="UTF-8">
<script>
function hinsert_submit() {
	
	
	var f = document.f;
	
	
	if(f.hotel_code.value=="") {
		alert("호텔코드를 입력하세요.");
		f.hotel_code.focus();
		return;
	} else if (f.hotel_name.value=="") {
		alert("이름을 입력하세요.")
		f.hotel_name.focus();
		return;
	} else if (f.hotel_tel.value=="") {
		alert("번호를 입력하세요.")
		f.hotel_tel.focus();
		return;
	} else if (f.hotel_addr.value=="") {
		alert("주소를 입력하세요.")
		f.hotel_addr.focus();
		return;
	}  else if (f.hotel_intro.value=="") {
		alert("내용을 입력하세요.")
		f.hotel_intro.focus();
		return;
	} 
	
	f.submit();
}

function win_upload() {
	var op = "width=500, height=150, left=50, top=150";
	open("pictureimgForm", "", op);
}

function doSomething() {
    var url = document.forms[0].elements['hotel_code'].value;
    
    return false;
}
</script>
<title>Insert title here</title>
</head>
<body>

<form  action="hinsert"  method="post" name="f" enctype="multipart/form-data">
  
  <div class="w3-display-container w3-container" >
  	<p style="font-size: 20px"><b>숙소 등록</b>
  </div>
  
  <input type="hidden" name="hotel_img" value="">
  
  <table style="width:60%" class="w3-display-container w3-container" align="center">

		<tr>
		
		<td rowspan="4" valign="bottom"><img src="" width="150" height="170" id="pic"><br> 
		<font size="1"><a href="javascript:win_upload()">호텔사진등록</a></font></td>
		
		<td >호텔코드</td>
		<td><input type="text" name="hotel_code" id="hotel_code"></td>
		</tr>
		
		<tr>
		<td>호텔이름</td>
		<td><input type="text" name="hotel_name" id="hotel_name"></td>
		</tr>
		
		<tr>
		<td>전화번호</td>
		<td><input type="text" name="hotel_tel" id="hotel_tel"></td>
		</tr>
		
		<tr>
		<td>주소</td>
		<td><input type="text" name="hotel_addr" id="hotel_addr"></td>
		</tr>
		
		<tr>
		<td>지역</td>
		<td colspan="2">

		<select name="area_code" id="area_code" style="width: 100%">              
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
		<td>외부옵션</td>
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
		<td>내부옵션</td>
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
		<textarea cols="50" rows="5" name="hotel_intro" id="hotel_intro"></textarea></td>
		</tr>
		
		
		

		<tr>
		<td colspan="3">
     	<a href="javascript:hinsert_submit()">
     	<input type="button" value="숙소등록" class="w3-button w3-black w3-margin-bottom" style="width: 100%"></a></td>
     	</tr>
	
</table>
</form>

</body>
</html>