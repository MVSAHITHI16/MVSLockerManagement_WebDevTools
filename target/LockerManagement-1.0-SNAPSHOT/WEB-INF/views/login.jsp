<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>User Login</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>User Login</h1>--%>
<%--<form action="/login" method="post">--%>
<%--    <label for="username">Username:</label>--%>
<%--    <input type="text" id="username" name="username" required><br><br>--%>
<%--    <label for="password">Password:</label>--%>
<%--    <input type="password" id="password" name="password" required><br><br>--%>
<%--    <button type="submit">Login</button>--%>
<%--    <p>Don't have an account? <a href="/register">Register here</a></p>--%>
<%--</form>--%>
<%--<p>${msg}</p>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> Login Here </title>
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h1 {
            color: red;
            text-align: center;
        }
        form {
            margin: 0 auto;
            max-width: 300px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 10px);
            padding: 5px;
            margin-bottom: 10px;
        }
        button {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }
        button:hover {
            background-color: #b30000;
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
<h1>User Login</h1>
<form action="/login" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <button type="submit">Login</button>
    <p>Don't have an account? <a href="/register">Register here</a></p>
</form>
<p>${msg}</p>
</body>
</html>


