<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Student Registration</title>--%>
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
<%--<h1>Student Registration</h1>--%>
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

<%--    <input type="submit" value="Register">--%>
<%--    <p>Already have an account? <a href="/login">Login here</a></p>--%>
<%--</form>--%>
<%--${error}--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
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
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"],
        input[type="password"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: red;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #b30000;
        }
        span {
            color: red;
            margin-top: 5px;
            display: block;
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
<h1> Register Here </h1>
<form action="/register" method="post" onsubmit="return validateInput()">
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

    <input type="submit" value="Register">
    <p>Already have an account? <a href="/login">Login here</a></p>
</form>
${error}
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
</body>
</html>

