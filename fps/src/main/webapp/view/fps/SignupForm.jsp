<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import = "java.io.InputStream"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="EUC-KR"><title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/list.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/signup.css">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
* {font-family: 'Noto Sans KR', sans-serif; }
</style>


<script src="/maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="/code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	<!-- jQuery ui -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	<!-- ���� �����ȣ api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script> <!-- cdnjs.com���� ������ fontawesome cdn ���̺귯�� -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function Signupform_submit()
{
   var f=document.f;
   
    if(f.user_id.value===""||f.user_id.value==null)
   {
      alert("���̵� �Է��ϼ���.");
      f.id.focus();
      return;
   }
    if(f.password.value===""||f.password.value==null)
   {
      alert("��й�ȣ�� �Է��ϼ���.");
      f.password.focus();
      return;
   }
   if(f.password.value != f.passcheck.value ){
       alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
       f.passcheck.focus();
       return false;
   }
   if(f.name.value===""||f.name.value==null)
   {
      alert("�̸��� �Է��ϼ���.");
      f.name.focus();
      return;
   }
   if(f.tel.value===""||f.tel.value==null)
   {
      alert("����ó�� �Է��ϼ���");
      f.tel.focus();
      return;
   }
   if(f.email.value===""||f.email.value==null)
   {
      alert("�̸����� �Է��ϼ���");
      f.email.focus();
      return;
   }
   if(f.birthyy.value=="00"||f.birthyy==null)
   {
      alert("��������� �������ּ���.");
      f.birthyy.focus();
      return;
   }
   if(f.birthmm.value=="00"||f.birthmm==null)
   {
      alert("��������� �������ּ���.");
      f.birthmm.focus();
      return;
   }
   if(f.birthdd.value=="00"||f.birthdd==null)
   {
      alert("��������� �������ּ���.");
      f.birthdd.focus();
      return;
   }
   if(f.post.value===""||f.post.value==null)
   {
      alert("�ּҸ� �Է��ϼ���.");
      f.post.focus();
      return;
   }
   if(f.addr1.value===""||f.addr1.value==null)
   {
      alert("�ּҸ� �Է��ϼ���.");
      f.post.focus();
      return;
   }
   if(f.addr2.value===""||f.addr2.value==null)
   {
      alert("���ּҸ� �Է��ϼ���.");
      f.addr2.focus();
      return;
   }
   
   f.submit();
} 



function daum_post() {
	new daum.Postcode({
        oncomplete: function(data) {
           // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

           // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
           // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
           var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
           var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

           // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
           // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
           if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           document.getElementById('post').value = data.zonecode; //5�ڸ� �������ȣ ���
           document.getElementById('addr1').value = fullRoadAddr;
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5�ڸ� �������ȣ ���
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
	
	function javascript(){
		 
	    //setAttribute�� innerHTML�ÿ� ������
	    document.getElementById("user_id").setAttribute("value",document.getElementById("user_id").value);
	    document.getElementById("divId").innerHTML += "<input type='text' name='' id=''/>";
	 
	}
}
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body class="w3-content">

<a href="<%=request.getContextPath() %>/mainForm">
		<img src="/fps/w3images/logo.png" style="height: 70px; width : 70px; background-color: black; margin-top: 30px">
	</a>

<!-- !PAGE CONTENT! -->

  <!-- Push down content on small screens -->
 
  
  <!-- Top header -->
  

	<form action="<%=request.getContextPath() %>/member/join" name="f" method="post" class="main_form">
      	<table style="width:40%" >
          <tbody>
            <tr>
              <th>���̵�</th>
              <td><input type="text" id="user_id" name="user_id" value="${user_id }" placeholder="���̵� �Է����ּ���.">
              	<input type="submit" name="id_check" value="�ߺ�Ȯ��" style="width:80px;" class="btn2" onclick='javascript()' formaction="<%=request.getContextPath()%>/member/idcheck"></td>
            </tr>
            <tr>
              <th>��й�ȣ</th>
              <td><input type="password" id="password" name="password" placeholder="��й�ȣ�� �Է����ּ���." style="width:80%"></td>
            </tr>
              <tr>
                <th>��й�ȣ Ȯ��</th>
                <td><input type="password" id="passcheck" name="passcheck" placeholder="��й�ȣ�� �Է����ּ���." style="width:80%"></td>
              </tr>
              <tr>
              <th>�̸�</th>
              <td><input type="text" id="name" name="name"  placeholder="�̸��� �Է����ּ���." style="width:80%"></td>
            </tr>
              <tr>
                <th>��ȭ��ȣ</th>
                <td>
                <input type="tel" id="tel" name="tel" placeholder="����ó�� �Է����ּ���."  style="width:80%"></td>
              </tr>
              <tr>
                <th>�̸���</th>
                <td>
                <input type="email" id="email" name="email" placeholder="�̸����� �Է����ּ���."  style="width:80%"></td>
              </tr>
              <tr>
            <th>�������</th>
              <td>
                <select  name="birthyy" class="yy_sel" aria-label=""  style="width:26%" required>
                <option value="00">----��</option>
                <c:forEach var="i" begin="1" end="30">
                <option><c:out value="${2022-i}��" /></option>
                </c:forEach>
                </select>
                <select  name="birthmm" class="mm_sel" aria-label=""  style="width:25%">
                  <option value="00">--��</option>
             <c:forEach var="i" begin="1" end="12">
                <option><c:out value="${i}��" /></option>
                </c:forEach>
                </select> 
                <select  name="birthdd" class="dd_sel" aria-label="--��"  style="width:25%">
                  <option value="00">--��</option>
                  <c:forEach var="i" begin="1" end="31">
                <option><c:out value="${i}��" /></option>
                </c:forEach>
              </select><br/></td></tr>
            <tr>
              <th>�ּ�</th>
              <td>
              <a class='btn-fill-d' onclick="daum_post()">
						<input type="text" id="post" name="post" placeholder="�����ȣ"  readonly /></a><br>
					<input type="text" id="addr1" name="addr1" placeholder="�ּҸ� �Է����ּ���."  style="width:80%" readonly><br>
                  	<input type="text" id="addr2" name="addr2" placeholder="���ּҸ� �Է����ּ���." style="width:80%">
             </td>
            </tr>
          </tbody> 
        </table>
                <div class="w3-button w3-black" style="width: 37%; margin-top: 10px; margin-left: 30px">
                	<a class="btn-fill" onclick="Signupform_submit()">ȸ������</a>
                </div>
</form></body>
</html>