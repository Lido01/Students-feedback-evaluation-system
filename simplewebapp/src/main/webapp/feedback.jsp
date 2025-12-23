<%@ page session="true" %>
<%@ include file="header.jsp" %>
<%@ page import="com.example.feedbacksystem.models.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"student".equals(user.getRole())){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<title>Feedback</title>
</head>
<body>
<h2>Submit Feedback</h2>
<% if(request.getParameter("success") != null){ %>
    <p class="success">Feedback submitted successfully!</p>
<% } %>
<form action="submitFeedback" method="post">
    <textarea name="message" placeholder="Enter feedback" required></textarea><br><br>
    <button type="submit">Submit</button>
</form>
</body>
</html>
