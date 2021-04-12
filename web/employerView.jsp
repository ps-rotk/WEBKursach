<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Сотрудники</title>
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<%@page import="com.zoo.*" %>
<%@ page import="java.time.LocalDate" %>
<jsp:useBean id="list" class="java.util.ArrayList" scope="application"/>
<form action="employerView.jsp" method="post">
    <%
        DAO dao = new DAO();
        list = dao.getAllEmployers();
        if (request.getParameter("action")!=null) {
            if (request.getParameter("action").equals("Add")) {
                String fio = request.getParameter("fio");
                String gender = request.getParameter("gender");
                String birtdate = request.getParameter("birthdate");
                dao.addEmployer(new Employer(fio, Boolean.getBoolean(gender), LocalDate.parse(birtdate)));
            } else if (request.getParameter("action").equals("EditNew")) {
            } else {
                for (int i = 0; i < list.size() + 1; i++) {
                    if (request.getParameter("checkBox" + i) != null) {
                        switch (request.getParameter("action")) {
                            case "Delete":
                                try {
                                    dao.deleteEmployer(Integer.parseInt(request.getParameter("checkBox" + i)));
                                } catch (NumberFormatException e) {
                                    out.println("Ошибка перевода строки в число");
                                }
                                break;
                            case "Add":
                                String fio = request.getParameter("fio");
                                String gender = request.getParameter("gender");
                                String birtdate = request.getParameter("birthdate");
                                dao.addEmployer(new Employer(fio, Boolean.getBoolean(gender), LocalDate.parse(birtdate)));
                                break;
                            case "Edit":
                                RequestDispatcher dispatcher = request.getRequestDispatcher("web/updateEmployer.jsp");
                                dispatcher.forward(request,response);
                                break;
                        }
                    }
                }
            }
        }
        list = dao.getAllEmployers();
    %>
    <div style="padding: 5px;">
        <button type="button" name="action" onclick="location.href ='inputEmployer.jsp'" value="Add">Добавить нового сотрудника
        </button>
        <button type="submit" name="action" value="Edit">Отредактировать выбранного</button>
        <button type="submit" name="action" value="Delete">Удалить выбранных</button>
    </div>
    <%
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\"><html>");
        out.println("<body>");
        out.println("<table  id=\"centerPlacement\" border=\"1\"><tbody>");
        out.println("<tr><td><td>ФИО<td>Дата рождения<td>Пол</tr>");
        for (int i = 0; i < list.size(); i++) {
            Object o = list.get(i);
            Employer employer = (Employer) o;
            out.print("<tr><td><input form=\"checkedForm\" type=\"checkBox\" name=\"checkBox" + i + "\"  value=\"" + employer.getIdEmployer() + "\" >" +
                    "</td><td>" + employer.getFio() +
                    "</td><td>" + employer.getBirthDate() +
                    "</td><td>" + employer.isGender() +
                    "</td><td> <form action=\"inputEmployer.jsp\" method=\"post\"><button type=\"submit\" name=\"action\" value=\"" + employer.getIdEmployer() + "\">Edit</button></form>");
        }
        out.println("</tbody></table></body>");
        out.println("</html>");
    %>
</form>
<jsp:include page="_footer.jsp"/>
</body>
</html>
