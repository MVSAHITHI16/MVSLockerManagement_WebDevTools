<!-- searchResults.jsp -->
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Search Results</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Search Results</h1>--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Locker ID</th>--%>
<%--        <th>Availability</th>--%>
<%--        <th>Size</th>--%>
<%--        <th>Building</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <!-- Iterate over the lockers and display their details -->--%>
<%--    <c:forEach items="${lockers}" var="locker">--%>
<%--        <tr>--%>
<%--            <td>${locker.id}</td>--%>
<%--            <td>${locker.availability}</td>--%>
<%--            <td>${locker.size}</td>--%>
<%--            <td>${locker.building}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            color: white;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: red;
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid white;
        }
        th {
            background-color: #222;
        }
        tr:nth-child(even) {
            background-color: #333;
        }
        tr:nth-child(odd) {
            background-color: #444;
        }
        td {
            text-align: center;
        }
    </style>
</head>
<body>
<h1>Search Results</h1>
<table>
    <thead>
    <tr>
        <th>Locker ID</th>
        <th>Availability</th>
        <th>Size</th>
        <th>Building</th>
    </tr>
    </thead>
    <tbody>
    <!-- Iterate over the lockers and display their details -->
    <c:forEach items="${lockers}" var="locker">
        <tr>
            <td>${locker.id}</td>
            <td>${locker.availability}</td>
            <td>${locker.size}</td>
            <td>${locker.building}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

