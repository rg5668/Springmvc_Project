<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Q & A</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">
<script>
	function myAccFunc() {
		var x = document.getElementById("demoAcc");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-grey";
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-grey", "");
		}
	}
	function myAccFunc2() {
		var x = document.getElementById("demoAcc2");
		if (x.className.indexOf("w3-hide") == -1) {
			x.className += "";
		} else {
			x.className = x.className.replace(" w3-hide", " w3-show");
		}
	}
</script>
<style>
#faq-title {
	font-size: 20px;
}

.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 30%;
	margin-left: 130px;
	margin-top: 50px;
}

.area1 {
	height: 500px;
	margin: 10px;
	padding: 20px;
	width: 70%;
	position: relative;
	border-radius: 5px;
	left: 25%;
}

table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 70%;
	border-collapse: collapse;
}
</style>
</head>
<body>
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
					href="<%=request.getContextPath()%>/view/fps/Qlist.jsp"
					class="w3-bar-item w3-button w3-white w3-hover-gray">문의사항</a>
			</div>
		</nav>


		<div class="w3-col s9 w3-section">
			<span id="faq-title"><a>Q & A</a></span>
			<div>
				<br>
			</div>

			<table style="width: 90%; margin-left: 5%">
				<c:if test="${boardcount == 0 }">
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${boardcount != 0 }">
					<tr>
						<th width="8%">번호</th>
						<th width="50%">제목</th>
						<th width="14%">작성자</th>
						<th width="17%">등록일</th>
						<th width="11%">조회수</th>
					</tr>

					<c:choose>
						<c:when test="${empty list}">
							<c:forEach var="i" begin="1" end="10" step="1">
								<tr rowspan="5"></tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="b" items="${list}">
								<tr>
									<td>${board_seq}</td>
									<td style="text-align: left"><c:set var="boardseq"
											value="${board_seq-1 }" /> <c:if
											test="${b.file1 != null && !b.file1.trim() eq ''}">
											<a href="upfile/${b.file1}" style="text-decoration: none;">@</a>
										</c:if> <c:if test="${b.file1 == null || b.file1.trim() eq ''}">
     &nbsp;&nbsp;&nbsp; </c:if> <c:if test="${b.reflevel > 0}">
											<c:forEach var="i" begin="1" end="${b.reflevel-1 }">
		  
	              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      
	      </c:forEach>	       
	  └</c:if> <a href="Qinfo?num=${b.board_seq}">${b.subject}</a></td>
									<td>${b.name}</td>
									<td>${b.regdate}</td>
									<td>${b.readcnt}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

					<tr align="center">
						<td colspan="5"><c:if test="${startpage <= bottomLine}">[이전] </c:if>
							<c:if test="${startpage > bottomLine}">
								<a href="Qlist?pageNum=${startpage - bottomLine}">[이전]</a>
							</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">

								<c:if test="${a==pageNum }">[${a}] </c:if>
								<c:if test="${a!=pageNum }">

									<a href="Qlist?pageNum=${a}">[${a}]</a>
								</c:if>
							</c:forEach> <c:if test="${endpage >= maxpage}">  [다음]</c:if> <c:if
								test="${endpage < maxpage}">
								<a href="Qlist?pageNum=${startpage + bottomLine}">[다음]</a>
							</c:if></td>
					</tr>


				</c:if>


				<tr>
					<td colspan="5" style="text-align: right"><a
						href="<%=request.getContextPath()%>/view/fps/QwriteForm.jsp">[글쓰기]</a></td>
				</tr>

			</table>
		</div>
	</div>

</body>
</html>





