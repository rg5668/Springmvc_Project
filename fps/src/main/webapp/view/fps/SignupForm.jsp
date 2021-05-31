<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import = "java.io.InputStream"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="EUC-KR"><title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/signup.css">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
* {font-family: 'Noto Sans KR', sans-serif; }
</style>


<script src="/maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="/code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	<!-- jQuery ui -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	<!-- 다음 우편번호 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script> <!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function Signupform_submit()
{
   var f=document.f;
   
    if(f.user_id.value===""||f.user_id.value==null)
   {
      alert("아이디를 입력하세요.");
      f.id.focus();
      return;
   }
    if(f.password.value===""||f.password.value==null)
   {
      alert("비밀번호를 입력하세요.");
      f.password.focus();
      return;
   }
   if(f.password.value != f.passcheck.value ){
       alert("비밀번호가 일치하지 않습니다.");
       f.passcheck.focus();
       return false;
   }
   if(f.name.value===""||f.name.value==null)
   {
      alert("이름을 입력하세요.");
      f.name.focus();
      return;
   }
   if(f.tel.value===""||f.tel.value==null)
   {
      alert("연락처를 입력하세요");
      f.tel.focus();
      return;
   }
   if(f.email.value===""||f.email.value==null)
   {
      alert("이메일을 입력하세요");
      f.email.focus();
      return;
   }
   if(f.birthyy.value=="00"||f.birthyy==null)
   {
      alert("생년월일을 설정해주세요.");
      f.birthyy.focus();
      return;
   }
   if(f.birthmm.value=="00"||f.birthmm==null)
   {
      alert("생년월일을 설정해주세요.");
      f.birthmm.focus();
      return;
   }
   if(f.birthdd.value=="00"||f.birthdd==null)
   {
      alert("생년월일을 설정해주세요.");
      f.birthdd.focus();
      return;
   }
   if(f.post.value===""||f.post.value==null)
   {
      alert("주소를 입력하세요.");
      f.post.focus();
      return;
   }
   if(f.addr1.value===""||f.addr1.value==null)
   {
      alert("주소를 입력하세요.");
      f.post.focus();
      return;
   }
   if(f.addr2.value===""||f.addr2.value==null)
   {
      alert("상세주소를 입력하세요.");
      f.addr2.focus();
      return;
   }
   
   f.submit();
} 



function daum_post() {
	new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr1').value = fullRoadAddr;
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
	
	function javascript(){
		 
	    //setAttribute로 innerHTML시에 값유지
	    document.getElementById("user_id").setAttribute("value",document.getElementById("user_id").value);
	    document.getElementById("divId").innerHTML += "<input type='text' name='' id=''/>";
	 
	}
}
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="w3-content">

<a href="<%=request.getContextPath() %>/mainForm">
		<img src="/fps/w3images/logo.png" style="height: 70px; width : 70px; background-color: black; margin-top: 30px">
	</a>

<!-- !PAGE CONTENT! -->

  <!-- Push down content on small screens -->
 
  
  <!-- Top header -->
  

	<form action="<%=request.getContextPath() %>/member/join" name="f" method="post" class="main_form">
      	<table style="width:40%" >
          <tbody>
            <tr>
              <th>아이디</th>
              <td><input type="text" id="user_id" name="user_id" value="${user_id }" placeholder="아이디를 입력해주세요.">
              	<input type="submit" name="id_check" value="중복확인" style="width:80px;" class="btn2" onclick='javascript()' formaction="<%=request.getContextPath()%>/member/idcheck"></td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td><input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요." style="width:80%"></td>
            </tr>
              <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" id="passcheck" name="passcheck" placeholder="비밀번호를 입력해주세요." style="width:80%"></td>
              </tr>
              <tr>
              <th>이름</th>
              <td><input type="text" id="name" name="name"  placeholder="이름을 입력해주세요." style="width:80%"></td>
            </tr>
              <tr>
                <th>전화번호</th>
                <td>
                <input type="tel" id="tel" name="tel" placeholder="연락처를 입력해주세요."  style="width:80%"></td>
              </tr>
              <tr>
                <th>이메일</th>
                <td>
                <input type="email" id="email" name="email" placeholder="이메일을 입력해주세요."  style="width:80%"></td>
              </tr>
              <tr>
            <th>생년월일</th>
              <td>
                <select  name="birthyy" class="yy_sel" aria-label=""  style="width:26%" required>
                <option value="00">----년</option>
                <c:forEach var="i" begin="1" end="30">
                <option><c:out value="${2022-i}년" /></option>
                </c:forEach>
                </select>
                <select  name="birthmm" class="mm_sel" aria-label=""  style="width:25%">
                  <option value="00">--월</option>
             <c:forEach var="i" begin="1" end="12">
                <option><c:out value="${i}월" /></option>
                </c:forEach>
                </select> 
                <select  name="birthdd" class="dd_sel" aria-label="--일"  style="width:25%">
                  <option value="00">--일</option>
                  <c:forEach var="i" begin="1" end="31">
                <option><c:out value="${i}일" /></option>
                </c:forEach>
              </select><br/></td></tr>
            <tr>
              <th>주소</th>
              <td>
              <a class='btn-fill-d' onclick="daum_post()">
						<input type="text" id="post" name="post" placeholder="우편번호"  readonly /></a><br>
					<input type="text" id="addr1" name="addr1" placeholder="주소를 입력해주세요."  style="width:80%" readonly><br>
                  	<input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력해주세요." style="width:80%">
             </td>
            </tr>
          </tbody> 
        </table>
                <div class="w3-button w3-black" style="width: 37%; margin-top: 10px; margin-left: 30px">
                	<a class="btn-fill" onclick="Signupform_submit()">회원가입</a>
                </div>
</form></body>
</html>