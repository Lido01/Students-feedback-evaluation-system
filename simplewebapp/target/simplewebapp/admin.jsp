<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.*, com.example.feedbacksystem.models.User" %>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<title>Admin Dashboard</title>
</head>
<body>
<h2>Admin Dashboard - Users</h2>
<table border="1" cellpadding="5">
<tr><th>Username</th><th>Role</th></tr>
<%
    Collection<User> users = (Collection<User>) request.getAttribute("users");
    for(User u: users){
%>
<tr><td><%= u.getUsername() %></td><td><%= u.getRole() %></td></tr>
<% } %>
</table>
</body>
</html>
