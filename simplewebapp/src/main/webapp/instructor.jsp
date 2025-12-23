<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%@ page import="java.util.*,com.example.feedbacksystem.models.Feedback"%>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<title>Instructor Dashboard</title>
</head>
<body>
<h2>Instructor Dashboard - Feedback Received</h2>
<%
    List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
    if(feedbacks == null || feedbacks.isEmpty()){
%>
    <p>No feedback yet.</p>
<% } else { %>
    <ul>
    <% for(Feedback f: feedbacks){ %>
        <li><strong><%= f.getStudentName() %>:</strong> <%= f.getMessage() %></li>
    <% } %>
    </ul>
<% } %>
</body>
</html>
