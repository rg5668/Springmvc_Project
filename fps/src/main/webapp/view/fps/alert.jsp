<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
 <%--  alert("${msg}"); //alert("게시물 등록 성공")
  " <%=request.getContextPath() %>/fps/${url}"
  "<%=request.getContextPath() %>/${url}" --%>

  
  alert("${msg}");  //alert("게시물 등록 성공")
  location.href="<%=request.getContextPath() %>/${url}";  // list
   
   <%-- "<%=request.getContextPath() %>/${url};" --%>
   
</script>
