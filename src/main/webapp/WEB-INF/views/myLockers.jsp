<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>My Lockers</title>--%>
<%--    <style>--%>
<%--        th, td {--%>
<%--            padding: 10px;--%>
<%--        }--%>
<%--        th {--%>
<%--            background-color: #f2f2f2;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@ include file="studentHeader.jsp" %>--%>
<%--<h1>My Lockers</h1>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>Locker ID</th>--%>
<%--        <th>Locker Size</th>--%>
<%--        <th>Locker Building</th>--%>
<%--        <th>Start Date</th>--%>
<%--        <th>Due Date</th>--%>
<%--        <th>Return Date</th>--%>
<%--        <th>Status</th>--%>
<%--        <th>Fine ($10/day)</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="lending" items="${lockerLendings}">--%>
<%--        <tr>--%>
<%--            <td>${lending.locker.id}</td>--%>
<%--            <td>${lending.locker.size}</td>--%>
<%--            <td>${lending.locker.building}</td>--%>
<%--            <td><fmt:formatDate value="${lending.startDate}" pattern="yyyy-MM-dd"/></td>--%>
<%--            <td><fmt:formatDate value="${lending.dueDate}" pattern="yyyy-MM-dd"/></td>--%>
<%--            <td><c:choose>--%>
<%--                <c:when test="${not empty lending.returnDate}">--%>
<%--                    <fmt:formatDate value="${lending.returnDate}" pattern="yyyy-MM-dd"/>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>Not Returned</c:otherwise>--%>
<%--            </c:choose>--%>
<%--            </td>--%>
<%--            <td>${lending.status}</td>--%>
<%--            <td>--%>
<%--                <c:if test="${lending.fine != null}">--%>
<%--                    ${lending.fine}--%>
<%--                </c:if>--%>
<%--                <c:if test="${lending.fine == null}">--%>
<%--                    0--%>
<%--                </c:if>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <c:if test="${lending.status == 'Active'}">--%>
<%--                    <form action="/returnLocker" method="post">--%>
<%--                        <input type="hidden" name="lendingId" value="${lending.id}">--%>
<%--                        <button type="submit">Return Locker</button>--%>
<%--                    </form>--%>
<%--                </c:if>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--</body>--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <title>My Lockers</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        td button {
            background-color: #e53935;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="studentHeader.jsp" %>
<h1>My Lockers</h1>
<table>
    <tr>
        <th>Locker ID</th>
        <th>Locker Size</th>
        <th>Locker Building</th>
        <th>Start Date</th>
        <th>Due Date</th>
        <th>Return Date</th>
        <th>Status</th>
        <th>Fine ($10/day)</th>
        <th>Action</th>
    </tr>
    <c:forEach var="lending" items="${lockerLendings}">
        <tr>
            <td>${lending.locker.id}</td>
            <td>${lending.locker.size}</td>
            <td>${lending.locker.building}</td>
            <td><fmt:formatDate value="${lending.startDate}" pattern="yyyy-MM-dd"/></td>
            <td><fmt:formatDate value="${lending.dueDate}" pattern="yyyy-MM-dd"/></td>
            <td><c:choose>
                <c:when test="${not empty lending.returnDate}">
                    <fmt:formatDate value="${lending.returnDate}" pattern="yyyy-MM-dd"/>
                </c:when>
                <c:otherwise>Not Returned</c:otherwise>
            </c:choose>
            </td>
            <td>${lending.status}</td>
            <td>
                <c:if test="${lending.fine != null}">
                    ${lending.fine}
                </c:if>
                <c:if test="${lending.fine == null}">
                    0
                </c:if>
            </td>
            <td>
                <c:if test="${lending.status == 'Active'}">
                    <form action="/returnLocker" method="post">
                        <input type="hidden" name="lendingId" value="${lending.id}">
                        <button type="submit">Return Locker</button>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
