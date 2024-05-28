<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>View All Lockers</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>All Lockers</h1>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>Row no</th>--%>
<%--        <th>ID</th>--%>
<%--        <th>Availability</th>--%>
<%--        <th>Size</th>--%>
<%--        <th>Building</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="locker" items="${lockers}" varStatus="status">--%>
<%--        <tr>--%>
<%--            <td>${status.index + 1}</td>--%>
<%--            <td>${locker.id}</td>--%>
<%--            <td>${locker.availability}</td>--%>
<%--            <td>${locker.size}</td>--%>
<%--            <td>${locker.building}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View All Lockers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #e53935;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #e53935;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>All Lockers</h1>
<table border="1">
    <tr>
        <th>Row no</th>
        <th>ID</th>
        <th>Availability</th>
        <th>Size</th>
        <th>Building</th>
    </tr>
    <c:forEach var="locker" items="${lockers}" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td>${locker.id}</td>
            <td>${locker.availability}</td>
            <td>${locker.size}</td>
            <td>${locker.building}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

