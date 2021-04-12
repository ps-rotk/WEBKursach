<%@ page import="com.zoo.DAO" %>
<%@ page import="com.zoo.Feed" %>
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
    <h1> Добавление нового корма </h1>
    <%
        DAO dao = new DAO();
        Feed feed;
        if (request.getParameter("action") != null) {
            int id = Integer.parseInt(request.getParameter("action"));
            feed = (Feed) dao.getFeedById(id);
        } else {
            feed = null;
        }
    %>
    <form id="t" method='POST' action='feed.jsp'>
        <input type="hidden" readonly name="idFeed"
               value="<%if(feed!=null)out.print(feed.getIdFeed());%>"/>
        Название: <input required value="<%if(feed!=null) out.print(feed.getTitle()); %>" name="title"/>
        <br><br>
        Количество: <input required value="<%if(feed!=null) out.print(feed.getCount()); %>" name="count"/>
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
