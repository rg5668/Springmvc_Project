<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">
<style>

td {
	border: 1px solid #bcbcbc;
	font-size: 16px;
}
table {
	border-collapse: collapse;
	order: 1px solid #bcbcbc;
	font-size: 16px;
}
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 30%;
	margin-left: 130px;
	margin-top: 50px;
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
			<c:if test="${board_code == 1}">공지사항</c:if>
			<c:if test="${board_code == 2}">이벤트</c:if>
			<c:if test="${board_code == 3}">문의사항</c:if>
			<c:if test="${board_code == 5}">자주묻는질문</c:if></div>
			
				<br>
				<br>
				<table cellpadding="10" style="width: 100%; text-align: center;">
					<tr>
						<td height="35" width="20%">글쓴이</td>
						<td width="80%" style="text-align: left">${board.user_id}</td>
					</tr>
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
					<tr>
						<td>첨부파일</td>
						<td style="text-align: left;">
						<c:if test="${board.file1 == null || board.file1.trim() eq ''}">
						&nbsp;</c:if> 
						<c:if test="${ board.file1 != null && board.file1.trim() ne ''}">
						<a href="<%=request.getContextPath()%>/upfile/${board.file1}">${board.file1}</a></c:if></td>
					</tr>
					<tr>
					<c:if test="${login != board.user_id}">
					</c:if>
					<c:if test="${login == board.user_id}">
				   <td colspan="2" style="text-align: center">
							<button onclick="location='replyForm?board_seq=${board_seq}&board_code=${board_code}'"
								class="w3-button w3-black">답변</button>
							<button onclick="location='updateForm?board_seq=${board_seq}&board_code=${board_code}'"
								class="w3-button w3-black">수정</button>
							<button onclick="location='deleteForm?board_seq=${board_seq}&board_code=${board_code}'"
								class="w3-button w3-black">삭제</button>
							<button onclick="location='listForm?board_code=${board_code}'" class="w3-button w3-black">목록</button>
					</c:if></tr>

				</table>
			</div>
		</div>
	</div>
</body>
</html>