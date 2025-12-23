<!-- 
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
<h2>Login</h2>

<% String error = request.getParameter("error"); %>
<% if ("invalid".equals(error)) { %>
    <p style="color:red;">Invalid username or password!</p>
<% } %>
<% String success = request.getParameter("success"); %>
<% if ("registered".equals(success)) { %>
    <p style="color:green;">Registration successful! Login now.</p>
<% } %>

<form action="login" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
</form>

<p>New user? <a href="register.jsp">Register here</a></p>
</div>
</body>
</html> -->

<%@ page session="true" %>
<%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<title>Login</title>
</head>
<body>
<h2>Login</h2>
<% if(request.getParameter("error") != null){ %>
    <p class="error">Invalid username or password</p>
<% } %>
<form action="login" method="post">
    <label>Username:</label><br>
    <input type="text" name="username" required><br><br>
    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>
    <button type="submit">Login</button>
</form>
<p>New user? <a href="register.jsp">Register here</a></p>
</body>
</html>


