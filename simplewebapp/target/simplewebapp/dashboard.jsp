<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>

<h2>Welcome, <%= sessionObj.getAttribute("user") %></h2>

<p>This is the student dashboard.</p>

<a href="feedback.jsp">Give Feedback</a><br><br>
<a href="logout">Logout</a>

</body>
</html>
