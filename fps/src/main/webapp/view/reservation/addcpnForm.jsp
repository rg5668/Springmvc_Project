<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="main">
	<div class="go_main">
	<a href="<%=request.getContextPath() %>/mainForm">
		<img src="/fps/w3images/logo.png" style="height: 70px; width : 70px; background-color: black; margin-top: 30px">
	</a>
	</div>
   <div class="service-form" align="center">

	<form action="addcpn" name="f" method="post">
	<table class="tab">
		<tr>
        	<td> <input type="text" name="cpn_number" placeholder="쿠폰번호">
        	</td></tr>
   	</table>
	<div align="center"></div>
 <button type="submit" name="login" class="w3-button w3-black" style="width: 20%; margin-top: 10px">쿠폰추가</button>
 </form>
</div>
 </div>
</body>
</html>