<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- /WebContent/chap08_member/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ Ȯ��</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main2.css">
</head>
<body>
	<form name="f" action="memdelete" method="post">
		<input type="hidden" name="user_id" value="${user_id}">
		<table>
			<caption>ȸ�� ���� ��й�ȣ �Է�</caption>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Ż���ϱ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>
