<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>View Users</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>View Users</h2>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>First Name</th>--%>
<%--        <th>Last Name</th>--%>
<%--        <th>Username</th>--%>
<%--        <th>Program</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    <c:forEach items="${students}" var="student">--%>
<%--        <tr>--%>
<%--            <td>${student.id}</td>--%>
<%--            <td>${student.firstName}</td>--%>
<%--            <td>${student.lastName}</td>--%>
<%--            <td>${student.username}</td>--%>
<%--            <td>${student.program}</td>--%>
<%--            <td>--%>
<%--                <a href="updateUserForm/${student.id}">Edit</a>--%>
<%--                <a href="deleteUserForm/${student.id}">Delete</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h2 {
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
        a {
            text-decoration: none;
            color: #333;
            margin-right: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>View Users</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Username</th>
        <th>Program</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.firstName}</td>
            <td>${student.lastName}</td>
            <td>${student.username}</td>
            <td>${student.program}</td>
            <td>
                <a href="updateUserForm/${student.id}">Edit</a>
                <a href="deleteUserForm/${student.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
