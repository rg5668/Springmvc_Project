<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>결제완료</title>
</head>
<body>
<div style="position: relative; margin-bottom: 10%; margin-top: 10%" align="center">
<h3>결제에 성공하였습니다</h3>
<h3>예약번호는 ${res.res_seq } 입니다.</h3><!-- {res_seq} -->

<input type="button" class="w3-button w3-black" value="메인화면으로" onclick="location='<%=request.getContextPath() %>/mainForm'">
<c:if test="${not empty login }">
<input type="button" class="w3-button w3-black" value="구매내역으로" onclick="location='<%=request.getContextPath() %>/reservation/reservationConfirmForm'">
</c:if>
</div>
</body>
</html>