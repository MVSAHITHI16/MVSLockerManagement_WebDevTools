<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>User Profile</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>User Profile</h1>--%>
<%--<form action="/updateProfile" method="post">--%>
<%--    <label for="firstName">First Name:</label><br>--%>
<%--    <input type="text" id="firstName" name="firstName" value="${user.firstName}" required><br>--%>

<%--    <label for="lastName">Last Name:</label><br>--%>
<%--    <input type="text" id="lastName" name="lastName" value="${user.lastName}" required><br>--%>

<%--    <label for="nuid">NUID:</label><br>--%>
<%--    <input type="number" id="nuid" name="nuid" value="${user.nuid}" required><br>--%>

<%--    <label for="username">Username:</label><br>--%>
<%--    <input type="text" id="username" name="username" value="${user.username}" required><br>--%>

<%--    <label for="password">Password:</label><br>--%>
<%--    <input type="password" id="password" name="password" required><br>--%>

<%--    <label for="program">Program Enrolled In:</label><br>--%>
<%--    <select id="program" name="program" required>--%>
<%--        <option value="Information Systems" ${user.program eq 'Information Systems' ? 'selected' : ''}>Information Systems</option>--%>
<%--        <option value="Software Engineering" ${user.program eq 'Software Engineering' ? 'selected' : ''}>Software Engineering</option>--%>
<%--        <option value="Computer Science" ${user.program eq 'Computer Science' ? 'selected' : ''}>Computer Science</option>--%>
<%--    </select><br>--%>

<%--    <input type="submit" value="Update Profile">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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
        form {
            width: 300px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-top: 10px;
            color: white;
        }
        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 8px;
            border: none;
            border-radius: 4px;
            margin-top: 5px;
            box-sizing: border-box;
            background-color: black;
            color: white;
        }
        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border: 1px solid red;
        }
        input[type="submit"] {
            background-color: red;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
<h1>User Profile</h1>
<form action="/updateProfile" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>

    <label for="nuid">NUID:</label>
    <input type="number" id="nuid" name="nuid" value="${user.nuid}" required>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value="${user.username}" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <label for="program">Program Enrolled In:</label>
    <select id="program" name="program" required>


