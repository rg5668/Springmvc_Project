<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
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


<script type="text/javascript">
function check() {
	if(document.search.keyWord.value ==""){
		alert("검색어를 입력하세요");
		document.search.keyWord.focus();
		return;
	}
	document.search.submit();
}

</script>
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
				<div class="faq-title" style="text-align: right">${boardname}</div>
				<br> <br>
				<table class="w3-col s9" style="width: 100%; margin-left: 5%">
					<c:if test="${boardcount == 0 }">
						<tr>
							<td colspan="5">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${boardcount != 0 }">
						<tr>
							<c:if test="${board_code == 1 || board_code == 2}"></c:if>
							<c:if test="${board_code != 1 && board_code != 2}">
								<th width="10%" style="text-align: center">답변</th>
							</c:if>
							<th width="48%" style="text-align: center">제목</th>
							<th width="14%">작성자</th>
							<th width="17%">등록일</th>
							<th width="11%">조회수</th>
						</tr>
						<c:forEach var="b" items="${list}">
							<tr>
								<c:if test="${board_code != 3}">
								</c:if>
								<c:if test="${board_code == 3}">
									<td><c:if test="${b.user_id!='admin'}">
											<c:if test="${b.reply_chk == 1}">답변완료
									</c:if>
											<c:if test="${b.reply_chk == 0}">답변대기
									</c:if>
										</c:if> <c:if test="${b.user_id =='admin'}">&nbsp</c:if></td>
								</c:if>

								<td style="text-align: left">
								<c:set var="board_seq" value="${b.board_seq-1}" /> 
								<c:if test="${b.file1 != null && !b.file1.trim() eq ''}">
								 <a href="upfile/${b.file1}" style="text-decoration: none;">@</a></c:if> 
								<c:if test="${b.file1 == null || b.file1.trim() eq ''}">
									&nbsp;&nbsp;&nbsp;</c:if> 
								<c:if test="${b.reflevel > 0}">
									<c:forEach var="i" begin="1" end="${b.reflevel-1 }">
						              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     	    </c:forEach>	       
	  							└</c:if>
	  							<c:if test="${b.board_code==3}">
								<a href="boardCheck?board_seq=${b.board_seq}&board_code=${b.board_code}">${b.subject}</a>								</c:if>
								<c:if test="${b.board_code !=3}">
								<a href="info?board_seq=${b.board_seq}&board_code=${b.board_code}">${b.subject} </a>
								</c:if>	
								</td>

								<td>${b.user_id}</td>

								<td><c:if test="${b.today}">
										<fmt:formatDate type="time" value="${b.regdate}" />
									</c:if> <c:if test="${!b.today}">
										<fmt:formatDate type="date" value="${b.regdate}" />
									</c:if></td>

								<td>${b.readcnt}</td>
							</tr>
						</c:forEach>

						<tr>
							<td colspan="5" style="text-align: center"><c:if
									test="${startpage <= bottomLine}">[이전] </c:if> <c:if
									test="${startpage > bottomLine}">
									<a href="listForm?page=${startpage - bottomLine}">[이전]</a>
								</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">

									<c:if test="${a==pageNum }">[${a}] </c:if>
									<c:if test="${a!=pageNum }">

										<a href="listForm?page=${a}">[${a}]</a>
									</c:if>
								</c:forEach> <c:if test="${endpage >= maxpage}">  [다음]</c:if> <c:if
									test="${endpage < maxpage}">
									<a href="listForm?page=${startpage + bottomLine}">[다음]</a>
								</c:if></td>
						</tr>


					</c:if>


					<tr>
					<td colspan="4" style="text-align: left">
				<form action="searchListForm" name="search" method="post">
				<a style="font-size: 12px"> 
				<select name="keyField" size="1" style="height: 31px">
					<option value="subject" <c:if test="${'subject'==keyField}"> selected </c:if>>제목</option>
					<option value="content" <c:if test="${'content'==keyField}"> selected </c:if>>내용</option>
				</select>
				<input type="text" size="30px" placeholder="내용을 입력하세요."
					style="height: 31px; width: 40%;" name="keyWord" value="${keyWord}"> 
				<input type="submit" class="w3-button w3-black"
					style="margin-bottom: 1.5px; height: 31px" value="검색" onclick="check()">
				<input type="hidden" name="page" value="0">	
				</a>
				
				</form></td>
						<c:if test="${not empty login}">
							<c:if test="${login == 'admin'}">
								<td style="text-align: right">
									<button onclick="location='writeForm?board_code=${board_code}'"
										class="w3-button w3-black">글쓰기</button>
								</td>
							</c:if>
							<c:if test="${login != 'admin'}">
								<c:if test="${board_code == 3}">
									<td style="text-align: right">
										<button
											onclick="location='writeForm?board_code=${board_code}'"
											class="w3-button w3-black">글쓰기</button>
									</td>
								</c:if>
								<c:if test="${board_code != 3}">
									<td></td>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${empty login}"></c:if>
					</tr>

				</table>

			</div>
		</div>
	</div>
</body>
</html>