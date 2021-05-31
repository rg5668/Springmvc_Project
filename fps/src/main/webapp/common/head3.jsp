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
		<!-- <a href="#rooms" class="w3-bar-item w3-button w3-mobile">Rooms</a> 방 리스트-->
		<!--   <a href="#about" class="w3-bar-item w3-button w3-mobile">소개</a> -->
		<!-- <a href="#contact" class="w3-bar-item w3-button w3-mobile">Contact</a> -->
		<div style="font-size: 12px;">
			<a href="<%=request.getContextPath() %>/reservation/reservationConfirmForm?user_id=${login}"
				class="w3-bar-item w3-button w3-right w3-mobile"
				style="line-height: 2.3;">예약내역</a>

			<ul>
				<li class="dropdown w3-bar-item w3-right w3-mobile w3-button"
					style="line-height: 0;"><a href="javascript:void(0)"
					class="dropbtn">더보기</a>
					<div class="dropdown-content">
						<a href="<%=request.getContextPath()%>/reservation/mypageForm?user_id=${login}">내정보</a>
						<a
							href="<%=request.getContextPath()%>/board/listForm?board_code=1">공지사항</a>
						<a
							href="<%=request.getContextPath()%>/board/listForm?board_code=2">이벤트</a>
						<a
							href="<%=request.getContextPath()%>/board/listForm?board_code=3">문의사항</a>
						<a href="<%=request.getContextPath()%>/board/freQuestionForm?board_code=5">자주
							묻는 질문</a>
						<!-- <a href="#">고객센터</a> -->
					</div></li>
			</ul>
			
			<c:if test="${login eq 'admin'}">
			<ul>
				<li class="dropdown w3-bar-item w3-right w3-mobile w3-button"
					style="line-height: 0;"><a href="javascript:void(0)"
					class="dropbtn">관리자전용</a>
					<div class="dropdown-content">
					
						<a href="<%=request.getContextPath()%>/admin/memListForm">회원관리</a>
						<a href="<%=request.getContextPath()%>/admin/hlistForm">숙소관리</a>
						<a href="<%=request.getContextPath()%>/admin/hinsertForm">숙소등록</a>
						<a href="<%=request.getContextPath()%>/board/listForm?board_code=1">공지사항 관리</a>
						<a href="<%=request.getContextPath()%>/board/listForm?board_code=2">이벤트 관리</a>
						
					</div></li>
			</ul>
			</c:if>
			
		<%-- <a href="<%=request.getContextPath() %>/view/fps/loginForm" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">로그인</a> --%>
		<%-- <a href="<%=request.getContextPath() %>/logout" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">로그아웃</a> --%>

		<c:if test="${empty login}"><a href="<%=request.getContextPath() %>/loginForm" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">로그인&nbsp;</a></c:if>
   		<c:if test="${not empty login}"><a href="<%=request.getContextPath() %>/member/logout" class="w3-bar-item w3-button w3-right w3-mobile" style="line-height: 2.3;">로그아웃&nbsp;</a></c:if> 
	</div>
</div>