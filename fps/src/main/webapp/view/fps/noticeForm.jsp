<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<title>Notice</title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">


<body class="w3-light-grey">

	<div class="w3-row">
		<!-- Sidebar/menu -->
		<nav class="w3-col s3 w3-padding" style="width: 20%">
			<div class="w3-bar-block">
				<div class="w3-container">
					<h3 class="w3-padding-16">
						<b>고객센터</b>
					</h3>
				</div>
				<a href="<%=request.getContextPath()%>/view/fps/noticeForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">공지사항</a> <a
					href="<%=request.getContextPath()%>/view/fps/eventForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">이벤트</a> <a
					href="<%=request.getContextPath()%>/view/fps/freQuestion.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">자주묻는질문</a> <a
					href="<%=request.getContextPath()%>/view/fps/QwriteForm.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">문의사항</a>
			</div>
		</nav>

		<div class="w3-col s9 w3-section">
			<span id="faq-title" style="font-size: 20px;">공지사항</span>
			<div>
				<br>
			</div>

			<!-- 글번호 number, 글제목 subject, 글내용 content, 파일 file1, 작성일 regdate, 조회수 readcnt  -->
			<table class="w3-col s9 w3-table-all w3-section" style="width: 90%; margin-left: 5%">
				<!-- <caption class="w3-section w3-wide" style="font: 20px bold;">공지사항</caption> -->
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<!-- <th>글내용</th> -->
					<th>첨부파일</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>

				<tr>
					<td>1</td>
					<td>공지사항1</td>
					<td>파일</td>
					<td>2020.04.29</td>
					<td>0</td>
				</tr>

				<tr>
					<td>0</td>
					<td>공지사항입니다.</td>
					<td>파일</td>
					<td>2021.04.28</td>
					<td>1</td>
				</tr>
			</table>
		</div>

	</div>

</body>
</html>
