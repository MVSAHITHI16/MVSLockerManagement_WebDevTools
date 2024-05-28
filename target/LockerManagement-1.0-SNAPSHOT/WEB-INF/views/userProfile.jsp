<%--<%@ include file="studentHeader.jsp" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>

<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>User Profile</title>--%>
<%--    <script>--%>
<%--        function togglePassword() {--%>
<%--            var passwordField = document.getElementById("password");--%>
<%--            if (passwordField.type === "password") {--%>
<%--                passwordField.type = "text";--%>
<%--            } else {--%>
<%--                passwordField.type = "password";--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>User Profile</h1>--%>
<%--<form action="/updateProfile" method="post">--%>
<%--    <input type="hidden" id="StudentIDFromDB" name="id" value="${student.id}"><br>--%>
<%--    <label for="firstName">First Name:</label><br>--%>
<%--    <input type="text" id="firstName" name="firstName" value="${student.firstName}" required><br>--%>

<%--    <label for="lastName">Last Name:</label><br>--%>
<%--    <input type="text" id="lastName" name="lastName" value="${student.lastName}" required><br>--%>

<%--    <label for="nuid">NUID:</label><br>--%>
<%--    <input type="number" id="nuid" name="nuid" value="${student.nuid}" required><br>--%>

<%--    <label for="username">Username:</label><br>--%>
<%--    <input type="text" id="username" name="username" value="${student.username}" required><br>--%>

<%--    <label for="password">Password:</label><br>--%>
<%--    <input type="password" id="password" name="password" value="${student.password}" required><br>--%>
<%--    <input type="checkbox" value="Show Password" onclick="togglePassword()"><br>--%>

<%--    <label for="program">Program Enrolled In:</label><br>--%>
<%--    <select id="program" name="program" value="${student.program}" required>--%>
<%--        <option value="Information Systems" ${user.program eq 'Information Systems' ? 'selected' : ''}>Information Systems</option>--%>
<%--        <option value="Software Engineering" ${user.program eq 'Software Engineering' ? 'selected' : ''}>Software Engineering</option>--%>
<%--        <option value="Computer Science" ${user.program eq 'Computer Science' ? 'selected' : ''}>Computer Science</option>--%>
<%--    </select><br>--%>

<%--    <input type="submit" value="Update Profile">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<%@ include file="studentHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
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
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("password");
            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
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
<h1>User Profile</h1>
<form action="/updateProfile" method="post" onsubmit="return validateInput()">
    <input type="hidden" id="StudentIDFromDB" name="id" value="${student.id}"><br>
    <label for="firstName">First Name:</label><br>
    <input type="text" id="firstName" name="firstName" value="${student.firstName}" required><br>
    <span id="errorfirstName"></span>

    <label for="lastName">Last Name:</label><br>
    <input type="text" id="lastName" name="lastName" value="${student.lastName}" required><br>
    <span id="errorlastName"></span>

    <label for="nuid">NUID:</label><br>
    <input type="number" id="nuid" name="nuid" value="${student.nuid}" required readonly><br>
    <span id="errornuid"></span>

    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" value="${student.username}" required><br>
    <span id="errorusername"></span>

    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" value="${student.password}" required><br>
    <input type="checkbox" value="Show Password" onclick="togglePassword()"><br>
    <span id="errorpassword"></span>

    <label for="program">Program Enrolled In:</label><br>
    <select id="program" name="program" value="${student.program}" required>
        <option value="Information Systems" ${user.program eq 'Information Systems' ? 'selected' : ''}>Information
            Systems
        </option>
        <option value="Software Engineering" ${user.program eq 'Software Engineering' ? 'selected' : ''}>Software
            Engineering
        </option>
        <option value="Computer Science" ${user.program eq 'Computer Science' ? 'selected' : ''}>Computer Science
        </option>
    </select><br>

    <input type="submit" value="Update Profile">
</form>
</body>

</html>
