<%@ page session="true" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <h2>Register</h2>

    <% if (request.getParameter("error") != null) { %>
        <p class="error">Username already exists. Please choose another.</p>
    <% } %>

    <form action="register" method="post">
        <label>Username</label><br>
        <input type="text" name="username" required><br><br>

        <label>Email</label><br>
        <input type="email" name="email" required><br><br>

        <label>Password</label><br>
        <input type="password" name="password" required><br><br>

        <button type="submit">Register</button>
    </form>

    <p>Already have an account?
        <a href="login.jsp">Login here</a>
    </p>
</div>

</body>
</html>
