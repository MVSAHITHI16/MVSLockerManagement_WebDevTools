<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--    pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Registration Successful</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <h1>Registration Successful!</h1>--%>
<%--    <p>You have successfully registered.</p>--%>
<%--    <p>Click <a href="${pageContext.request.contextPath}/login">here</a> to login.</p>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>
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
        p {
            text-align: center;
            margin-top: 20px;
        }
        a {
            color: red;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>Registration Successful!</h1>
<p>You have successfully registered.</p>
<p>Click <a href="${pageContext.request.contextPath}/login">here</a> to login.</p>
</body>
</html>
