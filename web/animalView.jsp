<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Животные</title>
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<%@page import="com.zoo.*" %>
<jsp:useBean id="list" class="java.util.ArrayList" scope="application"/>
<form action="animalView.jsp" method="post">
    <%
        DAO dao = new DAO();
        list = dao.getAllAnimals();
        if (request.getParameter("action")!=null) {
            if (request.getParameter("action").equals("Add")) {
                String name = request.getParameter("name");
                String kind = request.getParameter("kind");
                int age = Integer.parseInt(request.getParameter("age"));
                dao.addAnimal(new Animal(name, kind, age));
            } else if (request.getParameter("action").equals("EditNew")) {
            } else {
                for (int i = 0; i < list.size() + 1; i++) {
                    if (request.getParameter("checkBox" + i) != null) {
                        switch (request.getParameter("action")) {
                            case "Delete":
                                try {
                                    dao.deleteAnimal(Integer.parseInt(request.getParameter("checkBox" + i)));
                                } catch (NumberFormatException e) {
                                    out.println("Ошибка перевода строки в число");
                                }
                                break;
                            case "Add":
                                String name = request.getParameter("name");
                                String kind = request.getParameter("kind");
                                int age = Integer.parseInt(request.getParameter("age"));
                                dao.addAnimal(new Animal(name, kind, age));
                                break;
                            case "Edit":
                                RequestDispatcher dispatcher = request.getRequestDispatcher("web/updateAnimal.jsp");
                                dispatcher.forward(request,response);
                                break;
                        }
                    }
                }
            }
        }
        list = dao.getAllAnimals();
    %>
    <div style="padding: 5px;">
        <button type="button" name="action" onclick="location.href ='inputAviary.jsp'" value="Add">Добавить новое животное
        </button>
        <button type="submit" name="action" value="Edit">Отредактировать выбраное</button>
        <button type="submit" name="action" value="Delete">Удалить выбранных</button>
    </div>
    <%
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\"><html>");
        out.println("<body>");
        out.println("<table  id=\"centerPlacement\" border=\"1\"><tbody>");
        out.println("<tr><td><td>Имя<td>Вид<td>Возраст</tr>");
        for (int i = 0; i < list.size(); i++) {
            Object o = list.get(i);
            Animal animal = (Animal) o;
            out.print("<tr><td><input form=\"checkedForm\" type=\"checkBox\" name=\"checkBox" + i + "\"  value=\"" + animal.getIdAnimal() + "\" >" +
                    "</td><td>" + animal.getName() +
                    "</td><td>" + animal.getKind() +
                    "</td><td>" + animal.getAge() +
                    "</td><td> <form action=\"inputAnimal.jsp\" method=\"post\"><button type=\"submit\" name=\"action\" value=\"" + animal.getIdAnimal() + "\">Edit</button></form>");
        }
        out.println("</tbody></table></body>");
        out.println("</html>");
    %>
</form>
<jsp:include page="_footer.jsp"/>
</body>
</html>
