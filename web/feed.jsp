<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="./css/button.css" type="text/css" />
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Список еды</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 20px ;
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
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_menu.jsp"/>
<%@page import="com.zoo.DAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.zoo.Feed" %>
<jsp:useBean id="list" class="java.util.ArrayList" scope="application"/>
<jsp:useBean id="listPosition" class="java.util.ArrayList" scope="application"/>
<%
    request.setCharacterEncoding("UTF-8");
%>
<form id="checkedForm" action="feed.jsp" method="post">
    <%
        DAO dao = new DAO();
        list = dao.getAllFeeds();
        if (request.getParameter("action")!=null) {
            if(request.getParameter("action").equals("Delete")){
                for (int i = 0; i < list.size() + 1; i++) {
                    if (request.getParameter("checkBox" + i) != null) {
                        try {
                            dao.deleteFeed(Integer.parseInt(request.getParameter("checkBox" + i)));
                        } catch (NumberFormatException e) {
                            out.println("Ошибка перевода строки в число");
                        }
                    }
                }
            }
            else if (request.getParameter("idFeed").equals("") ) {
                String title = request.getParameter("title");
                int count = Integer.parseInt(request.getParameter("count"));
                dao.addFeed(new Feed(title, count));
            } else if (request.getParameter("idFeed")!= null) {
                String title = request.getParameter("title");
                int count = Integer.parseInt(request.getParameter("count"));
                Feed feed = new Feed(Integer.parseInt(request.getParameter("idFeed")),title, count);
                dao.updateAviary(feed); //TODO: ниже были вопросы к тому, что написано
                /*ArrayList<Farm> farms = dao.getAllFarms();
                System.out.println("Я тут farms:" + farms.size());
                for (int i = 0; i < farms.size() + 1; i++) {
                    if (request.getParameter("checkBox" + i) != null) {
                        int id  = Integer.parseInt(request.getParameter("checkBox" + i));
                        System.out.println(id);
                        dao.addFarmEmployer(employer.getIdEmployer(), id);
                    }
                }*/
            }
        }
        list = dao.getAllFeeds();
    %>
    <div style="padding: 5px;">
        <button class="button7" type="button" name="action" onclick="location.href ='inputFeed.jsp'" value="Add">Добавить новый корм
        </button>
        <button  class="button7"  type="submit" name="action" value="Delete">Удалить</button>
    </div>
</form>
<%
    out.print("<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\"><html>");
    out.print("<body>");
    out.print("<table  id=\"centerPlacement\" border=\"1\"><tbody>");
    out.print("<tr><th></th><th>Название</th><th>Количество</th><th></th></tr>");
    for (int i = 0; i < list.size(); i++) {
        Object o = list.get(i);
        Feed feed = (Feed) o;
        out.print("<tr><td><input form=\"checkedForm\" type=\"checkBox\" name=\"checkBox" + i + "\"  value=\"" + feed.getIdFeed() + "\" >" +
                "</td><td>" + feed.getTitle() +
                "</td><td>" + feed.getCount() +
                "</td><td> <form action=\"inputAviary.jsp\" method=\"post\"><button  class=\"button7\"  type=\"submit\" name=\"action\" value=\"" + feed.getIdFeed() + "\">Редактировать</button></form>" +
                "<form action=\"feedInfo.jsp\" method=\"post\"></form>");
    }
    out.print("</tbody></table></body>");
    out.print("</html>");
%>
<br><br>
<jsp:include page="_footer.jsp"/>
</body>
</html>