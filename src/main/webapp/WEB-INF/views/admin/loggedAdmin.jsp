<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Admin Dashboard</title>--%>
<%--    <style>--%>
<%--        /* Adjust form layout */--%>
<%--        label {--%>
<%--            display: inline-block;--%>
<%--            width: 100px; /* Adjust width as needed */--%>
<%--            text-align: right;--%>
<%--        }--%>
<%--        input[type="text"] {--%>
<%--            width: 200px; /* Adjust width as needed */--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Welcome Admin! ${student.firstName}</h1>--%>
<%--<a href="/logout">Logout</a>--%>
<%--<!-- Locker CRUD -->--%>
<%--<h2>Locker Management</h2>--%>

<%--<a href="/addLockerForm">Add New Locker</a>--%>

<%--<table border="1">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Row no</th>--%>
<%--        <th>ID</th>--%>
<%--        <th>Availability</th>--%>
<%--        <th>Size</th>--%>
<%--        <th>Building</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="locker" items="${lockers}" varStatus="status">--%>
<%--        <tr>--%>
<%--            <td>${status.index + 1}</td>--%>
<%--            <td>${locker.id}</td>--%>
<%--            <td>${locker.availability}</td>--%>
<%--            <td>${locker.size}</td>--%>
<%--            <td>${locker.building}</td>--%>
<%--            <td>--%>
<%--                <form action="/updateLockerForm" method="get">--%>
<%--                    <input type="hidden" name="id" value="${locker.id}">--%>
<%--                    <input type="hidden" name="adminId" value="${student.id}">--%>
<%--                    <input type="submit" value="Update">--%>
<%--                </form>--%>
<%--                <form action="/deleteLockerForm/${locker.id}" method="get">--%>
<%--                    <input type="hidden" name="adminId" value="${student.id}">--%>
<%--                    <input type="submit" value="Delete">--%>
<%--                </form>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>


<%--<!-- Student CRUD -->--%>
<%--<h2>User Management</h2>--%>

<%--<a href="/addUserForm">Add New User</a>--%>
<%--<table border="1">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>Username</th>--%>
<%--        <th>Email</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="std" items="${students}">--%>
<%--        <tr>--%>
<%--            <td>${std.id}</td>--%>
<%--            <td>${std.username}</td>--%>
<%--            <td>${std.firstName}</td>--%>
<%--            <td>${std.lastName}</td>--%>
<%--            <td>${std.nuid}</td>--%>
<%--            <td>${std.program}</td>--%>
<%--            <td>--%>
<%--                <form action="/updateUserForm" method="get">--%>
<%--                    <input type="hidden" name="studentId" value="${std.id}">--%>
<%--                    <input type="hidden" name="adminId" value="${student.id}">--%>
<%--                    <input type="submit" value="Update">--%>
<%--                </form>--%>
<%--                <form action="/deleteUserForm/${std.id}" method="get">--%>
<%--                    <input type="hidden" name="adminId" value="${student.id}">--%>
<%--                    <input type="submit" value="Delete">--%>
<%--                </form>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        .logout-btn {
            float: right; /* Align the button to the right */
            margin-right: 20px; /* Add some margin to separate it from other elements */
        }
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
        h2 {
            color: #333;
            margin-top: 30px;
            margin-bottom: 10px;
        }
        a {
            color: #e53935;
            text-decoration: none;
            margin-right: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        td form {
            display: inline-block;
            margin: 0;
        }
        input[type="submit"] {
            background-color: #e53935;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 5px;
        }
        input[type="submit"]:hover {
            background-color: #c62828;
        }
    </style>
</head>
<body>
<h1>Welcome Admin! ${student.firstName}</h1>
<a href="/logout" class="logout-btn">Logout</a>

<!-- Locker CRUD -->
<h2>Locker Management</h2>
<a href="/addLockerForm">Add New Locker</a>
<table>
    <thead>
    <tr>
        <th>Row no</th>
        <th>ID</th>
        <th>Availability</th>
        <th>Size</th>
        <th>Building</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="locker" items="${lockers}" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td>${locker.id}</td>
            <td>${locker.availability}</td>
            <td>${locker.size}</td>
            <td>${locker.building}</td>
            <td>
                <form action="/updateLockerForm" method="get">
                    <input type="hidden" name="id" value="${locker.id}">
                    <input type="hidden" name="adminId" value="${student.id}">
                    <input type="submit" value="Update">
                </form>
                <c:choose>
                    <c:when test="${locker.availability == 'Booked'}">
                        <button disabled>Delete</button>
                    </c:when>
                    <c:otherwise>
                        <form action="/deleteLockerForm/${locker.id}" method="get">
                            <input type="hidden" name="adminId" value="${student.id}">
                            <input type="submit" value="Delete">
                        </form>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<c:if test="${not empty error}">
    <p>error</p>
</c:if>
<!-- Student CRUD -->
<h2>User Management</h2>
<a href="/addUserForm">Add New User</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>NUID</th>
        <th>Program</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="std" items="${students}">
        <tr>
            <td>${std.id}</td>
            <td>${std.username}</td>
            <td>${std.firstName}</td>
            <td>${std.lastName}</td>
            <td>${std.nuid}</td>
            <td>${std.program}</td>
            <td>
                <form action="/updateUserForm" method="get">
                    <input type="hidden" name="studentId" value="${std.id}">
                    <input type="hidden" name="adminId" value="${student.id}">
                    <input type="submit" value="Update">
                </form>
                <form action="/deleteUserForm/${std.id}" method="get">
                    <input type="hidden" name="adminId" value="${student.id}">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<h2>Lent Lockers</h2>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Locker ID</th>
        <th>Student ID</th>
        <th>Start Date</th>
        <th>Due Date</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="lentLocker" items="${lentLockers}">
        <tr>
            <td>${lentLocker.id}</td>
            <td>${lentLocker.locker.id}</td>
            <td>${lentLocker.student.username}</td>
            <td>${lentLocker.startDate}</td>
            <td>${lentLocker.dueDate}</td>
            <td>${lentLocker.status}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:if test="${empty lentLockers}">
    <p>No lockers are currently lent.</p>
</c:if>
</body>
</html>

