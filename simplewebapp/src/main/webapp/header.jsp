<%@ page session="true" %>
<%
    com.example.feedbacksystem.models.User user = (com.example.feedbacksystem.models.User) session.getAttribute("user");
%>
<div class="header">
    <h1>Student Feedback System</h1>
    <% if(user!=null){ %>
        <p>Welcome, <%= user.getUsername() %> | <a href="logout">Logout</a></p>
    <% } else { %>
        <p><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></p>
    <% } %>
</div>
<hr>
