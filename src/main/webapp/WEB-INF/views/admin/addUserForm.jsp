<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Add User</title>--%>
<%--    <script>--%>
<%--        function validateInput() {--%>
<%--            var firstName = document.getElementById("firstName").value;--%>
<%--            var letters = /^[A-Za-z\s]+$/;--%>
<%--            if (!firstName.match(letters)) {--%>
<%--                document.getElementById("errorfirstName").innerHTML = "Error: Only letters allowed in First Name";--%>
<%--                return false;--%>
<%--            } else {--%>
<%--                document.getElementById("errorfirstName").innerHTML = ""; // Clear error message--%>
<%--            }--%>

<%--            var lastName = document.getElementById("lastName").value;--%>
<%--            var lastNameLetters = /^[A-Za-z\s]+$/;--%>
<%--            if (!lastName.match(lastNameLetters)) {--%>
<%--                document.getElementById("errorlastName").innerHTML = "Error: Only letters allowed in Last Name";--%>
<%--                return false;--%>
<%--            } else {--%>
<%--                document.getElementById("errorlastName").innerHTML = ""; // Clear error message--%>
<%--            }--%>

<%--            var nuid = document.getElementById("nuid").value;--%>
<%--            if (nuid.length < 5) {--%>
<%--                document.getElementById("errornuid").innerHTML = "Error: NUID must be at least 5 digits";--%>
<%--                return false;--%>
<%--            } else {--%>
<%--                document.getElementById("errornuid").innerHTML = ""; // Clear error message--%>
<%--            }--%>

<%--            var username = document.getElementById("username").value;--%>
<%--            if (!username.endsWith("@northeastern.edu")) {--%>
<%--                document.getElementById("errorusername").innerHTML = "Error: Username must end with @northeastern.edu";--%>
<%--                return false;--%>
<%--            } else {--%>
<%--                document.getElementById("errorusername").innerHTML = ""; // Clear error message--%>
<%--            }--%>

<%--            var password = document.getElementById("password").value;--%>
<%--            var passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,}$/; // Minimum 8 characters--%>
<%--            if (!passwordRegex.test(password)) {--%>
<%--                document.getElementById("errorpassword").innerHTML = "Error: Password must have at least one capital letter, one number, and be at least 8 characters long";--%>
<%--                return false;--%>
<%--            } else {--%>
<%--                document.getElementById("errorpassword").innerHTML = ""; // Clear error message--%>
<%--            }--%>

<%--            return true;--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Add User</h2>--%>
<%--<form action="/register" method="post" onsubmit="return validateInput()">--%>
<%--    <label for="firstName">First Name:</label><br>--%>
<%--    <input type="text" id="firstName" name="firstName" required><br>--%>
<%--    <span id="errorfirstName" style="color: red;"></span><br>--%>

<%--    <label for="lastName">Last Name:</label><br>--%>
<%--    <input type="text" id="lastName" name="lastName" required><br>--%>
<%--    <span id="errorlastName" style="color: red;"></span><br>--%>

<%--    <label for="nuid">NUID:</label><br>--%>
<%--    <input type="number" id="nuid" name="nuid" required><br>--%>
<%--    <span id="errornuid" style="color: red;"></span><br>--%>

<%--    <label for="username">Username:</label><br>--%>
<%--    <input type="text" id="username" name="username" required><br>--%>
<%--    <span id="errorusername" style="color: red;"></span><br>--%>

<%--    <label for="password">Password:</label><br>--%>
<%--    <input type="password" id="password" name="password" required><br>--%>
<%--    <span id="errorpassword" style="color: red;"></span><br>--%>

<%--    <label for="program">Program Enrolled In:</label><br>--%>
<%--    <select id="program" name="program" required>--%>
<%--        <option value="" disabled selected>Select your program</option>--%>
<%--        <option value="Information Systems">Information Systems</option>--%>
<%--        <option value="Software Engineering">Software Engineering</option>--%>
<%--        <option value="Computer Science">Computer Science</option>--%>
<%--    </select><br>--%>


<%--    <button type="submit">Add User</button>--%>
<%--    <a href="/login"><button type="button">Cancel</button></a>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
    <style>
        body {
            background-color: #f5f5f5;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h2 {
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
        input[type="text"],
        input[type="password"],
        input[type="number"],
        select {
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
        span {
            color: red;
            margin-top: 5px;
            display: block;
        }
        a {
            text-decoration: none;
            color: #e53935;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function validateInput() {
            var firstName = document.getElementById("firstName").value;
            var letters = /^[A-Za-z\s]+$/;
            if (!firstName.match(letters)) {
                document.getElementById("errorfirstName").innerHTML = "Error: Only letters allowed in First Name";
                return false;
            } else {
                document.getElementById("errorfirstName").innerHTML = ""; // Clear error message
            }

            var lastName = document.getElementById("lastName").value;
            var lastNameLetters = /^[A-Za-z\s]+$/;
            if (!lastName.match(lastNameLetters)) {
                document.getElementById("errorlastName").innerHTML = "Error: Only letters allowed in Last Name";
                return false;
            } else {
                document.getElementById("errorlastName").innerHTML = ""; // Clear error message
            }

            var nuid = document.getElementById("nuid").value;
            if (nuid.length !== 5) { // Check if the length is not exactly 5
                document.getElementById("errornuid").innerHTML = "Error: NUID must be exactly 5 digits";
                return false;
            } else {
                document.getElementById("errornuid").innerHTML = ""; // Clear error message
            }

            var username = document.getElementById("username").value;
            if (!username.endsWith("@northeastern.edu")) {
                document.getElementById("errorusername").innerHTML = "Error: Username must end with @northeastern.edu";
                return false;
            } else {
                document.getElementById("errorusername").innerHTML = ""; // Clear error message
            }

            var password = document.getElementById("password").value;
            var passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,}$/; // Minimum 8 characters
            if (!passwordRegex.test(password)) {
                document.getElementById("errorpassword").innerHTML = "Error: Password must have at least one capital letter, one number, and be at least 8 characters long";
                return false;
            } else {
                document.getElementById("errorpassword").innerHTML = ""; // Clear error message
            }

            return true;
        }
    </script>
</head>
<body>
<h2>Add User</h2>
<form action="/addUser" method="post" onsubmit="return validateInput()">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required>
    <span id="errorfirstName"></span>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required>
    <span id="errorlastName"></span>

    <label for="nuid">NUID:</label>
    <input type="number" id="nuid" name="nuid" required>
    <span id="errornuid"></span>

    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <span id="errorusername"></span>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <span id="errorpassword"></span>

    <label for="program">Program Enrolled In:</label>
    <select id="program" name="program" required>
        <option value="" disabled selected>Select your program</option>
        <option value="Information Systems">Information Systems</option>
        <option value="Software Engineering">Software Engineering</option>
        <option value="Computer Science">Computer Science</option>
    </select>

    <button type="submit">Add User</button>
    <a href="/login"><button type="button">Cancel</button></a>
</form>
</body>
</html>
