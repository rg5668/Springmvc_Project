<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/tab.css">
<meta charset="EUC-KR">
<title>호텔정보</title>

</head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');	
		})
		$( "#datepicker" ).datepicker({ minDate: 0});
			$( "#datepicker1" ).datepicker({ minDate:0});
			
		$('#btn2').click(function(){//체크인 체크아웃 널체크 함수
			 if($( "#datepicker" ).datepicker( "getDate" )==''||$( "#datepicker" ).datepicker( "getDate" )==null)
			 {
				 alert("체크인 날짜가 없습니다!")
		          return false;
		      }
			 else if($( "#datepicker1" ).datepicker( "getDate" )==''||$( "#datepicker1" ).datepicker( "getDate" )==null)
			{
				 alert("체크아웃 날짜가 없습니다!")
		          return false;
		      }
			  return true;
			});
	})
	
$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
       
    });

	function chancal()
	{
		datemin=$("#datepicker").datepicker("getDate");
		datemax=$("#datepicker").datepicker("getDate");
	datemin.setDate(datemin.getDate()+1);
	datemax.setDate(datemax.getDate()+8);
	$('#datepicker1').datepicker('option', {
		minDate:datemin,
		maxDate:datemax
	  })

	}
	
	function sendRoom(room_code)
	{
		 if($( "#datepicker" ).datepicker( "getDate" )==''||$( "#datepicker" ).datepicker( "getDate" )==null)//체크인 체크아웃 널체크함수2
		 {
			 alert("체크인 날짜가 없습니다!")
	          return false;
	      }
		 else if($( "#datepicker1" ).datepicker( "getDate" )==''||$( "#datepicker1" ).datepicker( "getDate" )==null)
		{
			 alert("체크아웃 날짜가 없습니다!")
	          return false;
	      }
		 else if('${gd.sdate}'==null||'${gd.sdate}'=='')
		{
			 alert("검색버튼을 눌러주세요")
			 return false;
		 }
		 else if('${gd.edate}'==null||'${gd.edate}'=='')
			{
				 alert("검색버튼을 눌러주세요")
				 return false;
			 }
		
		var form = document.createElement('form'); // 폼객체 생성
	    var parm = new Array();
	    var input = new Array();
	    parm.push( ['room_code', room_code] );
	    parm.push( ['guest',${gd.guest}] );
	    parm.push( ['sdate','${gd.sdate}']  );
	    parm.push( ['edate', '${gd.edate}'] );


	    for (var i = 0; i < parm.length; i++) {
	        input[i] = document.createElement("input");
	        input[i].setAttribute("type", "hidden");
	        input[i].setAttribute('name', parm[i][0]);
	        input[i].setAttribute("value", parm[i][1]);
	        form.appendChild(input[i]);
	    }
		
		form.setAttribute('method', 'post'); //get,post 가능
		form.setAttribute('action', "<%=request.getContextPath()%>/hotel/paymentForm"); //보내는 url
		document.body.appendChild(form);
		form.submit();
	}
