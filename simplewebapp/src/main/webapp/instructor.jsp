<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.*,com.example.feedbacksystem.models.Feedback"%>

<!DOCTYPE html>
<html>
<head>
    <title>Instructor Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="dashboard-container">

    <div class="dashboard-header">
        <h2>Instructor Dashboard</h2>
        <p class="subtitle">Feedback Received</p>
    </div>

    <div class="feedback-section">
        <%
            List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
            if (feedbacks == null || feedbacks.isEmpty()) {
        %>
            <div class="empty-state">
                <p>No feedback yet.</p>
            </div>
        <%
            } else {
        %>
            <div class="feedback-list">
                <% for (Feedback f : feedbacks) { %>
                    <div class="feedback-card">
                        <p class="student-name"><strong><%= f.getStudentName() %></strong></p>
                        <p class="feedback-message"><%= f.getMessage() %></p>
                    </div>
                <% } %>
            </div>
        <%
            }
        %>
    </div>

</div>

</body>
</html>
