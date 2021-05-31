<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- /WebContent/model1/board/deleteForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Q & A</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">
<style>
.chktable {
	border-collapse: collapse;
	border-style: none none none none;
}
td {
	border: 1px solid #bcbcbc;
}


.infotable{
	font-size: small;
	border-collapse: collapse;
	order: 1px solid #bcbcbc;
	}


.navpad {
	margin-left: 30px;
	margin-top: 20px;
}

.tabpad {
	width: 75%;
	margin-right: 0px;
	margin-top: 20px;
	float: right;
}

.faq-title {
	border: 2px solid black;
	border-style: none none solid none;
	font-size: 25px;
	font-weight: bold;
}
</style>
</head>
<body class="w3-light-grey">
	<div class="w3-row">
		<!-- Sidebar/menu -->
		<div class="navpad">
			<nav class="w3-col s3 w3-padding" style="width: 17%">
				<div class="w3-bar-block">
					<div class="w3-container">
						<h4 class="w3-padding-16">
							<b>고객센터</b>
						</h4>
					</div>
					<a href="<%=request.getContextPath()%>/board/listForm?board_code=1"
						class="w3-bar-item w3-button w3-white w3-hover-gray">공지사항</a> <a
						href="<%=request.getContextPath()%>/board/listForm?board_code=2"
						class="w3-bar-item w3-button w3-white w3-hover-gray">이벤트</a> <a
						href="<%=request.getContextPath()%>/board/freQuestionForm?board_code=5"
						class="w3-bar-item w3-button w3-white w3-hover-gray">자주묻는질문</a> <a
						href="<%=request.getContextPath()%>/board/listForm?board_code=3"
						class="w3-bar-item w3-button w3-white w3-hover-gray">문의사항</a>
				</div>
			</nav>
		</div>
		<div class="tabpad">
			<div class="w3-col s9 w3-section">
				<div class="faq-title" style="text-align: right">
					<c:if test="${board_code == 2}">이벤트</c:if>
					<c:if test="${board_code == 3}">문의사항</c:if>
					<c:if test="${board_code == 5}">자주묻는질문</c:if>
					
					삭제하기
				</div>
				<br> <br>
				<form action="delete" name="f" method="post">
					<input type="hidden" name="board_seq" value="${board_seq}">
					<table class="infotable" align="center" cellpadding="10" style="width: 70%; text-align: center";>
						<tr>
							<td height="35">제목</td>
							<td style="text-align: left">${board.subject}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<table style="width: 100%; height: 250px;">
									<tr>
										<td style="border-width: 0px; vertical-align: top; text-align: left;">
											${board.content}</td>
									</tr>
								</table>
							</td>
						</tr>
						</table><br>
						<table class="chktable" cellpadding="10"  align="center" style="font-size: 16px;
						font-weight:bold">
						<tr>
							<td style="border :hidden">게시글비밀번호</td>
							<td width="20" style="border :hidden"><input type="password" name="board_pass"></td>
							<td colspan="2" style="border :hidden"><input type="submit" value="게시글삭제"
								class="w3-button w3-black"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>