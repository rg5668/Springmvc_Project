<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����Ϸ�</title>
</head>
<body>
<div style="position: relative; margin-bottom: 10%; margin-top: 10%" align="center">
<h3>������ �����Ͽ����ϴ�</h3>
<h3>�����ȣ�� ${res.res_seq } �Դϴ�.</h3><!-- {res_seq} -->

<input type="button" class="w3-button w3-black" value="����ȭ������" onclick="location='<%=request.getContextPath() %>/mainForm'">
<c:if test="${not empty login }">
<input type="button" class="w3-button w3-black" value="���ų�������" onclick="location='<%=request.getContextPath() %>/reservation/reservationConfirmForm'">
</c:if>
</div>
</body>
</html>