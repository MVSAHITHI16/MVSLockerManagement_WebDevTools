

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Locker</title>
    <style>
        body {
            background-color: #f5f5f5;
            color: #333;
            font-family: Arial, sans-serif;
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
        input[type="text"],
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
        }
        input[type="submit"]:hover,
        button:hover {
            background-color: #c62828;
        }
        button {
            display: inline-block;
            text-decoration: none;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<h1>Add New Locker</h1>
<form action="addLocker" method="post">
    <label for="availability">Availability:</label>
    <select id="availability" name="availability" required>
        <option value="Available">Available</option>
        <option value="Booked">Booked</option>
    </select>

    <label for="size">Size:</label>
    <select id="size" name="size" required>
        <option value="small">Small</option>
        <option value="medium">Medium</option>
        <option value="large">Large</option>
    </select>

    <label for="building">Building:</label>
    <select id="building" name="building" required>
        <option value="Snell">Snell</option>
        <option value="Curry Student Center">Curry Student Center</option>
    </select>

    <input type="submit" value="Add Locker">
    <a href="/login"><button type="button">Cancel</button></a>
</form>
</body>
</html>

