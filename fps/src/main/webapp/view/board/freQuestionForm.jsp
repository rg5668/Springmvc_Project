<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>고객 센터</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/fps.css">

<style>
.answer {
	display: none;
	padding-bottom: 30px;
}

.faq-content {
	border-bottom: 1px solid #e0e0e0;
}

.question {
	font-size: 19px;
	padding: 30px 0;
	cursor: pointer;
	border: none;
	outline: none;
	background: none;
	width: 100%;
	text-align: left;
}

.question:hover {
	color: #2962ff;
}

[id$="-toggle"] {
	margin-right: 15px;
}
table {
	border-collapse: collapse;
	width: 100%;
}
th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 30%;
	margin-left: 130px;
	margin-top: 50px;
}
.navpad{margin-left:30px;
		margin-top: 20px;}
		
.tabpad{width: 75%;
		margin-right:0px;
		margin-top: 20px;
		float: right;
		font-size: 12px;
		
		}

.faq-title{
border: 2px solid black;
border-style: none none solid none;
font-size: 25px;
font-weight: bold;
}

h3{
font-weight: bold;
}

ul li {
	list-style-type: none;
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
		</nav></div>
<div class="tabpad">
		<div class="w3-col s8 w3-section">
			<div class = "faq-title" style="text-align: right">
			<h3>자주묻는질문(FAQ)</h3></div>
			<br><br>
			<div class="w3-container" style="width: 100%;">
				<div class="w3-bar w3-black ">
					<button class="w3-bar-item w3-button" style="margin-left: 20px"
						onclick="openCity('Demo1')">Best Help Question & Answer</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo2')">예약문의</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo3')">이용문의</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo4')">결제문의</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo5')">모바일티켓</button>
					<button class="w3-bar-item w3-button" onclick="openCity('Demo6')">회원정보</button>
				</div>

				<div id="Demo1" class="w3-container cate">
					<div class="faq-content">
						<button class="question" id="que-1">
							<span id="que-1-toggle">+</span><span>예약을 취소하고 싶어요.</span>
						</button>
						<div class="answer" id="ans-1">
							예약취소는 앱 하단 내정보 > 예약/구매내역에서 직접 가능합니다.<br> 예약/결제 진행 당시 안내된
							취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 취소수수료를 차감한 금액으로 환불 처리됩니다.<br>
							일부 숙소에 한해 취소가 가능한 시점이나 앱에서 취소가 불가할 수 있으니 이 경우에는 고객센터로 요청해 주시길
							바랍니다.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-2">
							<span id="que-2-toggle">+</span><span>정확한 내 위치 확인이 안돼요.</span>
						</button>
						<div class="answer" id="ans-2">
							FPS는 위치기반 서비스로 정확한 위치가 인식되어야 정상적인 이용이 가능합니다. <br> 단말기의 GPS를
							통한 내 위치 설정 시, 단말기 상태에 따라 위치 인식에 예외사항이 발생할 수 있으니,<br> GPS
							재설정을 통해 정확하게 확인해 주시기 바랍니다.<br> 만약 같은 불편을 계속 겪으실 경우, 단말기의
							소프트웨어 업데이트 또는 데이터 환경 확인 및 앱을 완전히 삭제 후 재설치 부탁드립니다.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-13">
							<span id="que-13-toggle">+</span><span>회원정보 수정은 어떻게 하나요?</span>
						</button>
						<div class="answer" id="ans-13">
							앱 하단 내정보 > 내 정보 관리에서 회원정보를 수정할 수 있습니다. <br> 닉네임 변경 시, 이미
							사용중인 닉네임으로는 변경이 어려우며, 최근 30일 동안 1회만 변경 가능합니다.<br> * 회원정보 :
							닉네임, 예약자명, 휴대폰 번호, 비밀번호(이메일 로그인 시에만 변경 가능)
						</div>
					</div>
				</div>

				<div id="Demo2" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-3">
							<span id="que-3-toggle">+</span><span>예약을 취소하고 싶어요.</span>
						</button>
						<div class="answer" id="ans-3">
							예약취소는 앱 하단 내정보 > 예약/구매내역에서 직접 가능합니다.<br> 예약/결제 진행 당시 안내된
							취소/환불 규정에 따라 처리되며, 취소수수료가 발생할 경우 취소수수료를 차감한 금액으로 환불 처리됩니다.<br>
							일부 숙소에 한해 취소가 가능한 시점이나 앱에서 취소가 불가할 수 있으니 이 경우에는 고객센터로 요청해 주시길
							바랍니다.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-4">
							<span id="que-4-toggle">+</span><span>예약대기 건 예약취소하고 싶어요.</span>
						</button>
						<div class="answer" id="ans-4">
							예약 대기중에는 FPS 고객센터에 예약취소 요청해주시길 바랍니다.<br> 단, 예약확정이 될 경우 수수료가
							발생하거나 예약취소가 불가할 수 있습니다.
						</div>
					</div>
				</div>


				<div id="Demo3" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-5">
							<span id="que-5-toggle">+</span><span>정확한 내 위치 확인이 안돼요.</span>
						</button>
						<div class="answer" id="ans-5">
							FPS는 위치기반 서비스로 정확한 위치가 인식되어야 정상적인 이용이 가능합니다. <br> 단말기의 GPS를
							통한 내 위치 설정 시, 단말기 상태에 따라 위치 인식에 예외사항이 발생할 수 있으니,<br> GPS
							재설정을 통해 정확하게 확인해 주시기 바랍니다.<br> 만약 같은 불편을 계속 겪으실 경우, 단말기의
							소프트웨어 업데이트 또는 데이터 환경 확인 및 앱을 완전히 삭제 후 재설치 부탁드립니다.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-6">
							<span id="que-6-toggle">+</span><span>운영중인 숙소를 등록하고 싶어요.</span>
						</button>
						<div class="answer" id="ans-6">
							FPS 입점 광고를 원하실 경우 고객행복센터로 문의해 주시면 친절하게 안내드리겠습니다.<br> ※ 전화문의
							: 02-538-3644 (상담시간 : 오전 9시~익일 3시/점심시간 12시~13시 제외)
						</div>
					</div>
				</div>

				<div id="Demo4" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-7">
							<span id="que-7-toggle">+</span><span>사용가능한 카드 종류가 없어요.</span>
						</button>
						<div class="answer" id="ans-7">
							FPS 예약 서비스 결제 시 사용 가능한 카드 종류는 PG사(전자결제 대행사)에서 정하는 부분이므로<br>
							일부 카드는 결제지원이 불가할 수 있습니다. IBK기업은행 카드의 경우 목록에서 비씨를 선택하시면 결제 가능하오니
							이용에 참고 부탁드립니다.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-8">
							<span id="que-8-toggle">+</span><span>영수증(거래내역서) 발급받고 싶어요.</span>
						</button>
						<div class="answer" id="ans-8">
							예약정보와 결제정보가 기재되어 있는 영수증(거래내역서)은 FPS 고객센터로 문의하시면 발급이 가능합니다.<br>
							예약내역, 영수증을 받으실 이메일 주소(또는 FAX번호)를 1:1문의 또는 카카오 상담톡으로 남겨주시길 바라며,<br>
							발급 완료까지는 영업일 기준 최대 1~2일 소요되오니 시간 양해 부탁드립니다.
						</div>
					</div>
				</div>

				<div id="Demo5" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-9">
							<span id="que-9-toggle">+</span><span>티켓을 취소하고 싶어요.</span>
						</button>
						<div class="answer" id="ans-9">
							미사용 티켓은 앱에서 직접 취소 가능합니다. <br> 단, 날짜가 정해진 상품은 당일 취소가 불가하며 상품에
							따라 취소 수수료가 발생할 수 있으니 <br> 구매 전 취소/환불 규정을 확인해주시길 바랍니다.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-10">
							<span id="que-10-toggle">+</span><span>유효기간이 지났지만 티켓을 사용하지
								못했어요.</span>
						</button>
						<div class="answer" id="ans-10">
							상품에 따라 취소수수료 차감 후 환불 또는 100% 결제금 기준으로 환불됩니다.<br> 유효기간 연장이
							가능한 상품의 경우 유효기간 만료 후 90% 환불됩니다.<br> 상품 상세정보 내 취소/환불 규정을
							확인해주시길 바라며, 환불은 유효기간 종료 후 2~3 영업일 안으로 자동 지급되오니 참고 부탁드립니다.
						</div>
					</div>
				</div>

				<div id="Demo6" class="w3-container cate" style="display: none">
					<div class="faq-content">
						<button class="question" id="que-11">
							<span id="que-11-toggle">+</span><span>개인이 여러 개의 아이디를 만들 수
								있나요?</span>
						</button>
						<div class="answer" id="ans-11">
							FPS는 한 명이 여러 개의 아이디를 만드는 것을 허용합니다.<br> 단, 개별 아이디에 적립된 포인트나
							쿠폰, 구매내역 등은 통합 또는 양도가 불가하며, 각각의 아이디에서만 확인 가능합니다.
						</div>
					</div>
					<div class="faq-content">
						<button class="question" id="que-12">
							<span id="que-12-toggle">+</span><span>회원정보 수정은 어떻게 하나요?</span>
						</button>
						<div class="answer" id="ans-12">
							앱 하단 내정보 > 내 정보 관리에서 회원정보를 수정할 수 있습니다. <br> 닉네임 변경 시, 이미
							사용중인 닉네임으로는 변경이 어려우며, 최근 30일 동안 1회만 변경 가능합니다.<br> * 회원정보 :
							닉네임, 예약자명, 휴대폰 번호, 비밀번호(이메일 로그인 시에만 변경 가능)
						</div>
					</div>
				</div>
			</div>

	</div>	
		</div>
	</div>		
</div>

	<script>

	function openCity(cityName) {
		var i;
		var x = document.getElementsByClassName("cate");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(cityName).style.display = "block";
	}
	
  const items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    const answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
  
  </script>
</body>
</html>