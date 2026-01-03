<!-- <!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
<h2>Register</h2>
<form action="register" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Register</button>
</form>
<p>Already have an account? <a href="login.jsp">Login</a></p>
</div>
</body>
</html> -->


<%@ page session="true" %>
<%@ include file="header.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<title>Register</title>
</head>
<body>
<h2>Register</h2>
<% if(request.getParameter("error") != null){ %>
    <p class="error">Username already exists!</p>
<% } %>
<form action="register" method="post">
    <label>Username:</label><br>
    <input type="text" name="username" required><br><br>
    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>
    <button type="submit">Register</button>
</form>
<p>Already registered? <a href="login.jsp">Login here</a></p>
</body>
</html>

