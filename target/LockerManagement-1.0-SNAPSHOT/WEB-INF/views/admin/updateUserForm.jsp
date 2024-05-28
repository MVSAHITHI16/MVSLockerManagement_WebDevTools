
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Update User</title>--%>
<%--</head>--%>
<%--<script>--%>
<%--    function validateInput() {--%>
<%--        var firstName = document.getElementById("firstName").value;--%>
<%--        var letters = /^[A-Za-z\s]+$/;--%>
<%--        if (!firstName.match(letters)) {--%>
<%--            document.getElementById("errorfirstName").innerHTML = "Error: Only letters allowed in First Name";--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            document.getElementById("errorfirstName").innerHTML = ""; // Clear error message--%>
<%--        }--%>

<%--        var lastName = document.getElementById("lastName").value;--%>
<%--        var lastNameLetters = /^[A-Za-z\s]+$/;--%>
<%--        if (!lastName.match(lastNameLetters)) {--%>
<%--            document.getElementById("errorlastName").innerHTML = "Error: Only letters allowed in Last Name";--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            document.getElementById("errorlastName").innerHTML = ""; // Clear error message--%>
<%--        }--%>

<%--        var nuid = document.getElementById("nuid").value;--%>
<%--        if (nuid.length < 5) {--%>
<%--            document.getElementById("errornuid").innerHTML = "Error: NUID must be at least 5 digits";--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            document.getElementById("errornuid").innerHTML = ""; // Clear error message--%>
<%--        }--%>

<%--        var username = document.getElementById("username").value;--%>
<%--        if (!username.endsWith("@northeastern.edu")) {--%>
<%--            document.getElementById("errorusername").innerHTML = "Error: Username must end with @northeastern.edu";--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            document.getElementById("errorusername").innerHTML = ""; // Clear error message--%>
<%--        }--%>

<%--        var password = document.getElementById("password").value;--%>
<%--        var passwordRegex = /^(?=.*[A-Z])(?=.*\d).{8,}$/; // Minimum 8 characters--%>
<%--        if (!passwordRegex.test(password)) {--%>
<%--            document.getElementById("errorpassword").innerHTML = "Error: Password must have at least one capital letter, one number, and be at least 8 characters long";--%>
<%--            return false;--%>
<%--        } else {--%>
<%--            document.getElementById("errorpassword").innerHTML = ""; // Clear error message--%>
<%--        }--%>

<%--        return true;--%>
<%--    }--%>
<%--</script>--%>
<%--<body>--%>
<%--<h2>Update User</h2>--%>
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
    <title>Update User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #333;
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
        span.error {
            color: red;
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
<body>
<h2>Update User</h2>
<form action="/updateUser" method="post" onsubmit="return validateInput()">
    <label for="firstName">First Name:</label><br>
    <input type="text" id="firstName" name="firstName" value="${student.firstName}" required > <br>
    <span id="errorfirstName" class="error"></span><br>

    <label for="lastName">Last Name:</label><br>
    <input type="text" id="lastName" name="lastName" value="${student.lastName}" required><br>
    <span id="errorlastName" class="error"></span><br>

    <label for="nuid">NUID:</label><br>
    <input type="number" id="nuid" name="nuid"   value="${student.nuid}"required><br>
    <span id="errornuid" class="error"></span><br>

    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" value="${student.username}" required><br>
    <span id="errorusername" class="error"></span><br>

    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password"  value="${student.password}"required><br>
    <span id="errorpassword" class="error"></span><br>

    <label for="program">Program Enrolled In:</label><br>
    <select id="program" name="program" value="${student.program}" required>
        <option value="Information Systems" ${user.program eq 'Information Systems' ? 'selected' : ''}>Information
            Systems</option>
        <option value="Software Engineering" ${user.program eq 'Software Engineering' ? 'selected' : ''}>Software
            Engineering</option>
        <option value="Computer Science" ${user.program eq 'Computer Science' ? 'selected' : ''}>Computer Science
        </option>
    </select><br>

    <input type="hidden" id="id" name="id"  value="${student.id}" required><br>

    <input type="hidden" id="adminId" name="adminId"  value="${adminId}" required><br>

    <button type="submit">Update User</button>
    <a href="/login"><button type="button">Cancel</button></a>
</form>
</body>
</html>

