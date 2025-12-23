<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.*, com.example.feedbacksystem.models.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <!-- Optional Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #2c3e50;
            color: white;
            text-align: left;
            padding: 12px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .role {
            font-weight: 600;
            text-transform: capitalize;
        }

        @media (max-width: 768px) {
            .container {
                width: 95%;
            }
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Admin Dashboard – Users</h2>

    <table>
        <tr>
            <th>Username</th>
            <th>Role</th>
        </tr>

        <%
            Collection<User> users = (Collection<User>) request.getAttribute("users");
            for(User u : users){
        %>
        <tr>
            <td><%= u.getUsername() %></td>
            <td class="role"><%= u.getRole() %></td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
