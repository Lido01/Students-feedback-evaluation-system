<%-- Name: Dagmawi Wondwosen
     ID: Ugr/34184/16
     I tried to make a simple register page using JSP and HTML. 
     I am still learning, so maybe some things are not perfect.
     I tried adding error checking, but not sure if it will always work. --%>

<%@ page session="true" %>
<%@ include file="header.jsp" %>

<html>
<head>
    <title>Register Page</title>
    <!-- I think I linked css correctly, but sometimes it does not show styles -->
    <link rel="stylesheet" href="css/style.css"> 
</head>
<body>
    <h2>Register</h2>
    
    <%-- I try to show error message if username exists, but maybe it will show at wrong time --%>
    <% if(request.getParameter("error") != null){ %>
        <p class="error">Username already exists!</p>
    <% } %>
    
    <form action="register" method="post">
        <label>Username:</label><br>
        <input type="text" name="username" required><br><br>
        
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br> <%-- I forgot to add placeholder first, maybe I should --%>
        
        <label>Password:</label><br>
        <input type="password" name="password" required><br><br>
        
        <button type="submit">Register</button>
    </form>
    
    <p>Already registered? <a href="login.jsp">Login here</a></p>
    
    <%-- I tried to add footer include, but maybe header.jsp already has it --%>
</body>
</html>
