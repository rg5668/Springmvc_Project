<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/tab.css">
<meta charset="EUC-KR">
<title>ȣ������</title>

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
			
		$('#btn2').click(function(){//üũ�� üũ�ƿ� ��üũ �Լ�
			 if($( "#datepicker" ).datepicker( "getDate" )==''||$( "#datepicker" ).datepicker( "getDate" )==null)
			 {
				 alert("üũ�� ��¥�� �����ϴ�!")
		          return false;
		      }
			 else if($( "#datepicker1" ).datepicker( "getDate" )==''||$( "#datepicker1" ).datepicker( "getDate" )==null)
			{
				 alert("üũ�ƿ� ��¥�� �����ϴ�!")
		          return false;
		      }
			  return true;
			});
	})
	
$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '���� ��',
        nextText: '���� ��',
        monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
        showMonthAfterYear: true,
        yearSuffix: '��',
       
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
		 if($( "#datepicker" ).datepicker( "getDate" )==''||$( "#datepicker" ).datepicker( "getDate" )==null)//üũ�� üũ�ƿ� ��üũ�Լ�2
		 {
			 alert("üũ�� ��¥�� �����ϴ�!")
	          return false;
	      }
		 else if($( "#datepicker1" ).datepicker( "getDate" )==''||$( "#datepicker1" ).datepicker( "getDate" )==null)
		{
			 alert("üũ�ƿ� ��¥�� �����ϴ�!")
	          return false;
	      }
		 else if('${gd.sdate}'==null||'${gd.sdate}'=='')
		{
			 alert("�˻���ư�� �����ּ���")
			 return false;
		 }
		 else if('${gd.edate}'==null||'${gd.edate}'=='')
			{
				 alert("�˻���ư�� �����ּ���")
				 return false;
			 }
		
		var form = document.createElement('form'); // ����ü ����
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
		
		form.setAttribute('method', 'post'); //get,post ����
		form.setAttribute('action', "<%=request.getContextPath()%>/hotel/paymentForm"); //������ url
		document.body.appendChild(form);
		form.submit();
	}
</script>
<body>

	<div class="w3-container w3-margin-left w3-margin-top">
		<p style="font-size: 20px">
			<b>���һ� ����</b>
		</p>
	</div>

	<div class="w3-middle w3-margin-top" align="center">
		<table>
			<tr>
				<td rowspan="3"><img style="width: 300px"
					src="<%=request.getContextPath()%>/${hotelgrade.hotel_img}"
					height="200px"></td>
				<td><h4>���Ҹ� : ${hotelgrade.hotel_name}</h4></td>
			</tr>
			<tr>
				<td>���� : ��${hotelgrade.hotel_grade}</td>
			</tr>
			<tr>
				<td>�ּ� : ${hotelgrade.hotel_addr}</td>
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
				<i class="fa fa-male"></i> �ο� <input class="w3-border"
					style="width: 10%" type="number" value="${gd.guest }" name="guest"
					min="1" max="10"> <i class="fa fa-calendar-o"></i> üũ�� <input
					class="w3-border" style="width: 12%" type="date"
					value="${gd.sdate }" name="sdate" id="datepicker"
					onchange="chancal()" readonly> <i class="fa fa-calendar-o"></i>
				üũ�ƿ� <input class="w3-border" style="width: 12%" type="date"
					value="${gd.edate }" name="edate" id="datepicker1" readonly>
				<b><input type="submit" id="btn2" class="w3-button w3-black"
					style="width: 100px; height: 30px; font-size: 12px; margin-bottom: 5px"
					value="�˻�"></b>
			</form>
			<br>
			<ul class="tabs w3-middle w3-center" style="margin-bottom: 20px;">
				<li class="tab-link current" data-tab="tab-1"
					style="margin-left: 25%;">���� �ȳ�/����</li>
				<li class="tab-link" data-tab="tab-2">��������</li>
				<li class="tab-link" data-tab="tab-3">����</li>
				<li class="tab-link" data-tab="tab-4">1��1 ����</li>
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
							<td>�ִ��ο��� : ${h.guest }��</td>
						</tr>
						<tr>
							<td>${h.price }��*${diffDays }��=${h.price*diffDays}��</td>
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
							<td><a href="#" onclick="sendRoom('${h.room_code}')">�ִ��ο���
									: ${h.guest }��</a></td>
						</tr>
						<tr>
							<td><a href="#" onclick="sendRoom('${h.room_code}')">${h.price }��*${diffDays }��=${h.price*diffDays}��</a></td>
						</tr>
					</c:forEach>


				</table>
			</div>

			<div id="tab-2" class="tab-content"
				style="margin-bottom: 20px; text-align: left; padding-left: 25%">
				<p>
					����ü� :${hotelgrade.option1}
				</p>
				<p>
					���� �� �ü� :${hotelgrade.option2}
				</p>
			</div>
			<div id="tab-3" class="tab-content" style="margin-bottom: 20px">
				<table class="review">
					<caption>����</caption>
					<tr>
						<th width="10%">����</th>
						<th width="30%">����</th>
						<th width="10%">�ۼ���</th>
					</tr>
					<c:forEach var="v" items="${boardview}">
						<tr>
							<td>��${v.hotel_grade}</td>
							<td>${v.content }</td>
							<td>${v.user_id }</td>
						</tr>

					</c:forEach>
				</table>
			</div>
			<div id="tab-4" class="tab-content" style="margin-bottom: 20px">
				<h3>SNS ����</h3>
				<div class="w3-xlarge ">
					<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
						class="fa fa-instagram w3-hover-opacity"></i>
				</div>
				<p>���� ��ȭ��ȣ :${hotelgrade.hotel_tel}</p>
			</div>
		</div>
	</div>
</body>
</html>