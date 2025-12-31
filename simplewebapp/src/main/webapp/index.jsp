<%
    if (session.getAttribute("role") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<%@ page session="true" %>
<jsp:include page="header.jsp" />

<div class="container">
    <h2>Welcome</h2>
    <p>Welcome to the Student Feedback Evaluation System.</p>
</div>
