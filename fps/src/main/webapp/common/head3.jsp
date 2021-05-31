<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>FPS main</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">

<body class="w3-light-grey">

	<!-- Navigation Bar -->
	<div class="w3-bar w3-black w3-large">
		<a href="<%=request.getContextPath()%>/mainForm"
			class="w3-bar-item w3-button w3-black w3-mobile"><img
			src="/fps/w3images/logo.png" style="height: 50px; width: 50px;"></a>
		<!-- <a href="#rooms" class="w3-bar-item w3-button w3-mobile">Rooms</a> �� ����Ʈ-->
		<!--   <a href="#about" class="w3-bar-item w3-button w3-mobile">�Ұ�</a> -->
		<!-- <a href="#contact" class="w3-bar-item w3-button w3-mobile">Contact</a> -->
		<div style="font-size: 12px;">
			<a href="<%=request.getContextPath() %>/reservation/reservationConfirmForm?user_id=${login}"
				class="w3-bar-item w3-button w3-right w3-mobile"
				style="line-height: 2.3;">���೻��</a>

			<ul>
				<li class="dropdown w3-bar-item w3-right w3-mobile w3-button"
					style="line-height: 0;"><a href="javascript:void(0)"
					class="dropbtn">������</a>
					<div class="dropdown-content">
						<a href="<%=request.getContextPath()%>/reservation/mypageForm?user_id=${login}">������</a>
						<a
							href="<%=request.getContextPath()%>/board/listForm?board_code=1">��������</a>
						<a
							href="<%=request.getContextPath()%>/board/listForm?board_code=2">�̺�Ʈ</a>
						<a
							href="<%=request.getContextPath()%>/board/listForm?board_code=3">���ǻ���</a>
						<a href="<%=request.getContextPath()%>/board/freQuestionForm?board_code=5">����
							���� ����</a>
						<!-- <a href="#">������</a> -->
					</div></li>
			</ul>
			
			<c:if test="${login eq 'admin'}">
			<ul>
				<li class="dropdown w3-bar-item w3-right w3-mobile w3-button"
					style="line-height: 0;"><a href="javascript:void(0)"
					class="dropbtn">����������</a>
					<div class="dropdown-content">
					
						<a href="<%=request.getContextPath()%>/admin/memListForm">ȸ������</a>
						<a href="<%=request.getContextPath()%>/admin/hlistForm">���Ұ���</a>
						<a href="<%=request.getContextPath()%>/admin/hinsertForm">���ҵ��</a>
						<a href="<%=request.getContextPath()%>/board/listForm?board_code=1">�������� ����</a>
						<a href="<%=request.getContextPath()%>/board/listForm?board_code=2">�̺�Ʈ ����</a>
						
					</div></li>
			</ul>
			</c:if>
			
		<%-- <a href="<%=request.getContextPath() %>/view/fps/loginForm" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">�α���</a> --%>
		<%-- <a href="<%=request.getContextPath() %>/logout" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">�α׾ƿ�</a> --%>

		<c:if test="${empty login}"><a href="<%=request.getContextPath() %>/loginForm" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">�α���&nbsp;</a></c:if>
   		<c:if test="${not empty login}"><a href="<%=request.getContextPath() %>/member/logout" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">�α׾ƿ�&nbsp;</a></c:if> 
	</div>
</div>