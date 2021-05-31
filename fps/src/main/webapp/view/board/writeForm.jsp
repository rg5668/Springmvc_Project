<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">
<script>
	function board_submit() {
		var f = document.f;

		if (f.board_pass.value == "") {
			alert("비밀번호를 입력하세요")
			f.board_pass.focus();
			return;
		}

		if (f.subject.value == "") {
			alert("제목을 입력하세요")
			f.subject.focus();
			return;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요")
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
<style>
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 30%;
	margin-left: 130px;
	margin-top: 50px;
}

table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 50%;
	border-collapse: collapse;
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
					<c:if test="${board_code == 5}">자주묻는질문</c:if>
					
					남기기
				</div>
				<br> <br>

				<form action="write" method="post" enctype="multipart/form-data" name="f">
					<table cellpadding="10" class="w3-col s9"
						style="width: 100%; margin-right: 0%; align: right">
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">글쓴이</td>
							<td><input type="text" style="width: 100%"
								name="user_id" value = "${login}" readonly></td>
						</tr>
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">비밀번호</td>
							<td><input type="password" style="width: 100%"
								name="board_pass"></td>
						</tr>
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">제목</td>
							<td><input type="text" style="width: 100%" name="subject"></td>
						</tr>
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">내용</td>
							<td style="width: 100%"><textarea rows="10" cols="70"
									name="content"></textarea></td>
						</tr>
						<tr style="width: 100%">
							<td style="width: 35%; text-align: center">첨부파일</td>
							<td><input type="file" name="uploadfile"></td>
						</tr>
						<tr style="width: 100%">
							<td colspan="2"><a href="javascript:board_submit()"
								class="w3-button w3-black" style="width: 100%">게시물등록</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

</body>
</html>