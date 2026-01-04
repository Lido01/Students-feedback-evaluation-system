<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%@ page import="com.example.feedbacksystem.models.User" %>

<%

    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Submit Feedback</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .feedback-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 25px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .feedback-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        textarea {
            width: 100%;
            height: 120px;
            padding: 10px;
            resize: none;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }


        .success {
            color: green;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
<div class="feedback-container">
    <h2>Submit Feedback</h2>

    <% if (request.getParameter("success") != null) { %>
        <p class="success">Feedback submitted successfully!</p>
    <% } %>

    <form action="submitFeedback" method="post">
        <textarea name="message" placeholder="Enter your feedback here..." required></textarea>
        <button type="submit">Submit Feedback</button>
    </form>
</div>
</body>
</html>
