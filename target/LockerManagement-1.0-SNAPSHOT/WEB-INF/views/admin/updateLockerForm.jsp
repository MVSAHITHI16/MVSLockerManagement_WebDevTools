<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Update Locker</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Update Locker</h1>--%>
<%--<form action="updateLocker" method="post">--%>
<%--    ID: <input type="hidden" name="id" value="${locker.id}" readonly><br>--%>
<%--    Availability: <input type="text" name="availability" value="${locker.availability}"><br>--%>
<%--    Size: <input type="text" name="size" value="${locker.size}"><br>--%>
<%--    Building: <input type="text" name="building" value="${locker.building}"><br>--%>
<%--    <input type="submit" value="Update Locker">--%>
<%--    <input type="hidden" name="adminId" value="${adminId}">--%>
<%--    <a href="/login"><button type="button">Cancel</button></a>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Update Locker</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background-color: #f5f5f5;--%>
<%--            color: #333;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>
<%--        h1 {--%>
<%--            color: #e53935;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        form {--%>
<%--            max-width: 400px;--%>
<%--            margin: 0 auto;--%>
<%--            background-color: #fff;--%>
<%--            padding: 20px;--%>
<%--            border-radius: 8px;--%>
<%--            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>
<%--        label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--        }--%>
<%--        input[type="text"] {--%>
<%--            width: calc(100% - 10px);--%>
<%--            padding: 8px;--%>
<%--            margin-bottom: 10px;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 5px;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>
<%--        input[type="submit"],--%>
<%--        button {--%>
<%--            background-color: #e53935;--%>
<%--            color: #fff;--%>
<%--            border: none;--%>
<%--            padding: 10px 20px;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--            margin-top: 10px;--%>
<%--            display: block;--%>
<%--            width: 100%;--%>
<%--        }--%>
<%--        input[type="submit"]:hover,--%>
<%--        button:hover {--%>
<%--            background-color: #c62828;--%>
<%--        }--%>
<%--        button {--%>
<%--            margin-top: 10px;--%>
<%--        }--%>
<%--        a {--%>
<%--            text-decoration: none;--%>
<%--            color: #e53935;--%>
<%--        }--%>
<%--        a:hover {--%>
<%--            text-decoration: underline;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Update Locker</h1>--%>
<%--<form action="updateLocker" method="post">--%>
<%--    ID: <input type="hidden" name="id" value="${locker.id}" readonly><br>--%>
<%--    Availability: <input type="text" name="availability" value="${locker.availability}"><br>--%>
<%--    Size: <input type="text" name="size" value="${locker.size}"><br>--%>
<%--    Building: <input type="text" name="building" value="${locker.building}"><br>--%>
<%--    <input type="submit" value="Update Locker">--%>
<%--    <input type="hidden" name="adminId" value="${adminId}">--%>
<%--    <a href="/login"><button type="button">Cancel</button></a>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Locker</title>
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
        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"] {
            width: calc(100% - 10px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"],
        button {
            background-color: #e53935;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            display: block;
            width: 100%;
        }
        input[type="submit"]:hover,
        button:hover {
            background-color: #c62828;
        }
        button {
            margin-top: 10px;
        }
        a {
            text-decoration: none;
            color: #e53935;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>Update Locker</h1>
<form action="updateLocker" method="post">
     <input type="hidden" name="id" value="${locker.id}" readonly><br>
    Availability:
    <select name="availability">
        <option value="Available" ${locker.availability == 'Available' ? 'selected' : ''}>Available</option>
        <option value="Booked" ${locker.availability == 'Booked' ? 'selected' : ''}>Booked</option>
    </select><br>
    Size:
    <select name="size">
        <option value="small" ${locker.size == 'small' ? 'selected' : ''}>Small</option>
        <option value="medium" ${locker.size == 'medium' ? 'selected' : ''}>Medium</option>
        <option value="large" ${locker.size == 'large' ? 'selected' : ''}>Large</option>
    </select><br>
    Building:
    <select name="building">
        <option value="Snell" ${locker.building == 'Snell' ? 'selected' : ''}>Snell</option>
        <option value="Curry Student Center" ${locker.building == 'Curry Student Center' ? 'selected' : ''}>Curry Student Center</option>
    </select><br>
    <input type="submit" value="Update Locker">
    <input type="hidden" name="adminId" value="${adminId}">
    <a href="/login"><button type="button">Cancel</button></a>
</form>
</body>
</html>

