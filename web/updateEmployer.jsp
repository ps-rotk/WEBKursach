<%@ page import="com.zoo.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-16" pageEncoding="EUC-KR" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body bgcolor='#ffffff'>
<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="_menu.jsp"></jsp:include>
<jsp:useBean id="employer" class="com.zoo.Employer" scope="request"/>
<jsp:useBean id="formatDate" class="java.lang.String" scope="request"/>
<input type="hidden" name="update" value="update">
<%
    DAO dao = new DAO();
    int id = Integer.parseInt(request.getParameter("personId"));
    employer = dao.getEmployerById(id);
    LocalDate date = employer.getBirthDate();
    formatDate = date.getYear()+"."+date.getMonthValue()+"."+date.getDayOfMonth();
%>
<h1> ¬²¬Ö¬Õ¬Ñ¬Ü¬ä¬Ú¬â¬à¬Ó¬Ñ¬ß¬Ú¬Ö ¬³¬à¬ä¬â¬å¬Õ¬ß¬Ú¬Ü¬Ñ </h1>
<form method='POST' action='jsp1.jsp'>
    ¬ª¬Õ¬Ö¬ß¬ä¬Ú¬æ¬Ú¬Ü¬Ñ¬ä¬à¬â: <input readonly name="id" value="<% out.println(employer.getIdEmployer());%>"/>
    ¬¶¬ª¬°: <input name="fio" value="<% out.println(employer.getFio());%>"/>
    <br><br>
    ¬¥¬Ñ¬ä¬Ñ ¬â¬à¬Ø¬Õ¬Ö¬ß¬Ú¬ñ:<input type="date" id="b" name="birtday" value="2017-12-12">
    <script type="text/javascript">
        document.getElementById("b").valueAsDate = new Date().setFullYear(<%out.println(date.getYear());%>,<%out.println(date.getMonthValue());%>,<%out.println(date.getDayOfMonth());%>);
    </script>
    <br><br>
    <input type="submit" value="¬²¬Ö¬Õ¬Ñ¬Ü¬ä¬Ú¬â¬à¬Ó¬Ñ¬ä¬î"/>
</form>
<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>
