<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ include file="studentHeader.jsp" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Student Dashboard</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div style="margin-top: 20px; text-align: center;">--%>
<%--    <h1>Welcome, ${student.firstName} ${student.lastName} !</h1>--%>

<%--    <p>Here you can manage your locker bookings and view available lockers.</p>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="studentHeader.jsp" %>
<html>
<head>
    <title>Student Dashboard</title>
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
            margin-top: 20px;
        }
        p {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div>
    <h1>Welcome, ${student.firstName} ${student.lastName}!</h1>
    <p>Here you can manage your locker bookings and view available lockers.</p>
</div>
</body>
</html>
<c:if test="${not empty errorMsg}">
    <p>Access Denied, Redirecting to Welcome User Home Page</p>
</c:if>