</script>
<body>

	<div class="w3-container w3-margin-left w3-margin-top">
		<p style="font-size: 20px">
			<b>숙소상세 보기</b>
		</p>
	</div>

	<div class="w3-middle w3-margin-top" align="center">
		<table>
			<tr>
				<td rowspan="3"><img style="width: 300px"
					src="<%=request.getContextPath()%>/${hotelgrade.hotel_img}"
					height="200px"></td>
				<td><h4>숙소명 : ${hotelgrade.hotel_name}</h4></td>
			</tr>
			<tr>
				<td>평점 : ☆${hotelgrade.hotel_grade}</td>
			</tr>
			<tr>
				<td>주소 : ${hotelgrade.hotel_addr}</td>
			</tr>

			<tr>
				<td colspan="3" style="border-bottom: 1px solid black;"></td>
			</tr>
		</table>

		<div style="margin-top: 20px">

			<form id="product_filter_form"
				action="<%=request.getContextPath()%>/hotel/hotelSubForm"
				method="post">
					<input type="hidden" value="${hotelgrade.hotel_code }" name="hotel_code">
				<i class="fa fa-male"></i> 인원 <input class="w3-border"
					style="width: 10%" type="number" value="${gd.guest }" name="guest"
					min="1" max="10"> <i class="fa fa-calendar-o"></i> 체크인 <input
					class="w3-border" style="width: 12%" type="date"
					value="${gd.sdate }" name="sdate" id="datepicker"
					onchange="chancal()" readonly> <i class="fa fa-calendar-o"></i>
				체크아웃 <input class="w3-border" style="width: 12%" type="date"
					value="${gd.edate }" name="edate" id="datepicker1" readonly>
				<b><input type="submit" id="btn2" class="w3-button w3-black"
					style="width: 100px; height: 30px; font-size: 12px; margin-bottom: 5px"
					value="검색"></b>
			</form>
			<br>
			<ul class="tabs w3-middle w3-center" style="margin-bottom: 20px;">
				<li class="tab-link current" data-tab="tab-1"
					style="margin-left: 25%;">객실 안내/예약</li>
				<li class="tab-link" data-tab="tab-2">숙소정보</li>
				<li class="tab-link" data-tab="tab-3">리뷰</li>
				<li class="tab-link" data-tab="tab-4">1대1 문의</li>
			</ul>
			<br /> <br />
			<div id="tab-1" class="tab-content current">
				<table
					style="margin-bottom: 20px; width: 50%; text-align: center; table-layout: fixed; border-collapse: separate; border-spacing: 0 10px;">
					<c:forEach var="h" items="${hotelres}">
						<tr>
							<td rowspan="3"><img width="100%"
								src="<%=request.getContextPath()%>/hotel/soldout.jpg"></td>
							<td>${h.room_name}</td>
						</tr>
						<tr>
							<td>최대인원수 : ${h.guest }인</td>
						</tr>
						<tr>
							<td>${h.price }원*${diffDays }일=${h.price*diffDays}원</td>
						</tr>
					</c:forEach>

					<c:forEach var="h" items="${hotelsublist}">
						<tr>
							<td rowspan="3"><a href="#"
								onclick="sendRoom('${h.room_code}')"><img width="100%"
									src="<%=request.getContextPath()%>/${h.room_img}"></a></td>
							<td><a href="#" onclick="sendRoom('${h.room_code}')">${h.room_name}</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="sendRoom('${h.room_code}')">최대인원수
									: ${h.guest }인</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="sendRoom('${h.room_code}')">${h.price }원*${diffDays }일=${h.price*diffDays}원</a></td>
						</tr>
					</c:forEach>


				</table>
			</div>

			<div id="tab-2" class="tab-content"
				style="margin-bottom: 20px; text-align: left; padding-left: 25%">
				<p>
					공용시설 :${hotelgrade.option1}
				</p>
				<p>
					객실 내 시설 :${hotelgrade.option2}
				</p>
			</div>
			<div id="tab-3" class="tab-content" style="margin-bottom: 20px">
				<table class="review">
					<caption>리뷰</caption>
					<tr>
						<th width="10%">평점</th>
						<th width="30%">제목</th>
						<th width="10%">작성자</th>
					</tr>
					<c:forEach var="v" items="${boardview}">
						<tr>
							<td>☆${v.hotel_grade}</td>
							<td>${v.content }</td>
							<td>${v.user_id }</td>
						</tr>

					</c:forEach>
				</table>
			</div>
			<div id="tab-4" class="tab-content" style="margin-bottom: 20px">
				<h3>SNS 정보</h3>
				<div class="w3-xlarge ">
					<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
						class="fa fa-instagram w3-hover-opacity"></i>
				</div>
				<p>숙소 전화번호 :${hotelgrade.hotel_tel}</p>
			</div>
		</div>
	</div>
</body>
</html>