

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ include file="studentHeader.jsp" %>--%>

<%--<form action="/searchLockersByBuilding" method="get">--%>
<%--    <label for="building">Search by Building:</label>--%>
<%--    <input type="text" id="building" name="building">--%>
<%--    <button type="submit">Search</button>--%>
<%--</form>--%>

<%--<table border="1">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Row no</th>--%>
<%--        <th>Locker ID</th>--%>
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
<%--            <td><c:out value="${locker.id}" /></td>--%>
<%--            <td><c:out value="${locker.availability}" /></td>--%>
<%--            <td><c:out value="${locker.size}" /></td>--%>
<%--            <td><c:out value="${locker.building}" /></td>--%>
<%--            <td>--%>
<%--                <form action="/lendLocker" method="post">--%>
<%--                    <input type="hidden" name="lockerId" value="${locker.id}">--%>
<%--                    <button type="submit">Lend Locker</button>--%>
<%--                </form>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="studentHeader.jsp" %>

<form action="/searchLockersByBuilding" method="get">
    <label for="building" style="color: #e53935;">Search by Building:</label>
    <input type="text" id="building" name="building" style="padding: 8px;">
    <button type="submit" style="background-color: #e53935; color: #fff; border: none; padding: 8px 16px; cursor: pointer;">Search</button>
</form>

<table border="1">
    <thead>
    <tr>
        <th style="background-color: #e53935; color: #fff; padding: 8px;">Row no</th>
        <th style="background-color: #e53935; color: #fff; padding: 8px;">Locker ID</th>
        <th style="background-color: #e53935; color: #fff; padding: 8px;">Availability</th>
        <th style="background-color: #e53935; color: #fff; padding: 8px;">Size</th>
        <th style="background-color: #e53935; color: #fff; padding: 8px;">Building</th>
        <th style="background-color: #e53935; color: #fff; padding: 8px;">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="locker" items="${lockers}" varStatus="status">
        <tr>
            <td style="padding: 8px;">${status.index + 1}</td>
            <td style="padding: 8px;"><c:out value="${locker.id}" /></td>
            <td style="padding: 8px;"><c:out value="${locker.availability}" /></td>
            <td style="padding: 8px;"><c:out value="${locker.size}" /></td>
            <td style="padding: 8px;"><c:out value="${locker.building}" /></td>
            <td style="padding: 8px;">
                <form action="/lendLocker" method="post">
                    <input type="hidden" name="lockerId" value="${locker.id}">
                    <button type="submit" style="background-color: #e53935; color: #fff; border: none; padding: 8px 16px; cursor: pointer;">Lend Locker</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<c:if test="${not empty lockerErrorIfbookedMoreThanTwo}">
    <p>You cannot book more than 2 lockers at a time.</p>
</c:if>

