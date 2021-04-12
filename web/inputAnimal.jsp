<%@ page import="com.zoo.DAO" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.zoo.Animal" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<div bgcolor='#ffffff'>
    <jsp:include page="_header.jsp"/>
    <jsp:include page="_menu.jsp"/>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 20px;
        }

        td, th {
            padding: 4px;
            border: 1px solid #000080;
        }

        th {
            background: #000080;
            color: #ffe;
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 0.9em;
        }
    </style>
    <h1> Добавление нового сотрудника </h1>
    <%
        DAO dao = new DAO();
        Animal animal;
        ArrayList<Animal> list;
        if (request.getParameter("action") != null) {
            list = dao.getAllAnimals();
            int id = Integer.parseInt(request.getParameter("action"));
            animal = (Animal) dao.getAnimalById(id);
        } else {
            animal = null;
        }
    %>
    <form id="t" method='POST' action='animal.jsp'>
        <input type="hidden" readonly name="idAnimal"
               value="<%if(animal!=null)out.print(animal.getIdAnimal());%>"/>
        Имя: <input required value="<%if(animal!=null) out.print(animal.getName()); %>" name="name"/>
        <br><br>
        Вид: <input required value="<%if(animal!=null) out.print(animal.getKind()); %>" name="kind"/>
        <br><br>
        Возраст: <input required value="<%if(animal!=null) out.print(animal.getAge()); %>" name="age"/>
        <br><br>
        <%/* //TODO: и снова я хз что это
            ArrayList<Farm> list2 = dao.getAllFarms();
            if (employer != null) {
                out.print("<table  id=\"centerPlacement\" border=\"1\"><tbody>");
                out.print("<tr><th></th><th>Номер фермы</th><th>Эффективность</th></tr>");
                boolean join;
                ArrayList<Farm> farms = dao.getAllFarmsByIdEmployer(employer.getIdEmployer());
                for (int i = 0; i < list2.size(); i++) {
                    join = false;
                    Farm o = list2.get(i);
                    for (int j = 0; j < farms.size(); j++) {
                        if (list2.get(i).getIdFarm() == farms.get(j).getIdFarm()) {
                            join = true;
                        }
                    }
                    if (join) {
                        out.print("<tr><td><input form=\"t\" type=\"checkBox\" name=\"checkBox" + i + "\"  value=\"" + o.getIdFarm() + "\"checked >" +
                                "</td><td>" + o.getIdFarm() +
                                "</td><td>" + o.getExpProfit() +
                                "</td>");
                    } else {
                        out.print("<tr><td><input form=\"t\" type=\"checkBox\" name=\"checkBox" + i + "\"  value=\"" + o.getIdFarm() + "\" >" +
                                "</td><td>" + o.getIdFarm() +
                                "</td><td>" + o.getExpProfit() +
                                "</td>");
                    }
                }
                out.print("</tbody></table>");
            }
       */ %>
        <br><br>
        <div style="padding: 5px;">
            <button type="submit" name="action" value="Add">Добавить</button>
            <button type="submit">Назад</button>
        </div>
        <br><br>
    </form>
    <jsp:include page="_footer.jsp"/>
</div>
</body>
</html>
