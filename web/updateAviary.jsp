<%@ page import="com.zoo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-16" pageEncoding="EUC-KR" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body bgcolor='#ffffff'>
<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="_menu.jsp"></jsp:include>
<jsp:useBean id="aviary" class="com.zoo.Aviary" scope="request"/>
<jsp:useBean id="formatDate" class="java.lang.String" scope="request"/>
<input type="hidden" name="update" value="update">
<%
    DAO dao = new DAO();
    int id = Integer.parseInt(request.getParameter("personId"));
    aviary = dao.getAviaryById(id);
%>
<h1> ���֬լѬܬ�ڬ��ӬѬ߬ڬ� �Ӭ�ݬ�֬�� </h1>
<form method='POST' action='jsp1.jsp'>
    ���լ֬߬�ڬ�ڬܬѬ���: <input readonly name="id" value="<% out.println(aviary.getIdAviary());%>"/>
    ���Ѭ٬ӬѬ߬ڬ�: <input name="title" value="<% out.println(aviary.getTitle());%>"/>
    <br><br>
    ���Ѭ٬ެ֬�: <input name="size" value="<% out.println(aviary.getSize());%>"/>
    <br><br>
    <br><br>
    <input type="submit" value="���֬լѬܬ�ڬ��ӬѬ��"/>
</form>
<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>
