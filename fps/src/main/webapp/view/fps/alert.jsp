<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
 <%--  alert("${msg}"); //alert("�Խù� ��� ����")
  " <%=request.getContextPath() %>/fps/${url}"
  "<%=request.getContextPath() %>/${url}" --%>

  
  alert("${msg}");  //alert("�Խù� ��� ����")
  location.href="<%=request.getContextPath() %>/${url}";  // list
   
   <%-- "<%=request.getContextPath() %>/${url};" --%>
   
</script>
