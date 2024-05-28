<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>

<%--    <meta charset="UTF-8">--%>
<%--    <title>HUSKY LOCKERS</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Welcome to Husky Lockers!</h1>--%>
<%--<p>Book you lockers here.</p>--%>
<%--<p>Please choose an option to continue:</p>--%>
<%--<ul>--%>
<%--    <li><a href="/register">Register</a></li>--%>
<%--    <li><a href="/login">Login</a></li>--%>
<%--</ul>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HUSKY LOCKERS</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            background-color: #000;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #e53935;
            text-align: center;
            margin-bottom: 30px;
        }
        p {
            color: #fff;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-container {
            text-align: center;
            margin-top: 30px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #e53935;
            color: #000;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #c62828;
        }
        a {
            color: #e53935;
            text-decoration: none;
        }
        a:hover {
            color: #c62828;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to Husky Lockers!</h1>
    <p>Book your lockers here, secure and convenient storage for your belongings.</p>
    <div class="btn-container">
        <a href="/register" class="btn">Register</a>
        <a href="/login" class="btn">Login</a>
    </div>
</div>
</body>
</html>