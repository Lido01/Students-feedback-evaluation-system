<!DOCTYPE html>
<html>
<head>
    <title>Login | Student Feedback System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <h2>Login</h2>

    <form action="login" method="post">
        <label>School ID</label>
        <input type="text" name="schoolId"
               placeholder="UGR/00001/16" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>
    </form>

    <% if ("invalid".equals(request.getParameter("error"))) { %>
        <p class="error">Invalid School ID or Password</p>
    <% } %>

    <p style="margin-top:15px;">
        New user? <a href="register.jsp">Register here</a>
    </p>
</div>

</body>
</html>

