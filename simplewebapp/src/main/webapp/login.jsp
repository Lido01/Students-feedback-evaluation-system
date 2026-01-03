<%@ page session="true" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- Main stylesheet -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<h2>Login</h2>

<%
    /*
     * Read query parameters sent by LoginServlet
     * error=invalid    → wrong username or password
     * success=registered → user just registered successfully
     */
    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>

<!-- Error message -->
<% if ("invalid".equals(error)) { %>
    <p class="error">Invalid username or password.</p>
<% } %>

<!-- Success message after registration -->
<% if ("registered".equals(success)) { %>
    <p class="success">Registration successful. Please log in.</p>
<% } %>

<!-- Login form -->
<form action="login" method="post">

    <!-- Username field -->
    <label>Username:</label><br>
    <input type="text" name="username" required><br><br>

    <!-- Password field -->
    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>
</form>

<p>
    New user?
    <a href="register.jsp">Register here</a>
</p>

</body>
</html>
