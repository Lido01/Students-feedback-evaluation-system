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
    <title>Student Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard {
            background: #fff;
            width: 380px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
            text-align: center;
        }

        h2 {
            margin-bottom: 10px;
            color: #333;
        }

        p {
            color: #666;
            margin-bottom: 25px;
        }

        a {
            display: block;
            text-decoration: none;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

        .feedback {
            background: #667eea;
            color: white;
        }

        .feedback:hover {
            background: #556cd6;
        }

        .logout {
            background: #e74c3c;
            color: white;
        }

        .logout:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>

<div class="dashboard">
    <h2>Welcome, <%= sessionObj.getAttribute("user") %></h2>
    <p>This is the student dashboard.</p>

    <a href="feedback.jsp" class="feedback">Give Feedback</a>
    <a href="logout" class="logout">Logout</a>
</div>

</body>
</html>
