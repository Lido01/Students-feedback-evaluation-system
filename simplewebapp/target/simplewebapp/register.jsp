<html>
<head>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form action="register" method="post" class="card">
        <h2>Register</h2>

        <input name="schoolId" placeholder="School ID" required>
        <input name="fullName" placeholder="Full Name" required>
        <input name="email" type="email" placeholder="Email" required>
        <input name="phone" placeholder="Phone Number" required>

        <select name="role">
            <option>STUDENT</option>
            <option>INSTRUCTOR</option>
            <option>DEPARTMENT</option>
            <option>AFFAIRS</option>
            <option>ADMIN</option>
        </select>

        <input type="password" name="password" placeholder="Password" required>
        
        <button>Register</button>
    </form>
    <!-- if reggister fails -->
    <% if ("exists".equals(request.getParameter("error"))) { %>
        <p class="error">School ID already registered</p>
    <% } %>

    <!-- if reggistered before -->
    <% if ("success".equals(request.getParameter("status"))) { %>
        <p class="success">Registration successful! <a href="login.jsp">Login here</a>.</p>
    <% } %>
    <!-- login link -->
    <p style="margin-top:15px;">
        Already registered? <a href="login.jsp">Login here</a>
    </p>

</body>
</html>
