<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html><html><head><meta charset="EUC-KR"><title>ȸ�� ��� ��ȸ</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mem.css"></head>
<script type="text/javascript">
   function del(user_id) {
	    if (confirm(user_id + "���� Ż���Ͻðڽ��ϱ�?")) {
	       location.href="memdelete?user_id="+user_id;	     	
	    }   }  </script>
<body>
	<div class="w3-display-container w3-container" >
  		<p style="font-size: 20px"><b>FPS ȸ�� ���</b>
  	</div>
  

<table style="width: 90%; margin-bottom: 2%;" align="center">


 <tr><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ</th><th>�̸���</th><th>�ּ�</th><th>���� �� Ż��</th></tr>
<c:forEach var="m" items="${list}">

<tr>
  <td><a href="memberInfo?id=${m.user_id}">${m.user_id}</a></td>
  <td>${m.name}</td>
  <td>${m.birth}</td>
  <td>${m.tel}</td>
  <td>${m.email}</td>
  <td>${m.addr}</td>
  
  <td><a href="memupdateForm?user_id=${m.user_id}">
  <input type=button class="w3-button w3-black" value="����"></a>
  
  <c:if test="${m.getUser_id() ne 'admin'}">
  <a href="javascript:del('${m.user_id}')">
  <input type=button class="w3-button w3-black" value="����Ż��"></a>
  </c:if>  
  </td></tr>
 
</c:forEach>
  
  </table></body></html> 
  